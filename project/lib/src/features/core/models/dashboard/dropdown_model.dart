import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/constants/color.dart';

class DropdownModel {
  final String value;
  final Icon? icon;

  DropdownModel(this.value, [this.icon]);

  static List<DropdownModel> list = [
    DropdownModel("All"),
    DropdownModel(
      "Date in ascending",
      const Icon(LineAwesomeIcons.sort_up__ascending_),
    ),
    DropdownModel(
      "Date in descending",
      const Icon(LineAwesomeIcons.sort_down__descending_),
    ),
    DropdownModel("Score"),
  ];

  DropdownMenuItem<DropdownModel> buildDropdownMenuItem(BuildContext context) {
    return DropdownMenuItem<DropdownModel>(
      value: this,
      child: Container(
        // Change background color
        color: tbackgroundColor,
        child: Row(
          children: [
            Text(value),
            const SizedBox(width: 8.0),
            if (icon != null) icon!,
          ],
        ),
      ),
    );
  }
}
