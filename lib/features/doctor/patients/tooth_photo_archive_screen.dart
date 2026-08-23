import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' hide TextDirection;

import '../../../core/constants/dental_chart.dart';
import '../../../models/patient.dart';
import '../../../models/tooth_photo.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/service_providers.dart';

final _dateFormat = DateFormat.yMMMd('ar');

class ToothArchiveArgs {
  const ToothArchiveArgs({
    required this.profile,
    required this.patientId,
    required this.toothNumber,
  });

  final UserProfile profile;
  final String patientId;
  final String toothNumber;
}

/// A single tooth's photo archive — every photo tied to that tooth across
/// every visit, grouped by session (see [ToothPhoto.visitId]) so a
/// returning patient's history reads as a real documented timeline, not
/// just a loose photo dump. New uploads must be tied to an existing visit
/// for that tooth — see [_UploadSheet].
class ToothPhotoArchiveScreen extends ConsumerWidget {
  const ToothPhotoArchiveScreen({super.key, required this.args});

  final ToothArchiveArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoRepo = ref.watch(toothPhotoRepositoryProvider);
    final patientRepo = ref.watch(patientRepositoryProvider);
    final ownerId = args.profile.clinicOwnerId;
    final ownerType = args.profile.clinicOwnerType;

    return Scaffold(
      appBar: AppBar(title: Text('أرشيف — ${DentalChart.arabicLabel(args.toothNumber)}')),
      floatingActionButton: StreamBuilder<List<Visit>>(
        stream: patientRepo.watchVisits(args.patientId, ownerId, ownerType),
        builder: (context, visitsSnap) {
          final toothVisits = (visitsSnap.data ?? [])
              .where((v) => v.toothNumber == args.toothNumber)
              .toList();
          return FloatingActionButton(
            onPressed: toothVisits.isEmpty
                ? () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('سجّل زيارة لهذا السن أولًا قبل إضافة صور')))
                : () => _upload(context, ref, toothVisits),
            child: const Icon(Icons.add_a_photo_outlined),
          );
        },
      ),
      body: StreamBuilder<List<ToothPhoto>>(
        stream: photoRepo.watchToothPhotos(args.patientId, ownerId, ownerType, args.toothNumber),
        builder: (context, photosSnap) {
          if (photosSnap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final photos = photosSnap.data ?? [];
          if (photos.isEmpty) {
            return const Center(child: Text('لا توجد صور مؤرشفة لهذا السن بعد'));
          }
          final byVisit = <String, List<ToothPhoto>>{};
          for (final p in photos) {
            byVisit.putIfAbsent(p.visitId, () => []).add(p);
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: byVisit.entries.map((entry) {
              final group = entry.value;
              final date = group.first.uploadedAt;
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date == null ? 'جلسة' : _dateFormat.format(date),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: group.length,
                      itemBuilder: (context, i) => _PhotoThumb(photo: group[i]),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Future<void> _upload(BuildContext context, WidgetRef ref, List<Visit> toothVisits) async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (c) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('التقاط صورة'),
              onTap: () => Navigator.pop(c, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('اختيار من المعرض'),
              onTap: () => Navigator.pop(c, ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
    if (source == null) return;

    final picked = await ImagePicker().pickImage(source: source, imageQuality: 90);
    if (picked == null || !context.mounted) return;

    final result = await showModalBottomSheet<_UploadChoice>(
      context: context,
      isScrollControlled: true,
      builder: (c) => _UploadSheet(toothVisits: toothVisits),
    );
    if (result == null || !context.mounted) return;

    try {
      final storage = ref.read(storageServiceProvider);
      final uploaded = await storage.uploadToothPhoto(
        ownerId: args.profile.clinicOwnerId,
        patientId: args.patientId,
        toothNumber: args.toothNumber,
        visitId: result.visitId,
        file: File(picked.path),
      );
      await ref.read(toothPhotoRepositoryProvider).addToothPhoto(
            patientId: args.patientId,
            ownerId: args.profile.clinicOwnerId,
            ownerType: args.profile.clinicOwnerType,
            toothNumber: args.toothNumber,
            visitId: result.visitId,
            category: result.category,
            storageUrl: uploaded.url,
            storagePath: uploaded.path,
            uploadedByUid: args.profile.uid,
          );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تعذر رفع الصورة: $e')));
      }
    }
  }
}

class _UploadChoice {
  const _UploadChoice({required this.visitId, required this.category});
  final String visitId;
  final String category;
}

class _UploadSheet extends StatefulWidget {
  const _UploadSheet({required this.toothVisits});
  final List<Visit> toothVisits;

  @override
  State<_UploadSheet> createState() => _UploadSheetState();
}

class _UploadSheetState extends State<_UploadSheet> {
  late String _visitId = widget.toothVisits.first.id;
  String _category = ToothPhotoCategory.before;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('تصنيف الصورة', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            SegmentedButton<String>(
              segments: ToothPhotoCategory.all
                  .map((c) => ButtonSegment(value: c, label: Text(ToothPhotoCategory.labels[c]!)))
                  .toList(),
              selected: {_category},
              onSelectionChanged: (s) => setState(() => _category = s.first),
            ),
            const SizedBox(height: 16),
            if (widget.toothVisits.length > 1) ...[
              Text('الجلسة', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                initialValue: _visitId,
                items: widget.toothVisits
                    .map((v) => DropdownMenuItem(
                          value: v.id,
                          child: Text(v.visitDate == null
                              ? TreatmentType.labels[v.treatmentType] ?? ''
                              : '${_dateFormat.format(v.visitDate!)} — ${TreatmentType.labels[v.treatmentType] ?? ''}'),
                        ))
                    .toList(),
                onChanged: (v) => setState(() => _visitId = v ?? _visitId),
              ),
              const SizedBox(height: 16),
            ],
            FilledButton(
              onPressed: () =>
                  Navigator.pop(context, _UploadChoice(visitId: _visitId, category: _category)),
              child: const Text('رفع الصورة'),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhotoThumb extends StatelessWidget {
  const _PhotoThumb({required this.photo});
  final ToothPhoto photo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (c) => Dialog(
          child: CachedNetworkImage(imageUrl: photo.storageUrl, fit: BoxFit.contain),
        ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: photo.storageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              placeholder: (c, u) => Container(color: Colors.grey.shade200),
              errorWidget: (c, u, e) => Container(
                color: Colors.grey.shade200,
                child: const Icon(Icons.broken_image_outlined),
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                ToothPhotoCategory.labels[photo.category] ?? '',
                style: const TextStyle(color: Colors.white, fontSize: 9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
