import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/constants/image_string.dart';
import 'package:project/src/features/core/controllers/skin_detect_controller.dart';
import 'package:project/src/features/core/screens/detail/detail_screen.dart';
import 'package:project/src/features/core/screens/main_dashboard/dashboard.dart';

class SkinDetectScreen extends StatelessWidget {
  const SkinDetectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize the SkinDetectController
    final SkinDetectController imageController =
        Get.put(SkinDetectController());
    final skinDetectController = Get.find<SkinDetectController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[100],
        elevation: 0,
        leading: IconButton(
            onPressed: () => const Dashboard(),
            icon: const Icon(LineAwesomeIcons.arrow_circle_left,
                color: Colors.blue),
            iconSize: 30,
            selectedIcon: const Icon(LineAwesomeIcons.arrow_circle_right,
                color: Colors.black)),
        title: const Text('Detail',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blueGrey[100],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.grey[50],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Text(
                            'ID#${(skinDetectController.result.value?.id ?? 0)}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Obx(() {
                          final result = skinDetectController.result.value;
                          final date = result
                              ?.date; // Assuming date is part of the Result class
                          final time = result
                              ?.time; // Assuming time is part of the Result class

                          final formattedDateTime = date != null && time != null
                              ? DateFormat('HH:mm MMMM dd, yyyy').format(
                                  DateTime.parse('$date $time'),
                                )
                              : 'Date and Time Not Available'; // Provide a default message if date and time are not available

                          return Text(
                            formattedDateTime,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          );
                        }),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            LineAwesomeIcons.download,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 300,
                        child: Obx(
                          () => imageController.selectedImagePath.value == ''
                              ? const Image(image: AssetImage(tTestIamge))
                              : Image.file(
                                  File(imageController.selectedImagePath.value),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Obx(
                        () => Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: imageController.sectionColor.value,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3)),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Threat level",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black.withOpacity(0.8)),
                                  ),
                                  const SizedBox(width: 20),
                                  Obx(
                                    () => Text(
                                      imageController.textLevel.value?.data ??
                                          'Low',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Additional examination is not required",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.8),
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3)),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Obx(
                                () => Text(
                                  imageController.result.value?.placement ??
                                      'Name of the disease',
                                  softWrap: true,
                                  maxLines: 3,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 12, 99, 170),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Obx(
                                  () => Text(
                                    '${((imageController.result.value?.score ?? 0) * 100).toStringAsFixed(1)}%', // Display the score
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 12, 99, 170),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await skinDetectController.fetchDetail();
                                    Get.to(() => const SkinDetailScreen());
                                  },
                                  icon: const Icon(LineAwesomeIcons.angle_right,
                                      color: Color.fromARGB(255, 12, 99, 170)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          imageController.uploadImage();
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Detect",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          showPopUpMenu(context);
        },
        child: const Icon(Icons.add_a_photo_rounded),
      ),
    );
  }
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
