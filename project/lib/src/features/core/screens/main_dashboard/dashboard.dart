import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/constants/size.dart';
import 'package:project/src/constants/text_string.dart';
import 'package:project/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:project/src/features/core/screens/dashboard/widgets/banner.dart';
import 'package:project/src/features/core/screens/dashboard/widgets/categories.dart';
import 'package:project/src/features/core/screens/dashboard/widgets/search.dart';
import 'package:project/src/features/core/screens/dashboard/widgets/top_skincancer.dart';
import '../../controllers/user_controller.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    final userModel = userController.getUserModel;
    final userName = userModel?.userName.toString();
    return Scaffold(
      backgroundColor: tbackgroundColor,
      appBar: const DashboardAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Heading
              Text(
                "Hey $userName",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //search box
              // const DashboardSearchBox(),
              // const SizedBox(
              //   height: 20,
              // ),

              //categories
              const DashboardCategories(),
              const SizedBox(
                height: 20,
              ),

              //banner
              const DashboardBanners(),
              const SizedBox(
                height: 20,
              ),

              const Text(
                tDashboardSkincanncer,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              //Top skin cancer
              const DashboardTopSkincancer(),
            ],
          ),
        ),
      ),
    );
  }
}
