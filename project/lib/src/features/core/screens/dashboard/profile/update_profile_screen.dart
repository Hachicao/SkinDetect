import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/constants/image_string.dart';
import 'package:project/src/constants/size.dart';
import 'package:project/src/constants/text_string.dart';
import '../../../controllers/user_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    final userModel = userController.getUserModel;
    Image userAvatarImage;
    if (userModel!.userAvatar != null) {
      final base64Avatar = userModel.userAvatar;
      try {
        final decodedAvatar = base64.decode(base64Avatar!);
        userAvatarImage = Image.memory(decodedAvatar, fit: BoxFit.cover);
      } catch (e) {
        print('Error decoding userAvatar: $e');
        userAvatarImage =
            Image.asset(tProfileLogo); // Replace with a default image
      }
    } else {
      // Handle the case where userAvatar is null
      userAvatarImage =
          Image.asset(tProfileLogo); // Replace with a default image
    }
    return Scaffold(
      backgroundColor: tbackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tAppbarColor,
        title: const Text(tEditProfile,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        centerTitle: true,
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: Colors.black.withOpacity(0.1), width: 1),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Obx(
                          () => userController.selectedImagePath.value == ''
                              ? userAvatarImage
                              : Image.file(
                                  File(userController.selectedImagePath.value),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // -- Show Image Source Dialog
                        userController.showImageSourceDialog();
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: tPrimaryColor,
                        ),
                        child: const Icon(LineAwesomeIcons.camera,
                            color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

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
                      future: null,
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
                      future: null,
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
                      future: null,
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
                      future: null,
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
                      future: null,
                    ),

                    // const SizedBox(height: 10),
                    // FutureBuilder<String?>(
                    //   // future: userController.getUserPassword(),
                    //   builder: (context, snapshot) {
                    //     if (snapshot.connectionState ==
                    //         ConnectionState.waiting) {
                    //       return const CircularProgressIndicator();
                    //     } else if (snapshot.hasError) {
                    //       return Text('Error: ${snapshot.error}');
                    //     } else {
                    //       return TextFormField(
                    //         // initialValue: snapshot.data ?? '',
                    //         controller: userController.passwordController,
                    //         obscureText: true,
                    //         decoration: InputDecoration(
                    //           label: const Text(tPassword),
                    //           prefixIcon: const Icon(Icons.fingerprint),
                    //           suffixIcon: IconButton(
                    //               icon: const Icon(LineAwesomeIcons.eye_slash),
                    //               onPressed: () {}),
                    //         ),
                    //       );
                    //     }
                    //   },
                    //   future: null,
                    // ),

                    const SizedBox(height: 20),

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => userController.updateUser(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: tButtonColor,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text(tEditProfile,
                            style: TextStyle(color: Colors.white)),
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
