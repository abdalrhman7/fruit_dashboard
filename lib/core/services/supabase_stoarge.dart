import 'dart:io';

import 'package:fruit_dashboard/core/services/storage_service.dart';
import 'package:fruit_dashboard/core/utils/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageService extends StorageService {
  static late Supabase _supabase;

  static createBucket(String buketName) async {
    return _supabase.client.storage.createBucket(buketName);
  }

  static Future<void> initSubabase() async {
    _supabase = await Supabase.initialize(
      url: Constant.supabaseUrl,
      anonKey: Constant.supabaseKey,
    );
  }

  @override
  Future<String> uploadImage(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    await _supabase.client.storage
        .from('fruits_images')
        .upload('$path/$fileName.$extensionName', file);
    final String publicUrl = _supabase.client.storage
        .from('fruits_images')
        .getPublicUrl('$path/$fileName.$extensionName');
    print(publicUrl);
    return publicUrl;
  }
}
