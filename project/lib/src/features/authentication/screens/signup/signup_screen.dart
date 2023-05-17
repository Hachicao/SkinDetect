import 'package:flutter/material.dart';
import 'package:project/src/constants/size.dart';
import '../login/widgets/login_footer_widget.dart';
import '../login/widgets/login_form_widget.dart';
import '../login/widgets/login_header_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoginHeaderWidget(size: size),

              /* ----section 2-[Form] ----*/
              LoginForm(),

              /* ----section 3-[Footer] ----*/
              LoginFooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
