import 'package:flutter/material.dart';
import 'package:project/src/common_widgets/forms/form_header_widget.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/constants/image_string.dart';
import 'package:project/src/constants/size.dart';
import 'package:project/src/constants/text_string.dart';
import 'package:project/src/features/authentication/screens/signup/widgets/signup_footer_widget.dart';
import 'package:project/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: tbackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FormHeaderWidget(
                image: tWelcomeScreenImage,
                title: tSignUpTitle,
                subTitle: tSignUpSubTitle,
              ),
              SignUpFormWidget(),
              SignUpFooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
