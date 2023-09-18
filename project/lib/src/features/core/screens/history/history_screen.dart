import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/constants/text_string.dart';
import 'package:project/src/features/authentication/models/user_model.dart';
import 'package:project/src/features/core/controllers/skin_detect_controller.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({Key? key}) : super(key: key);
  final skinDetectController = Get.find<SkinDetectController>();

  final Rx<User?> _userRx = Rx<User?>(null);
  @override
  Widget build(BuildContext context) {
    // Fetch history when the screen is built
    skinDetectController.fetchHistory();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: const Text(
          tHistory,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() {
        // check if the user has changed
        // final user = skinDetectController.currentUser.value;
        // if (user == null) {
        //   return const Center(
        //     child: Text('No User Logged in.'),
        //   );
        // }
        // check if the history list is empty
        if (skinDetectController.historyList.isEmpty) {
          return const Center(
            child: Text('No data available.'),
          );
        } else {
          return ListView.builder(
            itemCount: skinDetectController.historyList.length,
            itemBuilder: (BuildContext context, int index) {
              final historyItem = skinDetectController.historyList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    leading: Image.memory(
                      base64Decode(historyItem.image),
                      fit: BoxFit.cover,
                      width: 70,
                      height: 70,
                    ),
                    title: Text(
                      historyItem.name,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      historyItem.dateTime,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        // Handle delete action here
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: tPrimaryColor,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
