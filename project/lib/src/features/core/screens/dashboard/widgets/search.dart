import 'package:flutter/material.dart';
import 'package:project/src/constants/text_string.dart';

class DashboardSearchBox extends StatelessWidget {
  const DashboardSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(style: BorderStyle.solid)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tDashboardSearch,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey.withOpacity(0.5),
                  fontWeight: FontWeight.bold),
            ),
            const Icon(
              Icons.search,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
