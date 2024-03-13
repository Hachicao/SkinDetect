import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/constants/image_string.dart';
import 'package:project/src/features/core/controllers/user_controller.dart';
import 'package:project/src/features/core/screens/dashboard/profile/profile_screen.dart';
import 'package:project/src/features/core/screens/main_dashboard/dashboard_screen.dart';

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
      // leading: Builder(
      //   builder: (BuildContext context) {
      //     return IconButton(
      //       icon: const Icon(Icons.menu, color: Colors.blue),
      //       onPressed: () {
      //         Get.to(() => NavigationDrawerSreen());
      //       },
      //     );
      //   },
      // ),
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

class NavigationDrawerSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
        child: Column(
          children: <Widget>[
            buildHeader(context),
            buildMenuItem(context),
          ],
        ),
      );

  buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        // color: Colors.blue,
        // width: double.infinity,
        // height: 200,
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: const <Widget>[
        //     CircleAvatar(
        //       radius: 50,
        //       backgroundImage: AssetImage(tProfileLogo),
        //     ),
        //     SizedBox(
        //       height: 10,
        //     ),
        //     Text(
        //       "User Name",
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 20,
        //       ),
        //     ),
        //   ],
        // ),
      );

  buildMenuItem(BuildContext context) => Column(
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Get.to(() => const DashboardScreen());
            },
          )
        ],
      );
}
