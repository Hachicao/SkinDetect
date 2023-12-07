import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/constants/image_string.dart';
import 'package:project/src/features/core/controllers/skin_detect_controller.dart';

class ListDetailScreen extends StatefulWidget {
  ListDetailScreen({Key? key}) : super(key: key);

  @override
  _ListDetailScreenState createState() => _ListDetailScreenState();
}

class _ListDetailScreenState extends State<ListDetailScreen> {
  final skinDetectController = Get.find<SkinDetectController>();
  @override
  void initState() {
    super.initState();
    skinDetectController.fetchListDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tbackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        elevation: 0,
        title: const Text(
          "List Detail",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontStyle: FontStyle.normal,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Category",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => Expanded(
              child: GridView.builder(
                itemCount: skinDetectController.detailList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, int index) {
                  final imageCategory = skinDetectController.detailList[index];
                  Image categoryImage;
                  final base64Avatar = imageCategory.diseasePhoto1;
                  try {
                    final decodedAvatar = base64.decode(base64Avatar);
                    categoryImage =
                        Image.memory(decodedAvatar, fit: BoxFit.cover);
                  } catch (e) {
                    print('Error decoding userAvatar: $e');
                    categoryImage = Image.asset(
                        tProfileLogo); // Replace with a default image
                  }
                  return Container(
                    height: 100,
                    margin: EdgeInsets.zero,
                    color: Colors.blue[50],
                    child: Center(
                      child: ClipRRect(
                        child: categoryImage,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
