import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/features/core/screens/dashboard/profile/profile_screen.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: (const Icon(Icons.menu, color: Colors.blue)),
      title: const Text(
        "Welcome",
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
          fontWeight: FontWeight.bold,
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
              color: Color.fromRGBO(240, 237, 237, 0.722)),
          child: IconButton(
            onPressed: () {
              Get.to(() => ProfileScreen());
            },
            icon: const Icon(Icons.person_3_outlined),
            color: Colors.blue,
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
