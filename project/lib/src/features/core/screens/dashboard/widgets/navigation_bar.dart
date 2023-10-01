import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/features/core/screens/dashboard/profile/profile_screen.dart';
import 'package:project/src/features/core/screens/detect/skin_detect_screen.dart';
import 'package:project/src/features/core/screens/history/history_screen.dart';
import 'package:project/src/features/core/screens/main_dashboard/dashboard.dart';

class DashboardBottomNavigationBar extends StatefulWidget {
  const DashboardBottomNavigationBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardBottomNavigationBarState createState() =>
      _DashboardBottomNavigationBarState();
}

class _DashboardBottomNavigationBarState
    extends State<DashboardBottomNavigationBar> {
  final PersistentTabController controler =
      PersistentTabController(initialIndex: 1);

  final List<Widget> screens = [
    const Dashboard(),
    // Container(color: Colors.red),
    Container(color: Colors.grey[50]),
    const SkinDetectScreen(),
    HistoryScreen(),
    const ProfileScreen(),
  ];

  final List<PersistentBottomNavBarItem> items = [
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.home,
      ),
      title: ("Home"),
      inactiveIcon: const Icon(Icons.home, color: tIcon),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.search,
      ),
      title: ("Search"),
      inactiveIcon: const Icon(Icons.search, color: tIcon),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.camera_alt_outlined,
        color: Colors.white,
      ),
      title: ("Detect"),
      inactiveIcon: const Icon(Icons.camera_alt_outlined, color: tIcon),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.history,
      ),
      title: ("History"),
      inactiveIcon: const Icon(Icons.history, color: tIcon),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.person,
      ),
      title: ("Profile"),
      inactiveIcon: const Icon(Icons.person, color: tIcon),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      // controller: controler,
      screens: screens,
      items: items,
      backgroundColor: Colors.blueGrey.shade100,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0),
        colorBehindNavBar: Colors.white,
      ),
      navBarStyle: NavBarStyle.style15,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      ),

      onItemSelected: (index) {
        setState(() {
          controler.index = index;
        });
      },
    );
  }
}
