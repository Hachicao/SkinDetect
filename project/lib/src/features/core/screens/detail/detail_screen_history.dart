import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/features/core/controllers/skin_detect_controller.dart';
import 'package:project/src/features/core/models/dashboard/history_model.dart';

class SkinDetailHistoryScreen extends StatelessWidget {
  final HistoryModel historyItem;
  const SkinDetailHistoryScreen({required this.historyItem, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SkinDetectController>();

    return Scaffold(
      backgroundColor: tbackgroundColor,
      appBar: AppBar(
        backgroundColor: tAppbarColor,
        elevation: 0,
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(LineAwesomeIcons.arrow_circle_left,
              color: Colors.blue),
          iconSize: 30,
        ),
        title: const Text(
          'Detail History',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<SkinDetectController>(
        init: controller,
        builder: (controller) {
          double? scorePercentage = historyItem.detectScore;
          String formattedPercentage =
              (scorePercentage * 100).toStringAsFixed(2);
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ID#${(historyItem.detectId ?? 0)}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat('HH:mm MMMM dd, yyyy')
                                .format(DateTime.parse(historyItem.detectDate)),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              LineAwesomeIcons.share_square,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                      Hero(
                        tag: 'image${historyItem.detectId}', // Use the same tag
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            height: 200,
                            child: Image.memory(
                              base64Decode(historyItem.detectPhoto),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Threat level",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.8),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Obx(
                                    () => Text(
                                      controller.textLevel.value?.data ?? 'Low',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  CircularPercentIndicator(
                                    radius: 30,
                                    lineWidth: 10.0,
                                    animation: true,
                                    percent: scorePercentage,
                                    center: Text(
                                      '$formattedPercentage%', // Display the score as a percentage
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.0),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor:
                                        controller.sectionColor.value,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Name:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 12, 99, 170),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      historyItem.detectName,
                                      softWrap: true,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 195, 32, 17),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Over view:',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 12, 99, 170),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: RichText(
                                      softWrap: true,
                                      maxLines: 4,
                                      text: TextSpan(
                                        text: controller.overViewController.text
                                            .replaceAll('*', '•'.padLeft(5)),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Symptoms:',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 12, 99, 170),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: RichText(
                                      softWrap: true,
                                      maxLines: 4,
                                      text: TextSpan(
                                        text: controller.symptomController.text
                                            .replaceAll('*', '•'.padLeft(5)),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Causes:',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 12, 99, 170),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: RichText(
                                      softWrap: true,
                                      maxLines: 4,
                                      text: TextSpan(
                                        text: controller.causesController.text
                                            .replaceAll('*', '•'.padLeft(5)),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Prevention:',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 12, 99, 170),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: RichText(
                                      softWrap: true,
                                      maxLines: 4,
                                      text: TextSpan(
                                        text: controller
                                            .preventionController.text
                                            .replaceAll('*', '•'.padLeft(5)),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
        },
      ),
    );
  }
}
