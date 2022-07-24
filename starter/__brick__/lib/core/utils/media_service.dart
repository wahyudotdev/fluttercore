import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../di/injection.dart';
import 'permission_service.dart';

enum AppImageSource {
  camera,
  gallery,
}

abstract class MediaService {
  PermissionService get permissionService;

  Future<File?> getImage(
    BuildContext context,
    AppImageSource appImageSource, {
    bool shouldCompress = true,
  });

  Future<File?> compressFile(File file, {int quality = 30});
}

@Injectable(as: MediaService)
class MediaServiceImpl implements MediaService {
  @override
  PermissionService get permissionService => getIt<PermissionService>();

  Future<bool> _handleImageUploadPermissions(
      BuildContext context, AppImageSource? imageSource) async {
    if (imageSource == null) {
      return false;
    }
    if (imageSource == AppImageSource.camera) {
      return await permissionService.handleCameraPermission(context);
    } else if (imageSource == AppImageSource.gallery) {
      return await permissionService.handlePhotosPermission(context);
    } else {
      return false;
    }
  }

  @override
  Future<File?> getImage(
    BuildContext context,
    AppImageSource appImageSource, {
    bool shouldCompress = true,
  }) async {
    // Handle permissions according to image source,
    bool canProceed =
        await _handleImageUploadPermissions(context, appImageSource);

    if (canProceed) {
      File? processedPickedImageFile;

      // Convert our own AppImageSource into a format readable by the used package
      // In this case it's an ImageSource enum
      ImageSource? imageSource = ImageSource.values.byName(appImageSource.name);

      final imagePicker = ImagePicker();
      final rawPickedImageFile =
          await imagePicker.pickImage(source: imageSource, imageQuality: 50);

      if (rawPickedImageFile != null) {
        //to convert from XFile type provided by the package to dart:io's File type
        processedPickedImageFile = File(rawPickedImageFile.path);
        if (shouldCompress) {
          processedPickedImageFile =
              await compressFile(processedPickedImageFile);
        }
      }
      return processedPickedImageFile;
    }
    return null;
  }

  @override
  Future<File?> compressFile(File file, {int quality = 30}) async {
    final dir = await getTemporaryDirectory();
    final randomName = const Uuid().v4();
    final targetPath = '${dir.absolute.path}/$randomName-temp.jpg';

    return await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: quality,
    );
  }
}
