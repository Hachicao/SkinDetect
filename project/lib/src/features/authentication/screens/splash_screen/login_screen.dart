import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, cons) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: cons.maxHeight),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //login screen header

                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Text(
                              "Welcome Back!",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                    //login screen sign-in form

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 250, 250, 250),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.black,
                                  offset: Offset(0, 0))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                          child: Column(children: [
                            // email-password and login button
                            Form(
                              key: formKey,
                              child: Column(children: [
                                //email
                                TextFormField(
                                  controller: emailController,
                                  validator: (value) => value == ""
                                      ? "Please enter your email"
                                      : null,
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.black,
                                      ),
                                      labelText: ('Email'),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20)),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                //password
                                Obx(
                                  () => TextFormField(
                                    controller: passwordController,
                                    obscureText: isObsecure.value,
                                    validator: (value) => value == ""
                                        ? "Please enter your password"
                                        : null,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.vpn_key_sharp,
                                          color: Colors.black,
                                        ),
                                        suffixIcon: Obx(() => GestureDetector(
                                              onTap: () {
                                                isObsecure.value =
                                                    !isObsecure.value;
                                              },
                                              child: Icon(
                                                isObsecure.value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: Colors.black,
                                              ),
                                            )),
                                        labelText: ('Password'),
                                        border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        enabledBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        focusedBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        disabledBorder:
                                            const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                                borderSide: BorderSide(
                                                    color: Colors.black)),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 20)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.end,
                                //   children: [
                                //     SizedBox(
                                //       width: double.infinity,
                                //       height: 20,
                                //       child: Text(
                                //         "Foget your password!",
                                //       ),
                                //     )
                                //   ],
                                // ),
                                //  ______button______
                                Material(
                                  color: Color.fromARGB(255, 144, 153, 173),
                                  borderRadius: BorderRadius.circular(30),
                                  child: InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(221, 30, 27, 27),
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            // don't have an account button - button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an Account!"),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text("Register Here",
                                      style: TextStyle(color: Colors.amber)),
                                ),
                              ],
                            ),
                            // "Or"
                            const Text(
                              "Or",
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }
}
