import 'package:flutter/material.dart';

class HistoryModel {
  String detectId;
  String userId;
  String detectName;
  String detectDate;
  String detectPhoto;
  double detectScore;
  String diseaseId;
  VoidCallback? onPress;

  HistoryModel({
    required this.detectId,
    required this.userId,
    required this.detectName,
    required this.detectDate,
    required this.detectPhoto,
    required this.detectScore,
    required this.diseaseId,
  });
  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      detectId: json['detect_id'].toString(),
      userId: json['user_id'].toString(),
      detectName: json['detect_result'],
      detectDate: json['detect_date'],
      detectPhoto: json['detect_photo'],
      detectScore: json['detect_score'].toDouble(),
      diseaseId: json['disease_id'].toString(),
    );
  }
}
