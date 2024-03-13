import 'package:flutter/material.dart';
import 'package:project/src/constants/color.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tbackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        elevation: 0,
        title: const Text(
          "About Us",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.black,
            fontStyle: FontStyle.normal,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
            child: const Center(
              child: Image(image: AssetImage('images/logonew2.png')),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: const Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.new_releases_rounded,
                      color: Colors.black,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Release date: 27/03/2024",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.groups_rounded,
                      color: Colors.black,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Developed by: Team Cao Phat Linh \nemail: skindetectai@eiu.edu.vn \nsupervisor: Dr. Nguyen Dinh Vinh",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Skin cancer is the most common type of cancer. The main types of skin cancer are squamous cell carcinoma, basal cell carcinoma, and melanoma. The main cause of skin cancer is exposure to the sun. The main way to prevent skin cancer is to protect your skin from the sun.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //icon
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.black,
                      size: 40,
                    ),
                    SizedBox(width: 50),
                    //icon
                    Icon(
                      Icons.android_rounded,
                      color: Colors.black,
                      size: 40,
                    ),
                    SizedBox(width: 50),
                    Icon(
                      Icons.apple,
                      color: Colors.black,
                      size: 40,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
