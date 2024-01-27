import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:project/src/common_widgets/api_constanst/api_constanst.dart';
import 'package:project/src/features/core/controllers/user_controller.dart';
import 'package:project/src/features/authentication/models/user_model.dart';
import 'package:project/src/features/core/models/dashboard/disease_model.dart';
import 'package:project/src/features/core/models/dashboard/history_model.dart';
import 'package:project/src/features/core/models/dashboard/result.dart';
import 'package:project/src/features/core/screens/calendar/utils.dart';
import 'package:project/src/features/core/screens/detect/skin_detect_screen.dart';
import 'package:table_calendar/table_calendar.dart';

class SkinDetectController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  final getImageURL = APIConstants.getImageUrl;
  final historyURL = APIConstants.getHistoryUrl;
  final historyByDateAscURL = APIConstants.getHistoryByDateAsc;
  final historyByScoreURL = APIConstants.getHistoryByScore;
  final detailURL = APIConstants.getDetailUrl;
  final listDetaillURL = APIConstants.getListDetailUrl;
  final saveImagelURL = APIConstants.getSaveDataUrl;
  final deleteImagelURL = APIConstants.deleteImageUrl;

  Rx<Result?> result = Rx<Result?>(null);
  User? userModel;
  HistoryModel? hitoryModel;
  DiseaseModel? diseaseModel;

  final UserController userController = Get.find<UserController>();

  Rx<Color?> sectionColor = Colors.white.obs;
  Rx<Text?> textLevel = const Text('Low').obs;
  Rx<Text?> textValue =
      const Text('Additional examination is not required').obs;
  // Rx<Color?> subCircle = Colors.green[500].obs;
  // list of history
  var count = 0.obs;
  final historyList = RxList<HistoryModel>([]);
  Rx<User?> currentUser = Rx<User?>(null); // Updated currentUser
  final detailList = RxList<DiseaseModel>([]);
  TextEditingController nameController = TextEditingController();
  TextEditingController overViewController = TextEditingController();
  TextEditingController symptomController = TextEditingController();
  TextEditingController causesController = TextEditingController();
  TextEditingController preventionController = TextEditingController();
  int detectCount = 0;
  bool isAuthenticated = false;
  void updateUser(User? user) {
    currentUser.value = user;
  }

  void inceasedCount() {
    count.value++;
  }

  void getImage(ImageSource imageSource) async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: imageSource);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;

      if (imageSource == ImageSource.camera) {
        await uploadImage();
        double? apiScore = result.value?.score;
        calculateScoreAndSetSectionColor(apiScore);
        Get.to(() => const SkinDetectScreen());
        inceasedCount();
      }
      if (imageSource == ImageSource.gallery) {
        await uploadImage();
        double? apiScore = result.value?.score;
        calculateScoreAndSetSectionColor(apiScore);
        Get.to(() => const SkinDetectScreen());
        inceasedCount();
      }
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
      const confidenceScore = 0.9;
      final userModel = userController.getUserModel;
      final userId = userModel?.userId.toString();
      final body = {
        'file': base64Image,
        'confidence_score': confidenceScore.toString(),
        'user_id': userId ?? 'null',
      };
      final headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      final response = await http.post(
        getImageURL,
        body: body,
        headers: headers,
      );

      // Handle the API response
      if (response.statusCode == 200) {
        // Success
        print('Image uploaded successfully');
        final jsonResponse = jsonDecode(response.body);
        result.value = Result.fromJson(jsonResponse);
        print('result.value: ${result.value!}');
        print('Placement: ${result.value!.placement}');
        print('Score: ${result.value!.score}');
        print('date: ${result.value!.date}');
        print('time: ${result.value!.time}');
        print('id: ${result.value!.id}');

        final newHistoryItem = HistoryModel.fromJson(jsonResponse);
        historyList.add(newHistoryItem);
        skinDetectController.fetchHistory();
        Get.back();
      } else if (response.statusCode == 500) {
        final jsonResponse = jsonDecode(response.body);
        result.value = Result.fromJson(jsonResponse);
        print('placment: ${result.value!.placement}');
        print('score: ${result.value!.score}');
      }
    } catch (e) {
      print('Exception occurred while uploading image: $e');
    } finally {
      Get.back(); // Close the progress dialog
    }
  }

  Result? getResultModel() => result.value;

  void calculateScoreAndSetSectionColor(double? scoreApi) {
    print("scoreApi: $scoreApi");
    if (scoreApi != null) {
      if (scoreApi < 0.49) {
        sectionColor.value = const Color.fromARGB(255, 50, 182, 54);
        textLevel.value = const Text('Low');
        textValue.value = const Text('Additional examination is not required');
      } else if (scoreApi >= 0.5 && scoreApi < 0.79) {
        sectionColor.value = const Color.fromARGB(255, 234, 167, 52);
        textLevel.value = const Text('Medium');
        textValue.value = const Text('Recommended  additional examination');
      } else {
        sectionColor.value = const Color.fromARGB(255, 243, 91, 77);
        textLevel.value = const Text('High');
      }
    }
  }

  Color getColorBasedOnScore(double? score) {
    print("score: $score");
    if (score != null) {
      if (score < 0.49) {
        return const Color.fromARGB(255, 50, 182, 54); // Green
      } else if (score >= 0.5 && score < 0.79) {
        return const Color.fromARGB(255, 234, 167, 52); // Orange
      } else {
        return const Color.fromARGB(255, 243, 91, 77); // Red
      }
    }
    return Colors.black; // Default color if score is null
  }

  // load list of  detail
  Future<void> fetchListDetails() async {
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    try {
      final response = await http.get(listDetaillURL, headers: headers);
      if (response.statusCode == 200) {
        final Map<String, dynamic> dataReceived = jsonDecode(response.body);
        final String result = dataReceived['placement'];
        final List<dynamic> detailData = jsonDecode(result);
        if (detailData.isNotEmpty) {
          final List<DiseaseModel> detail = detailData.map((e) {
            return DiseaseModel.fromJson(e);
          }).toList();
          detailList.assignAll(detail);
        }
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('An error occurred while fetching detail');
    }
  }

  // load list of history
  Future<void> fetchHistory() async {
    final userModel = userController.getUserModel;
    final userId = userModel?.userId.toString();
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    final body = {
      'user_id': userId,
    };

    try {
      final response = await http.post(
        historyURL,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> dataReceived = jsonDecode(response.body);
        final String result = dataReceived['placement'];

        final List<dynamic> historyData = jsonDecode(result);

        if (historyData.isNotEmpty) {
          final List<HistoryModel> history = historyData.map((e) {
            return HistoryModel.fromJson(e);
          }).toList();

          historyList.assignAll(history);
        }
      }
      // Handle other status codes or unexpected responses
      throw Exception('Failed to fetch history');
    } catch (e) {
      // Handle exceptions, e.g., network errors
      print('Error: $e');
      throw Exception('An error occurred while fetching history');
    }
  }

  // load list of fetchHistoryByDateAsc
  Future<void> fetchHistoryByDateAsc() async {
    final userModel = userController.getUserModel;
    final userId = userModel?.userId.toString();
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    final body = {
      'user_id': userId,
    };

    try {
      final response = await http.post(
        historyByDateAscURL,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> dataReceived = jsonDecode(response.body);
        final String result = dataReceived['placement'];

        final List<dynamic> historyData = jsonDecode(result);

        if (historyData.isNotEmpty) {
          final List<HistoryModel> history = historyData.map((e) {
            return HistoryModel.fromJson(e);
          }).toList();

          historyList.assignAll(history);
        }
      }

      // Handle other status codes or unexpected responses
      throw Exception('Failed to fetch history');
    } catch (e) {
      // Handle exceptions, e.g., network errors
      print('Error: $e');
      throw Exception('An error occurred while fetching history');
    }
  }

  // load list of fetchHistoryByScore
  Future<void> fetchHistoryByScore() async {
    final userModel = userController.getUserModel;
    final userId = userModel?.userId.toString();
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    final body = {
      'user_id': userId,
    };

    try {
      final response = await http.post(
        historyByScoreURL,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> dataReceived = jsonDecode(response.body);
        final String result = dataReceived['placement'];

        final List<dynamic> historyData = jsonDecode(result);

        if (historyData.isNotEmpty) {
          final List<HistoryModel> history = historyData.map((e) {
            return HistoryModel.fromJson(e);
          }).toList();

          historyList.assignAll(history);
        }
      }

      // Handle other status codes or unexpected responses
      throw Exception('Failed to fetch history');
    } catch (e) {
      // Handle exceptions, e.g., network errors
      print('Error: $e');
      throw Exception('An error occurred while fetching history');
    }
  }

  Future<void> fetchDetail(String imageId) async {
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};

    // final imageId = '20';
    final body = {'diseasedId': imageId};

    try {
      final response = await http.post(detailURL, headers: headers, body: body);
      if (response.statusCode == 200) {
        final dataReceived = jsonDecode(response.body);
        final result = dataReceived['diseaseModel'];
        // print('result: $result');
        diseaseModel = DiseaseModel.fromJson(result);
        nameController.text = diseaseModel!.diseaseName;
        overViewController.text = diseaseModel!.diseaseOverview;
        symptomController.text = diseaseModel!.diseaseSymptom;
        causesController.text = diseaseModel!.diseaseCause;
        preventionController.text = diseaseModel!.diseasePrevention;

        print(nameController.text);
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('An error occurred while fetching detail');
    }
  }

  Future<void> saveData() async {
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final diseasedId = diseaseModel?.diseaseId.toString();
    final userModel = userController.getUserModel;
    final userId = userModel?.userId.toString();
    final imagePath = result.value?.imagePath.toString();
    final txtPath = result.value?.txtPath.toString();
    double? scoreApi = result.value?.score;
    final body = {
      'disease_id': diseasedId,
      'user_id': userId,
      'image_path': imagePath,
      'txt_path': txtPath,
      'score': scoreApi.toString(),
    };
    final response =
        await http.post(saveImagelURL, headers: headers, body: body);
    if (response.statusCode == 200) {
      final dataReceived = jsonDecode(response.body);
      final result = dataReceived['placement'];
      if (result == 0) {
        Get.snackbar("Successfully", "Save Successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      } else {
        Get.snackbar("Error", "Save Failed",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }
  }

  Future<void> deleteImageById(String detectId) async {
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final userModel = userController.getUserModel;
    final userId = userModel?.userId.toString();
    final body = {'detect_id': detectId, 'user_id': userId};
    final response =
        await http.post(deleteImagelURL, headers: headers, body: body);
    if (response.statusCode == 200) {
      final dataReceived = jsonDecode(response.body);
      final result = dataReceived['placement'];
      if (result == 0) {
        Get.snackbar("Successfully", "Detele Successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      } else {
        Get.snackbar("Error", "Delete Failed",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }
  }

  void showImageSourceDialog() {
    Get.defaultDialog(
      backgroundColor: Colors.white,
      title: 'Choose action ...',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take a photo'),
            onTap: () {
              Get.back();
              getImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Choose from gallery'),
            onTap: () {
              Get.back();
              getImage(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }

  List<HistoryModel> getEventsForDay(DateTime day) {
    final historyListEvent = historyList;
    final count = historyListEvent.length;
    print('count: $count');
    final events = <HistoryModel>[];
    for (int i = 0; i < count; i++) {
      final historyItem = historyListEvent[i];
      final date = DateTime.parse(historyItem.detectDate);

      if (isSameDay(date, day)) {
        events.add(historyItem);
      }
    }
    return events;
  }
}
