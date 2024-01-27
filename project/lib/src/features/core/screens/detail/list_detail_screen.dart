import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/constants/image_string.dart';
import 'package:project/src/features/core/controllers/skin_detect_controller.dart';
import 'package:project/src/features/core/screens/detail/catergories_screen.dart';

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
          "DermAtlas",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
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
              "All Categories",
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
                  final base64Avatar = imageCategory.imageURls[0];
                  try {
                    final decodedAvatar = base64.decode(base64Avatar);
                    categoryImage =
                        Image.memory(decodedAvatar, fit: BoxFit.cover);
                  } catch (e) {
                    print('Error decoding userAvatar: $e');
                    categoryImage = Image.asset(
                        tProfileLogo); // Replace with a default image
                  }
                  return GestureDetector(
                    onTap: () {
                      skinDetectController.fetchDetail(imageCategory.diseaseId);
                      Get.to(() =>
                          CategoryDetailScreen(diseaseModel: imageCategory));
                    },
                    child: Container(
                      height: 100,
                      margin: EdgeInsets.zero,
                      // color: Colors.blue[50],
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: categoryImage,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  if (imageCategory.diseaseName ==
                                      "Skin Lesions")
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.green,
                                      size: 15,
                                    ),
                                  if (imageCategory.diseaseName ==
                                      "Melanocytic Nevi")
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.red,
                                      size: 15,
                                    ),
                                  if (imageCategory.diseaseName == "Melanoma")
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.red,
                                      size: 15,
                                    ),
                                  if (imageCategory.diseaseName ==
                                      "Dermatofibroma")
                                    const Icon(
                                      Icons.warning,
                                      color: Color.fromARGB(255, 199, 192, 128),
                                      size: 15,
                                    ),
                                  if (imageCategory.diseaseName ==
                                      "Actinic keratosis")
                                    const Icon(
                                      Icons.warning,
                                      color: Color.fromARGB(255, 199, 192, 128),
                                      size: 15,
                                    ),
                                  if (imageCategory.diseaseName ==
                                      "Basal cell carcinoma")
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.red,
                                      size: 15,
                                    ),
                                  if (imageCategory.diseaseName ==
                                      "Vascular lesions")
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.red,
                                      size: 15,
                                    ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: RichText(
                                      softWrap: true,
                                      maxLines: 4,
                                      text: TextSpan(
                                        text: imageCategory.diseaseName,
                                        style: const TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
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
