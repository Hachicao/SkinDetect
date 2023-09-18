import 'package:flutter/material.dart';
import 'package:project/src/constants/image_string.dart';

class HistoryModel {
  String id;
  String user_id;
  String name;
  String dateTime;
  String image;
  VoidCallback? onPress;

  HistoryModel({
    required this.id,
    required this.user_id,
    required this.name,
    required this.dateTime,
    required this.image,
  });
  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['user_id'].toString(),
      user_id: json['user_id'].toString(),
      name: json['detect_result'],
      dateTime: json['detect_date'],
      image: json['detect_photo'],
    );
  }
  // static List<HistoryModel> list = [
  //   HistoryModel(
  //       id: '1004',
  //       user_id: '1004',
  //       name: 'Melenomac back',
  //       dateTime: '10/02/2023 13:32:23',
  //       image: tTestIamge),
  //   HistoryModel(
  //       id: '1005',
  //       user_id: '1005',
  //       name: 'Test',
  //       dateTime: 'dateTime',
  //       image: tLogo),
  // ];
}
