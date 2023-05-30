import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/constants/image_string.dart';
import 'package:project/src/constants/size.dart';
import 'package:project/src/constants/text_string.dart';
import 'package:project/src/features/core/controllers/skin_detect_controller.dart';

class SkinDetectScreen extends StatelessWidget {
  const SkinDetectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SkinDetectController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: const Text('Skin Detect',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => controller.selectedImagePath.value == ''
                  ? const Image(image: AssetImage(tSlashImage))
                  : Image.file(File(controller.selectedImagePath.value))),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Congatulation ! You don't have any problem.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "URL",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //upload image
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    controller.getImage(ImageSource.gallery);
                  },
                  label: Text(tUploadImg.toUpperCase()),
                  icon: const Icon(Icons.upload_file_outlined),
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // take picture
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    controller.getImage(ImageSource.camera);
                  },
                  label: Text(tTakePhoto.toUpperCase()),
                  icon: const Icon(Icons.camera_alt_outlined),
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
