import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/features/core/controllers/skin_detect_controller.dart';
import 'package:project/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:project/src/features/core/screens/dashboard/widgets/navigation_bar.dart';
import 'package:project/src/features/core/screens/main_dashboard/dashboard.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final skinDetectController = Get.find<SkinDetectController>();

  @override
  void initState() {
    super.initState();
    skinDetectController.fetchHistory();
    // skinDetectController.fetchListDetails();
  }

  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: tbackgroundColor,
        appBar: DashboardAppBar(),
        body: Dashboard(),
        bottomNavigationBar: DashboardBottomNavigationBar(),
      ),
    );
  }
}
