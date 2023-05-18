import 'package:flutter/material.dart';
import 'package:project/src/common_widgets/forms/form_header_widget.dart';
import 'package:project/src/constants/image_string.dart';
import 'package:project/src/constants/size.dart';
import 'package:project/src/constants/text_string.dart';

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
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
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
