import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SkinDetectController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  //crop image
  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;

  //compress code
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: imageSource);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      // selectedImageSize = (((File(selectedImagePath.value)))) as RxString;
      // final cropImageFile = await ImageCropper().cropImage(
      //     sourcePath: selectedImagePath.value,
      //     maxWidth: 512,
      //     maxHeight: 512,
      //     compressFormat: ImageCompressFormat.png);
      // cropImagePath.value = cropImageFile!.path;

      // compress
      // final dir = await Directory.systemTemp;
      // final targetPath = dir.absolute.path + "/temp.png";
      // var compressedFile = await FlutterImageCompress.compressAndGetFile(
      //     compressImagePath.value, targetPath,
      //     quality: 90);
      // compressImagePath.value = compressedFile!.path;
    } else {
      Get.snackbar("Error", "No image selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void uploadImage(File file) {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
  }
}
