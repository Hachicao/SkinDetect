import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/constants/image_string.dart';
import 'package:project/src/constants/size.dart';
import 'package:project/src/constants/text_string.dart';
import '../../../controllers/user_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tEditProfile, style: Theme.of(context).textTheme.headline4),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              // -- IMAGE with ICON
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(image: AssetImage(tSlashImage))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.yellow,
                      ),
                      child: const Icon(LineAwesomeIcons.camera,
                          color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    FutureBuilder<String?>(
                      // future: userController.getUserName(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return TextFormField(
                            controller: userController.nameController,
                            // initialValue: snapshot.data ?? '',
                            decoration: const InputDecoration(
                              label: Text(tFullName),
                              prefixIcon: Icon(LineAwesomeIcons.user),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    FutureBuilder<String?>(
                      // future: userController.getUserAddress(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return TextFormField(
                            // initialValue: snapshot.data ?? '',
                            controller: userController.addressController,
                            decoration: const InputDecoration(
                                label: Text(tAddress),
                                prefixIcon:
                                    Icon(LineAwesomeIcons.address_card)),
                          );
                        }
                      },
                    ),

                    //date picker
                    const SizedBox(height: 10),
                    //date picker
                    FutureBuilder<String?>(
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return TextFormField(
                            // controller: dateinput.text == '' ? null : dateinput,
                            controller: userController.birthdayController,
                            decoration: const InputDecoration(
                                label: Text(tDob),
                                prefixIcon: Icon(LineAwesomeIcons.calendar)),
                            readOnly: true,
                            onTap: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (picked != null) {
                                print(picked);
                                String formattedDate = DateFormat('yyyy-MM-dd')
                                    .format(picked)
                                    .toString();
                                print(formattedDate);
                                userController.birthdayController.text =
                                    formattedDate;
                              } else {
                                print('date not selected');
                              }
                            },
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 10),
                    FutureBuilder<String?>(
                      // future: userController.getUserPhone(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return TextFormField(
                            // initialValue: snapshot.data ?? '',
                            controller: userController.phoneController,
                            decoration: const InputDecoration(
                                label: Text(tPhoneNo),
                                prefixIcon: Icon(LineAwesomeIcons.phone)),
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 10),
                    FutureBuilder<String?>(
                      // future: userController.getUserEmail(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return TextFormField(
                            // initialValue: snapshot.data ?? '',
                            controller: userController.emailController,
                            decoration: const InputDecoration(
                                label: Text(tEmail),
                                prefixIcon: Icon(LineAwesomeIcons.mail_bulk)),
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 10),
                    FutureBuilder<String?>(
                      // future: userController.getUserPassword(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return TextFormField(
                            // initialValue: snapshot.data ?? '',
                            controller: userController.passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              label: const Text(tPassword),
                              prefixIcon: const Icon(Icons.fingerprint),
                              suffixIcon: IconButton(
                                  icon: const Icon(LineAwesomeIcons.eye_slash),
                                  onPressed: () {}),
                            ),
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 20),

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => userController.updateUser(),
                        style: ElevatedButton.styleFrom(
                            // backgroundColor: tPrimaryColor,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text(tEditProfile,
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // -- Created Date and Delete Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            text: tJoined,
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                  text: tJoinedAt,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            userController.nameController.clear();
                            userController.addressController.clear();
                            userController.birthdayController.clear();
                            userController.phoneController.clear();
                            userController.emailController.clear();
                            userController.passwordController.clear();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.redAccent.withOpacity(0.1),
                              elevation: 0,
                              foregroundColor: Colors.red,
                              shape: const StadiumBorder(),
                              side: BorderSide.none),
                          child: const Text(tClear),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
