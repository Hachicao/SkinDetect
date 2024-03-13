import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/authentication/screens/login/widgets/google_sign_in.dart';
import 'package:project/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:project/src/features/core/controllers/user_controller.dart';
import 'package:project/src/features/core/screens/main_dashboard/dashboard.dart';

import '../../../../../constants/image_string.dart';
import '../../../../../constants/text_string.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
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
            onPressed: signIn,
            label: Text(tSignInWithGoogle.toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
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
            onPressed: () => Get.to(() => const SignUpScreen()),
            child: const Text.rich(TextSpan(
                text: tDontHaveAccount,
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: tSignup,
                    style: TextStyle(color: Colors.blue),
                  )
                ])))
      ],
    );
  }

  Future signIn() async {
    // final _user = await GoogleSignInApi.login();
    final _user = GoogleSignInApi.doAuthenticateUser();
    if (_user == null) {
      print('Sign in failed');
    } else {
      print('User => $_user');
      // Get.to(() => const Dashboard());
    }
  }
}
