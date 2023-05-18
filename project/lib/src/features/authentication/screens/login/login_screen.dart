import 'package:flutter/material.dart';
import 'package:project/src/constants/size.dart';
import 'package:project/src/features/authentication/screens/login/widgets/login_footer_widget.dart';
import 'package:project/src/features/authentication/screens/login/widgets/login_form_widget.dart';
import 'package:project/src/features/authentication/screens/login/widgets/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* ----section 1 - Image and text----*/
              LoginHeaderWidget(size: size),

              /* ----section 2-[Form] ----*/
              const LoginFormWidget(),

              /* ----section 3-[Footer] ----*/
              const LoginFooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
