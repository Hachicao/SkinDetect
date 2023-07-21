import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:project/src/common_widgets/api_constanst/api_constanst.dart';
import 'package:project/src/features/core/controllers/user_controller.dart';
import 'package:project/src/features/authentication/models/user_model.dart';
import 'package:project/src/features/core/models/dashboard/result.dart';

class SkinDetectController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  final apiUrl = APIConstants.getImageUrl;
  Rx<Result?> result = Rx<Result?>(null);
  Rx<User?> user = Rx<User?>(null);
  void getImage(ImageSource imageSource) async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: imageSource);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar("Error", "No image selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  Future<void> uploadImage() async {
    final file = File(selectedImagePath.value);
    if (!file.existsSync()) {
      Get.snackbar("Error", "Image not found",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    try {
      final bytes = await file.readAsBytes();
      final base64Image = base64Encode(bytes);
      final confidence_score = 0.9;
      final userController = Get.find<UserController>();
      final user_id = await userController.getUserId();
      print("user_id : $user_id ");
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'file': base64Image,
          'confidence_score': confidence_score.toString(),
          'user_id': user_id.toString()
        },
      );

      // Handle the API response
      if (response.statusCode == 200) {
        // Success
        print('Image uploaded successfully');
        final jsonResponse = jsonDecode(response.body);
        result.value = Result.fromJson(jsonResponse);
        print('Placement: ${result.value!.placement}');
        print('Ymin: ${result.value!.ymin}');
        print('Xmin: ${result.value!.xmin}');
        print('Ymax: ${result.value!.ymax}');
        print('Xmax: ${result.value!.xmax}');
        print('Score: ${result.value!.score}');
      } else {
        // Error
        print('Failed to upload image. Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurred while uploading image: $e');
    } finally {
      Get.back(); // Close the progress dialog
    }
  }
}
