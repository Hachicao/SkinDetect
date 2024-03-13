import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/constants/image_string.dart';
import 'package:project/src/constants/size.dart';
import 'package:project/src/features/authentication/screens/login/login_screen.dart';
import 'package:project/src/features/core/controllers/user_controller.dart';
import 'package:project/src/features/core/screens/dashboard/profile/about_us.dart';
import 'package:project/src/features/core/screens/dashboard/profile/profile_menu_screen.dart';
import 'package:project/src/features/core/screens/dashboard/profile/update_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    final userModel = userController.getUserModel;
    final userEmail = userModel?.userEmail.toString();
    final fullName = userModel?.getFullName();
    Image userAvatarImage;
    if (userModel!.userAvatar != null) {
      final base64Avatar = userModel.userAvatar;
      try {
        final decodedAvatar = base64.decode(base64Avatar!);
        userAvatarImage = Image.memory(decodedAvatar, fit: BoxFit.cover);
      } catch (e) {
        print('Error decoding userAvatar: $e');
        userAvatarImage =
            Image.asset(tProfileLogo); // Replace with a default image
      }
    } else {
      // Handle the case where userAvatar is null
      userAvatarImage =
          Image.asset(tProfileLogo); // Replace with a default image
    }
    return Scaffold(
      backgroundColor: tbackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tAppbarColor,
        title: const Text('My profile',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: Colors.black.withOpacity(0.1), width: 1),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: userAvatarImage,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text("$fullName",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
              Text("$userEmail",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal)),
              // const SizedBox(height: 20),

              /// -- BUTTON
              // SizedBox(
              //   width: 200,
              //   child: ElevatedButton(
              //     onPressed: () {

              //     },
              //     style: ElevatedButton.styleFrom(
              //         backgroundColor: tButtonColor,
              //         side: BorderSide.none,
              //         shape: const StadiumBorder()),
              //     child: const Text(tEditProfile,
              //         style: TextStyle(
              //             color: Colors.white, fontWeight: FontWeight.bold)),
              //   ),
              // ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(
                  title: "Edit Profile",
                  icon: LineAwesomeIcons.pen,
                  onPress: () {
                    Get.to(() => const UpdateProfileScreen());
                  }),

              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "About us",
                  icon: LineAwesomeIcons.info_circle,
                  onPress: () {
                    Get.to(() => const AboutUs());
                  }),
              const Divider(),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    _showAlertDialog(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

void _showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Get.back();
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Continue"),
    onPressed: () {
      Get.back();
      Get.offAll(() => const LoginScreen());
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Logout"),
    content: const Text("Are you sure you want to logout?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
