import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constants/firestore_paths.dart';
import '../../models/shipment.dart';

class ShipmentRepository {
  ShipmentRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  CollectionReference<Map<String, dynamic>> get _shipments =>
      _db.collection(FirestorePaths.shipments);

  Stream<List<Shipment>> watchShipments({String? status}) {
    Query<Map<String, dynamic>> query =
        _shipments.orderBy('createdAt', descending: true);
    if (status != null) {
      query = query.where('status', isEqualTo: status);
    }
    return query.snapshots().map((snap) =>
        snap.docs.map((d) => Shipment.fromDoc(d.id, d.data())).toList());
  }

  Future<Shipment?> getShipment(String shipmentId) async {
    final doc = await _shipments.doc(shipmentId).get();
    if (!doc.exists) return null;
    return Shipment.fromDoc(doc.id, doc.data()!);
  }

  Stream<Shipment?> watchShipment(String shipmentId) {
    return _shipments
        .doc(shipmentId)
        .snapshots()
        .map((doc) => doc.exists ? Shipment.fromDoc(doc.id, doc.data()!) : null);
  }

  /// "SH-0001", "SH-0002", ... via a transactional counter doc so two admin
  /// sessions creating a shipment at the same moment never collide on the
  /// same number.
  Future<String> _nextShipmentNumber() {
    final counterRef = _db
        .collection(FirestorePaths.counters)
        .doc(FirestorePaths.countersShipmentsDoc);
    return _db.runTransaction<String>((tx) async {
      final snap = await tx.get(counterRef);
      final next = ((snap.data()?['value'] as num?) ?? 0).toInt() + 1;
      tx.set(counterRef, {'value': next}, SetOptions(merge: true));
      return 'SH-${next.toString().padLeft(4, '0')}';
    });
  }

  Future<String> createShipment({
    required String supplierName,
    required String purchaseOrderNumber,
    required String shippingCompany,
    required String shippingAgent,
    required String shipmentType,
    required String originCountry,
    required String containerNumber,
    required DateTime? shipDate,
    required DateTime? expectedArrivalDate,
    required String notes,
    required List<ShipmentItem> items,
    required ShipmentCosts costs,
    required String currency,
  }) async {
    final shipmentNumber = await _nextShipmentNumber();
    final ref = await _shipments.add({
      'shipmentNumber': shipmentNumber,
      'supplierName': supplierName,
      'purchaseOrderNumber': purchaseOrderNumber,
      'shippingCompany': shippingCompany,
      'shippingAgent': shippingAgent,
      'shipmentType': shipmentType,
      'originCountry': originCountry,
      'containerNumber': containerNumber,
      'shipDate': shipDate == null ? null : Timestamp.fromDate(shipDate),
      'expectedArrivalDate':
          expectedArrivalDate == null ? null : Timestamp.fromDate(expectedArrivalDate),
      'notes': notes,
      'status': ShipmentStatus.preparing,
      'items': items.map((i) => i.toJson()).toList(),
      'costs': costs.toJson(),
      'currency': currency,
      'documents': <Map<String, dynamic>>[],
      'receivedAt': null,
      'receivedCartons': 0,
      'receivingNotes': '',
      'createdAt': FieldValue.serverTimestamp(),
    });
    return ref.id;
  }

  Future<void> updateShipment({
    required String shipmentId,
    required String supplierName,
    required String purchaseOrderNumber,
    required String shippingCompany,
    required String shippingAgent,
    required String shipmentType,
    required String originCountry,
    required String containerNumber,
    required DateTime? shipDate,
    required DateTime? expectedArrivalDate,
    required String notes,
    required List<ShipmentItem> items,
    required ShipmentCosts costs,
    required String currency,
  }) {
    return _shipments.doc(shipmentId).update({
      'supplierName': supplierName,
      'purchaseOrderNumber': purchaseOrderNumber,
      'shippingCompany': shippingCompany,
      'shippingAgent': shippingAgent,
      'shipmentType': shipmentType,
      'originCountry': originCountry,
      'containerNumber': containerNumber,
      'shipDate': shipDate == null ? null : Timestamp.fromDate(shipDate),
      'expectedArrivalDate':
          expectedArrivalDate == null ? null : Timestamp.fromDate(expectedArrivalDate),
      'notes': notes,
      'items': items.map((i) => i.toJson()).toList(),
      'costs': costs.toJson(),
      'currency': currency,
    });
  }

  Future<void> updateStatus(String shipmentId, String status) {
    return _shipments.doc(shipmentId).update({'status': status});
  }

  Future<void> receiveShipment({
    required String shipmentId,
    required int receivedCartons,
    required String receivingNotes,
  }) {
    return _shipments.doc(shipmentId).update({
      'status': ShipmentStatus.received,
      'receivedAt': FieldValue.serverTimestamp(),
      'receivedCartons': receivedCartons,
      'receivingNotes': receivingNotes,
    });
  }

  Future<void> addDocument({
    required String shipmentId,
    required ShipmentDocument document,
  }) {
    return _shipments.doc(shipmentId).update({
      'documents': FieldValue.arrayUnion([
        {
          'label': document.label,
          'url': document.url,
          'path': document.path,
          'uploadedAt': Timestamp.now(),
        }
      ]),
    });
  }

  /// Read-modify-write rather than arrayRemove: arrayRemove needs an exact
  /// field-for-field map match, and the stored `uploadedAt` Timestamp won't
  /// round-trip identically through a client-reconstructed DateTime.
  Future<void> removeDocument({
    required String shipmentId,
    required ShipmentDocument document,
  }) async {
    final doc = await _shipments.doc(shipmentId).get();
    final current = (doc.data()?['documents'] as List<dynamic>? ?? [])
        .cast<Map<String, dynamic>>();
    final updated = current.where((d) => d['path'] != document.path).toList();
    await _shipments.doc(shipmentId).update({'documents': updated});
  }

  Future<void> deleteShipment(String shipmentId) {
    return _shipments.doc(shipmentId).delete();
  }
}
