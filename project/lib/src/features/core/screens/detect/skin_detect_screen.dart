import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/constants/image_string.dart';
import 'package:project/src/features/core/controllers/skin_detect_controller.dart';

class SkinDetectScreen extends StatelessWidget {
  const SkinDetectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize the SkinDetectController
    final SkinDetectController imageController =
        Get.put(SkinDetectController());
    RxBool isSaveMode = false.obs;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: const Text('Skin Detect',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            child: Card(
              elevation: 50,
              shadowColor: Colors.black87,
              color: imageController.cardColor.value,
              child: SizedBox(
                width: double.infinity,
                height: 550,
                child: Column(
                  children: [
                    Obx(
                      () => CircleAvatar(
                        backgroundColor: imageController.subCircle.value,
                        radius: 160,
                        child: CircleAvatar(
                          backgroundColor: imageController.subCircle.value,
                          radius: 160,
                          child: CircleAvatar(
                            radius: 150,
                            backgroundImage: imageController
                                    .selectedImagePath.value.isNotEmpty
                                ? FileImage(File(
                                    imageController.selectedImagePath.value))
                                : const AssetImage(tFolder) as ImageProvider,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => Text(
                        imageController.result.value?.placement ??
                            'Skin Cancer Detection',
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {
                            if (isSaveMode.value) {
                              //perform save action
                              imageController.fetchHistory();
                            } else {
                              imageController.uploadImage();
                              isSaveMode.value = true;
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                            isSaveMode.value
                                ? Colors.red
                                : Colors.green[500] ??
                                    imageController.cardColor.value,
                          )),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                      isSaveMode.value
                                          ? Icons.save
                                          : Icons.search_off_rounded,
                                      color: Colors.black),
                                  const SizedBox(width: 10),
                                  Text(isSaveMode.value ? 'Save' : 'Detect',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showPopUpMenu(context);
          isSaveMode.value = false;
        },
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  void showPopUpMenu(BuildContext context) {
    final imageController = Get.find<SkinDetectController>();
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(MediaQuery.of(context).size.width - 150,
          MediaQuery.of(context).size.height - 200, 0, 0),
      items: [
        PopupMenuItem(
          child: InkWell(
            onTap: () {
              imageController.getImage(ImageSource.camera);
              Navigator.pop(context);
            },
            child: const Row(
              children: [
                Icon(Icons.camera_alt),
                SizedBox(width: 10),
                Text('Camera'),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          child: InkWell(
            onTap: () {
              imageController.getImage(ImageSource.gallery);
              Navigator.pop(context);
            },
            child: const Row(
              children: [
                Icon(Icons.image),
                SizedBox(width: 10),
                Text('Gallery'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
