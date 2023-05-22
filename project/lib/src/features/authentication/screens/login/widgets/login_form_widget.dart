import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/authentication/screens/forget_password/forget_password_options/forget_password_model_buttom_sheet.dart';
import 'package:project/src/features/core/screens/dashboard/dashboard.dart';
import '../../../../../constants/text_string.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.fingerprint_rounded,
                color: Colors.black,
              ),
              labelText: tPassword,
              hintText: tPassword,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              suffixIcon: IconButton(
                  onPressed: null, icon: Icon(Icons.remove_red_eye_sharp)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //--  FOGET PASSWORD BTN
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    ForgetPasswordScreen.buildShowModalBottomSheet(context);
                  },
                  child: const Text(tForgetPassword))),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => const Dashboard());
              },
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Text(tLogin.toUpperCase()),
            ),
          ),
        ],
      ),
    ));
  }
}
