import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project/src/common_widgets/api_constanst/api_constanst.dart';
import 'package:project/src/features/authentication/models/user_model.dart';
import 'package:project/src/features/core/screens/main_dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  RxBool con = true.obs;
  Rx<User?> user = Rx<User?>(null);

  static final _loginUrl = APIConstants.loginUrl;
  static final _registerUrl = APIConstants.registerUrl;

  // Future<void> fetchUser(int userId) async {
  //   final response =
  //       await http.get(Uri.parse('://12http7.0.0.1:5000/user/$userId'));
  //   if (response.statusCode == 200) {
  //     final userData = User.fromJson(jsonDecode(response.body));
  //     user.value = userData;
  //   } else {
  //     // Handle error case
  //     print('Failed to fetch user data');
  //   }
  // }

  Future<void> loginUser(String email, String password) async {
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    }; // Set the Content-Type header
    final body = {'email': email, 'password': password};

    final response = await http.post(_loginUrl, headers: headers, body: body);
    if (response.statusCode == 200) {
      final dataReceived = jsonDecode(response.body);
      final result = dataReceived['placement'];

      if (result == 0) {
        final userInstance = User.fromJson(dataReceived);
        userInstance.setUserId = userInstance.userId;
        user.value = userInstance;

        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('user_id', userInstance.userId);
        print('user_id: ${user.value!.userId}');
        Get.snackbar("Successfull", "Successfull",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        Get.to(() => const Dashboard());
      } else {
        Get.snackbar("Error", "Failed",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } else {
      print("statuscode wrong");
    }
  }

  Future<int?> getUserIdFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('user_id');
  }

  Future<void> registerUser(
    String email,
    String userName,
    String password,
  ) async {
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final body = {
      'email': email,
      'user_name': userName,
      'password': password,
    };
    final response =
        await http.post(_registerUrl, headers: headers, body: body);
    if (response.statusCode == 200) {
      final dataReceived = jsonDecode(response.body);
      final result = dataReceived['placement'];
      if (result == 0) {
        print("Successfully");
        Get.to(() => const Dashboard());
      } else {
        Get.snackbar("Error", "Please choose another email",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } else {
      print("statuscode wrong");
    }
  }
}
