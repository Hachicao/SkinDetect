import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/constants/size.dart';
import 'package:project/src/constants/text_string.dart';
import 'package:project/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:project/src/features/core/screens/dashboard/widgets/banner.dart';
import 'package:project/src/features/core/screens/dashboard/widgets/categories.dart';
import 'package:project/src/features/core/screens/dashboard/widgets/navigation_bar.dart';
import 'package:project/src/features/core/screens/dashboard/widgets/search.dart';
import 'package:project/src/features/core/screens/dashboard/widgets/top_skincancer.dart';
import 'package:project/src/features/core/screens/detect/skin_detect_screen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Heading
              Text(
                tDashboardTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                tDashboardHeading,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //search box
              DashboardSearchBox(),
              SizedBox(
                height: 20,
              ),

              //categories
              DashboardCategories(),
              SizedBox(
                height: 20,
              ),

              //banner
              DashboardBanners(),
              SizedBox(
                height: 20,
              ),

              Text(
                tDashboardSkincanncer,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              //Top skin cancer
              DashboardTopSkincancer(),
            ],
          ),
        ),
      ),

      //camera Button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const SkinDetectScreen());
        },
        backgroundColor: const Color.fromARGB(221, 21, 117, 220),
        foregroundColor: const Color.fromARGB(255, 244, 227, 77),
        elevation: 0,
        child: const Icon(Icons.camera_enhance_outlined),
      ),
      bottomNavigationBar: const DashboardBottomNavigationBar(),
    );
  }
}
