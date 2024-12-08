import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class CropImage{
  
  static Future<CroppedFile?> cropImage(File image) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      aspectRatioPresets: [CropAspectRatioPreset.square],
      cropStyle: CropStyle.circle,
      compressQuality: 70,
      maxWidth: 700,
      maxHeight: 700,
      uiSettings: [
        AndroidUiSettings(
          hideBottomControls: true,
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
        )
      ],
    );
    return croppedFile;
  }
}