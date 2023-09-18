import 'package:flutter/material.dart';
import 'package:project/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:project/src/features/core/screens/dashboard/widgets/navigation_bar.dart';
import 'package:project/src/features/core/screens/main_dashboard/dashboard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: DashboardAppBar(),
        body: Dashboard(),
        bottomNavigationBar: DashboardBottomNavigationBar(),
      ),
    );
  }
}
