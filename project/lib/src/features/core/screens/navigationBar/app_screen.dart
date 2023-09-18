import 'package:flutter/material.dart';

class AppScreens {
  final Widget Function() dashboardScreen;
  final Widget Function() skinDetectScreen;
  final Widget Function() historyScreen;
  final Widget Function() profileScreen;

  AppScreens({
    required this.dashboardScreen,
    required this.skinDetectScreen,
    required this.historyScreen,
    required this.profileScreen,
  });
}
