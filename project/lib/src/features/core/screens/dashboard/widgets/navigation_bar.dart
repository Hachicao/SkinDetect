import 'package:flutter/material.dart';
import 'package:project/src/constants/color.dart';

class DashboardBottomNavigationBar extends StatelessWidget {
  const DashboardBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      notchMargin: 5.0,
      shape: CircularNotchedRectangle(),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.home,
                  color: tColorNavigationBar,
                ),
                Text(
                  "Home",
                  style: TextStyle(color: tColorNavigationBar),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.search_rounded,
                  color: tColorNavigationBar,
                ),
                Text(
                  "Search",
                  style: TextStyle(color: tColorNavigationBar),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.history_rounded,
                  color: tColorNavigationBar,
                ),
                Text(
                  "History",
                  style: TextStyle(color: tColorNavigationBar),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person_3_outlined,
                  color: tColorNavigationBar,
                ),
                Text(
                  "Profile",
                  style: TextStyle(color: tColorNavigationBar),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
