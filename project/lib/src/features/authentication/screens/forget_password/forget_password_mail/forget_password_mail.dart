import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project/src/common_widgets/forms/form_header_widget.dart';
import 'package:project/src/constants/image_string.dart';
import 'package:project/src/constants/size.dart';
import 'package:project/src/constants/text_string.dart';
import 'package:project/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          children: [
            const SizedBox(
              height: tDefaultSize,
            ),
            const FormHeaderWidget(
              image: tForgetPasswordImage,
              title: tForgetPassword,
              subTitle: tForgetPasswordSubTitle,
              crossAxisAlignment: CrossAxisAlignment.center,
              textAlign: TextAlign.center,
              heightBetween: 30,
            ),
            const SizedBox(
              height: tDefaultSize,
            ),
            Form(
                child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                      labelText: tEmail,
                      hintText: tEmail,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(
                  height: 47,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const OtpScreen());
                    },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(tNext.toUpperCase()),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
