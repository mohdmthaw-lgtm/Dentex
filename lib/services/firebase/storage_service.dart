import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

/// Handles product image uploads. Images are compressed client-side before
/// upload to control Storage cost/bandwidth, and always written to a fixed
/// filename per product so re-uploading on edit overwrites in place rather
/// than accumulating an upload history nobody asked for.
class StorageService {
  StorageService({FirebaseStorage? storage})
      : _storage = storage ?? FirebaseStorage.instance;

  final FirebaseStorage _storage;

  Future<String> uploadProductImage({
    required String productId,
    required File file,
  }) async {
    final compressed = await _compress(file);
    final ref = _storage.ref('products/$productId/main.jpg');
    await ref.putFile(compressed);
    return ref.getDownloadURL();
  }

  Future<File> _compress(File file) async {
    final tempDir = await getTemporaryDirectory();
    final targetPath =
        '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 80,
      minWidth: 1024,
      minHeight: 1024,
    );
    if (result == null) return file;
    return File(result.path);
  }

  String productImagePath(String productId) => 'products/$productId/main.jpg';
}
