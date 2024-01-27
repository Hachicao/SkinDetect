import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/features/core/controllers/skin_detect_controller.dart';
import 'package:project/src/features/core/models/dashboard/disease_model.dart';

class CategoryDetailScreen extends StatelessWidget {
  final DiseaseModel diseaseModel;
  const CategoryDetailScreen({required this.diseaseModel, Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SkinDetectController>();
    String bulletpoint = '•'.padLeft(5);
    bulletpoint.toUpperCase();
    return Scaffold(
      backgroundColor: tbackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tAppbarColor,
        title: Text(diseaseModel.diseaseName,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: GetBuilder<SkinDetectController>(
        init: controller,
        builder: (controller) {
          if (controller.symptomController.text.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: controller.sectionColor.value,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    diseaseModel.diseaseName,
                                    style: const TextStyle(
                                      fontSize: 30,
                                      color: Color.fromARGB(255, 195, 32, 17),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),

                                // Overview
                                const Text(
                                  'Overview:',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 12, 99, 170),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: RichText(
                                    // softWrap: true,
                                    maxLines: 100,
                                    text: TextSpan(
                                      text: diseaseModel.diseaseOverview
                                          .replaceAll(
                                        '*',
                                        bulletpoint,
                                      ),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(height: 10),

                                // Symptoms
                                const Text(
                                  'Symptoms:',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 12, 99, 170),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: RichText(
                                    maxLines: 100,
                                    text: TextSpan(
                                      text: controller.symptomController.text
                                          .replaceAll(
                                        '*',
                                        bulletpoint,
                                      ),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(height: 10),

                                // Causes
                                const Text(
                                  'Causes:',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 12, 99, 170),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: RichText(
                                    softWrap: true,
                                    maxLines: 100,
                                    text: TextSpan(
                                      text: controller.causesController.text
                                          .replaceAll('*', bulletpoint),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(height: 10),

                                // Prevention
                                const Text(
                                  'Prevention:',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 12, 99, 170),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: RichText(
                                    softWrap: true,
                                    maxLines: 100,
                                    text: TextSpan(
                                      text: controller.preventionController.text
                                          .replaceAll('*', bulletpoint),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.grey.withOpacity(0.5),
                                    //     spreadRadius: 2,
                                    //     blurRadius: 5,
                                    //     offset: const Offset(0, 3),
                                    //   ),
                                    // ],
                                  ),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                    ),
                                    itemCount: diseaseModel.imageURls.length,
                                    itemBuilder: (context, index) {
                                      String base64EncodedImage =
                                          diseaseModel.imageURls[index];
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: SizedBox(
                                          height: 200,
                                          child: Image.memory(
                                            base64Decode(base64EncodedImage),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
