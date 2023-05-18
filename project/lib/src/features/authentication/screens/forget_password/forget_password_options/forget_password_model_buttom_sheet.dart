import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/constants/size.dart';
import 'package:project/src/constants/text_string.dart';
import 'package:project/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:project/src/features/authentication/screens/forget_password/forget_password_options/foget_password_btn_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tForgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              tForgetPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 30.0,
            ),
            FogetPasswordBtnWidget(
              btnIcon: Icons.mail_outline_rounded,
              title: tEmail,
              subTitle: tResetViaEMail,
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordMailScreen());
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FogetPasswordBtnWidget(
              btnIcon: Icons.mobile_friendly_rounded,
              title: tPhoneNo,
              subTitle: tResetViaPhone,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
