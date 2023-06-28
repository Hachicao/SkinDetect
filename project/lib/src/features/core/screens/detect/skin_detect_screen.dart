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
  const SkinDetectScreen({Key? key}) : super(key: key);

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
            children: [
              Obx(() => controller.selectedImagePath.value == ''
                  ? const Image(image: AssetImage(tSlashImage))
                  : Image.file(File(controller.selectedImagePath.value))),
              const SizedBox(
                height: 10,
              ),
              Obx(() {
                final result = controller.result.value;
                if (result == null) {
                  return const Text(
                    'Congratulation! Your skin is in excellent condition.',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ); // Display nothing while result is null
                } else {
                  return Text(
                    result.placement,
                    style: const TextStyle(fontSize: 20, color: Colors.red),
                  );
                }
              }),
              const SizedBox(
                height: 10,
              ),
              // TextFormField(
              //   decoration: const InputDecoration(
              //     labelText: "URL",
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              //upload image
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        controller.getImage(ImageSource.gallery);
                      },
                      label: Text(tUploadImg.toUpperCase()),
                      icon: const Icon(Icons.upload_file_outlined),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 0,
                        side: const BorderSide(color: Colors.blue),
                        padding:
                            const EdgeInsets.symmetric(vertical: tButtonHeight),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        controller.getImage(ImageSource.camera);
                      },
                      label: Text(tTakePhoto.toUpperCase()),
                      icon: const Icon(Icons.camera_alt_outlined),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 0,
                        side: const BorderSide(color: Colors.blue),
                        padding:
                            const EdgeInsets.symmetric(vertical: tButtonHeight),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    controller.uploadImage();
                  },
                  label: Text(tDetect.toUpperCase()),
                  icon: const Icon(Icons.search_outlined),
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
