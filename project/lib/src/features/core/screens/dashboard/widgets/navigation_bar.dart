import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/features/core/screens/dashboard/profile/profile_screen.dart';
import 'package:project/src/features/core/screens/detect/before_skin_detect_screen.dart';
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
    BeforeSkinDetectScreen(),
    const HistoryScreen(),
    ProfileScreen(),
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
        Icons.chat,
      ),
      title: ("Chat"),
      inactiveIcon: const Icon(LineAwesomeIcons.hacker_news, color: tIcon),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.camera_alt_outlined,
        color: Colors.white,
      ),
      title: ("Detect"),
      activeColorPrimary: Colors.blue,
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
      // confineInSafeArea: true,
      navBarHeight: 60,
      // backgroundColor: Colors.blueGrey.shade100,
      decoration: NavBarDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        colorBehindNavBar: Colors.white,
        border: Border.all(color: Colors.grey.shade500, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
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
