import 'package:flutter/material.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/features/core/screens/dashboard/profile/profile_screen.dart';
import 'package:project/src/features/core/screens/history/history_screen.dart';

class DashboardBottomNavigationBar extends StatelessWidget {
  const DashboardBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 5.0,
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to the home screen
                  },
                  child: const Icon(
                    Icons.home,
                    color: tColorNavigationBar,
                  ),
                ),
                const Text(
                  "Home",
                  style: TextStyle(color: tColorNavigationBar),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to the search screen
                  },
                  child: const Icon(
                    Icons.search_rounded,
                    color: tColorNavigationBar,
                  ),
                ),
                const Text(
                  "Search",
                  style: TextStyle(color: tColorNavigationBar),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HistoryScreen()),
                    );
                  },
                  child: const Icon(
                    Icons.history_rounded,
                    color: tColorNavigationBar,
                  ),
                ),
                const Text(
                  "History",
                  style: TextStyle(color: tColorNavigationBar),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()),
                    ); // Navigate to the profile screen
                  },
                  child: const Icon(
                    Icons.person_3_outlined,
                    color: tColorNavigationBar,
                  ),
                ),
                const Text(
                  "Profile",
                  style: TextStyle(color: tColorNavigationBar),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
