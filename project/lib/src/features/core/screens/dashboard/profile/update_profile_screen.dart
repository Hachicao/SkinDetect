import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/constants/image_string.dart';
import 'package:project/src/constants/text_string.dart';
import '../../../controllers/user_controller.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    final userModel = userController.getUserModel;
    Image userAvatarImage;
    // DateTime? dateJoined = userModel?.dateJoined != null
    //     ? DateTime.parse(userModel!.dateJoined!)
    //     : null;

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
    final Size size = MediaQuery.of(context).size;
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
          padding: EdgeInsets.all(size.width * 0.05),
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
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: FutureBuilder<String?>(
                            // future: userController.getUserName(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return TextFormField(
                                  controller:
                                      userController.firstNameController,
                                  // initialValue: snapshot.data ?? '',
                                  decoration: const InputDecoration(
                                    label: Text('First Name'),
                                    prefixIcon: Icon(Icons.person_4_outlined,
                                        color: Colors.black),
                                  ),
                                );
                              }
                            },
                            future: null,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: FutureBuilder<String?>(
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return TextFormField(
                                  controller: userController.lastNameController,
                                  // initialValue: snapshot.data ?? '',
                                  decoration: const InputDecoration(
                                    label: Text('Last Name'),
                                    prefixIcon: Icon(Icons.person_4_outlined,
                                        color: Colors.black),
                                  ),
                                );
                              }
                            },
                            future: null,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                        bottom:
                            BorderSide(color: Colors.black.withOpacity(0.5)),
                      )),
                      child: Row(
                        children: [
                          // Padding(
                          //   padding: EdgeInsets.only(left: size.width * 0.02),
                          //   child: const Row(
                          //     children: [
                          //       Icon(Icons.person, color: Colors.black),
                          //       SizedBox(width: 5),
                          //       Text('Gender')
                          //     ],
                          //   ),
                          // ),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  value: 'Male',
                                  groupValue:
                                      userController.genderController.text,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        userController.genderController.text =
                                            value.toString();
                                      },
                                    );
                                  },
                                ),
                                const Text(
                                  'Male',
                                ),
                                Radio(
                                  value: 'Female',
                                  groupValue:
                                      userController.genderController.text,
                                  onChanged: (value) {
                                    setState(() {
                                      userController.genderController.text =
                                          value.toString();
                                    });
                                  },
                                ),
                                const Text('Female'),
                                Radio(
                                  value: 'Other',
                                  groupValue:
                                      userController.genderController.text,
                                  onChanged: (value) {
                                    setState(() {
                                      userController.genderController.text =
                                          value.toString();
                                    });
                                  },
                                ),
                                const Text('Other'),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                              prefixIcon: Icon(Icons.add_home_work_sharp,
                                  color: Colors.black),
                            ),
                          );
                        }
                      },
                      future: null,
                    ),

                    const SizedBox(height: 10),

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
                              prefixIcon: Icon(Icons.date_range_outlined,
                                  color: Colors.black),
                            ),
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
                              prefixIcon:
                                  Icon(Icons.phone, color: Colors.black),
                            ),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              // example 1234567890
                              if (!RegExp(r"^(?:[+0]9)?[0-9]{10}$")
                                  .hasMatch(value)) {
                                return 'Please enter valid phone number';
                              }
                              return null;
                            },
                          );
                        }
                      },
                      future: null,
                    ),

                    const SizedBox(height: 20),

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            userController.updateUser();
                          }
                        },
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
                        // Text(
                        //   'Joined: ${dateJoined != null ? DateFormat('dd-MM-yyyy').format(dateJoined) : 'N/A'}',
                        //   style: const TextStyle(
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.normal,
                        //       color: Colors.black),
                        // ),
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
