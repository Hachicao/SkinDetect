import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project/src/features/authentication/screens/login/login_screen.dart';

import '../../../../../constants/image_string.dart';
import '../../../../../constants/text_string.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '----------OR----------',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            label: Text(tSignInWithGoogle.toUpperCase()),
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            icon: const Image(
              image: AssetImage(tGoogleLogoImage),
              width: 20.0,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextButton(
            onPressed: () => Get.to(() => const LoginScreen()),
            child: const Text.rich(TextSpan(
                text: tAlreadyHaveAnAccount,
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: tLogin,
                    style: TextStyle(color: Colors.blue),
                  )
                ])))
      ],
    );
  }
}
