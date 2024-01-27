import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/constants/image_string.dart';
import 'package:project/src/features/core/controllers/user_controller.dart';
import 'package:project/src/features/core/screens/dashboard/profile/profile_screen.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());

    final userModel = userController.getUserModel;
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
    return AppBar(
      leading: (const Icon(Icons.menu, color: Colors.blue)),
      title: const Text(
        "Home",
        style: TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 55, 53, 53),
          fontWeight: FontWeight.normal,
        ),
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: tAppbarColor,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20, top: 7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: const Color.fromRGBO(240, 237, 237, 0.722)),
          child: GestureDetector(
            onTap: () {
              Get.to(() => ProfileScreen());
            },
            child: CircleAvatar(
              radius: 20,
              backgroundImage: userAvatarImage.image,
            ),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
