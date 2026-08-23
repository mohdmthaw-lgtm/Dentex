import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/security/field_encryption.dart';
import 'account_request_repository.dart';
import 'activity_log_repository.dart';
import 'appointment_repository.dart';
import 'auth_service.dart';
import 'consumption_mapping_repository.dart';
import 'expense_repository.dart';
import 'fcm_service.dart';
import 'medical_center_repository.dart';
import 'offer_repository.dart';
import 'order_repository.dart';
import 'patient_repository.dart';
import 'product_repository.dart';
import 'shipment_repository.dart';
import 'supplier_repository.dart';
import 'stats_repository.dart';
import 'storage_service.dart';
import 'tooth_photo_repository.dart';
import 'user_repository.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
final userRepositoryProvider =
    Provider<UserRepository>((ref) => UserRepository());
final productRepositoryProvider =
    Provider<ProductRepository>((ref) => ProductRepository());
final offerRepositoryProvider =
    Provider<OfferRepository>((ref) => OfferRepository());
final shipmentRepositoryProvider =
    Provider<ShipmentRepository>((ref) => ShipmentRepository());
final supplierRepositoryProvider =
    Provider<SupplierRepository>((ref) => SupplierRepository());
final orderRepositoryProvider =
    Provider<OrderRepository>((ref) => OrderRepository());
final activityLogRepositoryProvider =
    Provider<ActivityLogRepository>((ref) => ActivityLogRepository());
final statsRepositoryProvider =
    Provider<StatsRepository>((ref) => StatsRepository());
final storageServiceProvider =
    Provider<StorageService>((ref) => StorageService());
final fcmServiceProvider = Provider<FcmService>((ref) => FcmService());
final accountRequestRepositoryProvider =
    Provider<AccountRequestRepository>((ref) => AccountRequestRepository());
final fieldEncryptionServiceProvider =
    Provider<FieldEncryptionService>((ref) => const FieldEncryptionService());
final patientRepositoryProvider =
    Provider<PatientRepository>((ref) => PatientRepository());
final medicalCenterRepositoryProvider =
    Provider<MedicalCenterRepository>((ref) => MedicalCenterRepository());
final appointmentRepositoryProvider =
    Provider<AppointmentRepository>((ref) => AppointmentRepository());
final expenseRepositoryProvider =
    Provider<ExpenseRepository>((ref) => ExpenseRepository());
final toothPhotoRepositoryProvider =
    Provider<ToothPhotoRepository>((ref) => ToothPhotoRepository());
final consumptionMappingRepositoryProvider =
    Provider<ConsumptionMappingRepository>((ref) => ConsumptionMappingRepository());
