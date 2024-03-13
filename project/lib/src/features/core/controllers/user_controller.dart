import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:project/src/common_widgets/api_constanst/api_constanst.dart';
import 'package:project/src/features/authentication/models/user_model.dart';
import 'package:project/src/features/authentication/screens/login/login_screen.dart';
import 'package:project/src/features/core/models/dashboard/history_model.dart';
import 'package:project/src/features/core/screens/main_dashboard/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class UserController extends GetxController {
  User? userModel;
  Rx<HistoryModel?> history = Rx<HistoryModel?>(null);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dateJoinedController = TextEditingController();

  static final _loginUrl = APIConstants.loginUrl;
  static final _registerUrl = APIConstants.registerUrl;
  static final _updateUrl = APIConstants.updateUrl;
  static final _googleOauth = APIConstants.googleOauth;

  var selectedImagePath = ''.obs;
  var updateButtonEnabled = false;
  void getImage(ImageSource imageSource) async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: imageSource);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;

      if (imageSource == ImageSource.camera) {
        print("camera");
      }
      if (imageSource == ImageSource.gallery) {
        print("gallery");
      }
    } else {
      Get.snackbar("Error", "No image selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  // Custom date parsing function to handle the specific format
  DateTime parseDateString(String dateString) {
    try {
      final parsedDate = DateTime.parse(dateString);
      return parsedDate;
    } catch (e) {
      print("Error parsing date: $e");
      return DateTime.now(); // You can set a default date here if parsing fails
    }
  }
  //login by guest without login

  //login user
  Future<void> loginUser(String email, String password) async {
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    }; // Set the Content-Type header
    final body = {'email': email, 'password': password};

    final response = await http.post(_loginUrl, headers: headers, body: body);
    if (response.statusCode == 200) {
      final dataReceived = jsonDecode(response.body);
      // print('dataReceived: $dataReceived');
      final result = dataReceived['placement'];

      if (result == 0) {
        final userData = dataReceived['user'];
        if (userData != null) {
          userModel = User.fromJson(userData);
          nameController.text = userModel!.userName;
          emailController.text = userModel!.userEmail;
          String dateReceived = userModel!.userDob.toString();
          var formattedDate =
              DateFormat('yyyy-MM-dd').format(parseDateString(dateReceived));
          birthdayController.text = formattedDate;
          phoneController.text = userModel!.userPhone ?? '';
          passwordController.text = userModel!.userPassword;
          addressController.text = userModel!.userAddress ?? '';
          userIdController.text = userModel!.userId.toString();
          firstNameController.text = userModel!.firstName ?? '';
          lastNameController.text = userModel!.lastName ?? '';
          genderController.text = userModel!.gender ?? '';
          dateJoinedController.text = userModel!.dateJoined;
          // print('userModel: $userModel');
          // print('email: ${userModel!.userEmail}');
          // print('passs: ${userModel!.userPassword}');
          // print('address: ${userModel!.userAddress}');
          // print('phone: ${userModel!.userPhone}');
          // print('dob: ${userModel!.userDob}');
          // print('id: ${userModel!.userId}');
          // print('name: ${userModel!.userName}');
          print('avata: ${userModel!.userAvatar}');

          AwesomeDialog(
            context: Get.context!,
            animType: AnimType.scale,
            dialogType: DialogType.success,
            body: const Center(
              child: Text(
                'Login Successfull',
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            btnOkIcon: Icons.check_circle,
            btnOkOnPress: () {
              Get.to(() => const DashboardScreen());
            },
          ).show();
        } else {
          print('user data is null');
        }
      } else {
        AwesomeDialog(
          context: Get.context!,
          animType: AnimType.scale,
          dialogType: DialogType.error,
          body: const Center(
            child: Text(
              'Login Unsuccessfull',
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          btnCancelIcon: Icons.cancel,
          btnOkColor: Colors.red,
          //icon cancel
          btnCancelOnPress: () {},
        ).show();
      }
    } else {
      print("statuscode wrong");
    }
  }

  //get user model getter
  User? get getUserModel => userModel;

  //get userId from ojbect user shared preferences
  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = prefs.getString('user') ?? '';
    Map<String, dynamic> userMap = json.decode(userJson);
    User user = User.fromJson(userMap);
    print('user.userId.toString(): ${user.userId.toString()}');
    return user.userId.toString();
  }

  // register
  Future<void> registerUser(
    String email,
    String password,
    String confirmPassword,
  ) async {
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final body = {
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
    };
    final response =
        await http.post(_registerUrl, headers: headers, body: body);
    if (response.statusCode == 200) {
      final dataReceived = jsonDecode(response.body);
      final result = dataReceived['placement'];
      if (result == 0) {
        print("Successfully");
        AwesomeDialog(
          context: Get.context!,
          animType: AnimType.scale,
          dialogType: DialogType.success,
          body: const Center(
            child: Text(
              'Register Successfull',
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          btnOkOnPress: () {
            Get.to(() => const LoginScreen());
          },
        ).show();
      } else {
        print('email already exists');
        showDialog(
            context: Get.context!,
            builder: (context) {
              return AlertDialog(
                title: const Text('Email already exists'),
                content: const Text('Please try another email'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });
      }
    } else {
      AwesomeDialog(
        context: Get.context!,
        animType: AnimType.scale,
        dialogType: DialogType.error,
        body: const Center(
          child: Text(
            'Register Unsuccessfull',
            style: TextStyle(
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
        btnOkColor: Colors.red,
        //icon cancel
        btnCancelOnPress: () {},
      ).show();
    }
  }

  Future<void> updateUser() async {
    // Disable the button initially
    // Assuming `updateButtonEnabled` is a variable that determines the button's enabled state
    updateButtonEnabled = false;

    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    dynamic bytes;
    String? base64Image;

    // Check if a new image is selected
    if (selectedImagePath.value.isNotEmpty) {
      final file = File(selectedImagePath.value);
      if (file.path.isEmpty) {
        Get.snackbar("Error", "Image not found",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        return;
      }
      bytes = await file.readAsBytes();
      base64Image = base64Encode(bytes);
    }

    final body = {
      // 'email': emailController.text,
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'gender': genderController.text,
      'user_address': addressController.text,
      'user_dob': birthdayController.text,
      'user_phone': phoneController.text,
      'user_id': userIdController.text,
    };

    // Include user_avatar only if a new image is selected
    if (base64Image != null) {
      body['user_avatar'] = base64Image;
    } else if (userModel!.userAvatar != null) {
      body['user_avatar'] = userModel!.userAvatar!;
    }
    final response = await http.post(_updateUrl, headers: headers, body: body);
    // Enable the button after receiving a response from the server
    // Here, you can set `updateButtonEnabled` to true
    updateButtonEnabled = true;
    if (response.statusCode == 200) {
      final dataReceived = jsonDecode(response.body);
      print('dataReceived update: $dataReceived');
      final result = dataReceived['placement'];
      if (result == 0) {
        final userData = dataReceived['user'];
        if (userData != null) {
          userModel = User.fromJson(userData);
          nameController.text = userModel!.userName;
          emailController.text = userModel!.userEmail;
          String dateReceived = userModel!.userDob.toString();
          var formattedDate =
              DateFormat('yyyy-MM-dd').format(parseDateString(dateReceived));
          birthdayController.text = formattedDate;
          phoneController.text = userModel!.userPhone ?? '';
          addressController.text = userModel!.userAddress ?? '';
          userIdController.text = userModel!.userId.toString();
          firstNameController.text = userModel!.firstName ?? '';
          lastNameController.text = userModel!.lastName ?? '';
          genderController.text = userModel!.gender ?? '';
          dateJoinedController.text = userModel!.dateJoined;
          AwesomeDialog(
            context: Get.context!,
            animType: AnimType.scale,
            dialogType: DialogType.success,
            body: const Center(
              child: Text(
                'Update Successfull',
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            btnOkOnPress: () {
              Get.to(() => const DashboardScreen());
            },
          ).show();
        } else {
          AwesomeDialog(
            context: Get.context!,
            animType: AnimType.scale,
            dialogType: DialogType.error,
            body: const Center(
              child: Text(
                'Update Unsuccessfull',
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            btnOkColor: Colors.red,
          ).show();
        }
      } else {
        print("statuscode wrong");
        AwesomeDialog(
          context: Get.context!,
          animType: AnimType.scale,
          dialogType: DialogType.error,
          body: const Center(
            child: Text(
              'Update Unsuccessfull',
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          btnOkColor: Colors.red,
          //icon cancel
          btnCancelOnPress: () {},
        ).show();
      }
    }
  }

  // api login by google account
  Future<void> authenticateUser(GoogleSignIn userGoogle) async {
    final String? accessToken =
        (await userGoogle.currentUser!.authentication).accessToken;

    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final body = {'access_token': accessToken!};

    final response =
        await http.post(_googleOauth, headers: headers, body: body);
    if (response.statusCode == 200) {
      final dataReceived = jsonDecode(response.body);
      final userData = dataReceived['user'];
      if (userData != null) {
        userModel = User.fromJson(userData);
        nameController.text = userModel!.userName;
        emailController.text = userModel!.userEmail;
        String dateReceived = userModel!.userDob.toString();
        var formattedDate =
            DateFormat('yyyy-MM-dd').format(parseDateString(dateReceived));
        birthdayController.text = formattedDate;
        phoneController.text = userModel!.userPhone ?? '';
        passwordController.text = userModel!.userPassword;
        addressController.text = userModel!.userAddress ?? '';
        userIdController.text = userModel!.userId.toString();
        firstNameController.text = userModel!.firstName ?? '';
        lastNameController.text = userModel!.lastName ?? '';
        genderController.text = userModel!.gender ?? '';
        dateJoinedController.text = userModel!.dateJoined;
      }
      final flag = dataReceived['isLogin'];
      if (flag) {
        Get.to(() => const DashboardScreen());
      } else {
        Get.to(() => const LoginScreen());
      }
    } else {
      print('user data is null');
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
}
