import 'package:flutter/material.dart';
import 'package:project/src/constants/size.dart';

class SkinDetectScreen extends StatelessWidget {
  const SkinDetectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("data"),
            ],
          ),
        ),
      ),
    );
  }
}
