import 'package:flutter/material.dart';

class DashboardBottomNavigationBar extends StatelessWidget {
  const DashboardBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_enhance),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_3_outlined),
          label: 'Profile',
        ),
      ],
    );
  }
}
