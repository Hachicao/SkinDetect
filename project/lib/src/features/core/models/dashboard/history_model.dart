import 'package:flutter/material.dart';
import 'package:project/src/constants/image_string.dart';

class HistoryModel {
  String id;
  String name;
  String dateTime;
  String image;
  VoidCallback? onPress;

  HistoryModel({
    required this.id,
    required this.name,
    required this.dateTime,
    required this.image,
  });
  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['user_id'],
      name: json['detect_result'],
      dateTime: json['detect_date'],
      image: json['detect_photo'],
    );
  }
  static List<HistoryModel> list = [
    HistoryModel(
        id: '1004',
        name: 'Melenomac back',
        dateTime: '10/02/2023 13:32:23',
        image: tBanner1),
    HistoryModel(
        id: '1005', name: 'Test', dateTime: 'dateTime', image: tBanner2),
  ];
}
