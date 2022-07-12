// ignore_for_file: avoid_print, must_be_immutable

import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:team_five/components/lists.dart';
import 'package:team_five/constants/constants.dart';
import 'package:team_five/screens/profile%20screens/profile.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final updateProfilekey = GlobalKey<FormState>();
  TextEditingController nameController =
      TextEditingController(text: 'Deepak Khot');
  TextEditingController genderController = TextEditingController(text: 'Male');
  TextEditingController phoneNumberController =
      TextEditingController(text: '9854765213');
  TextEditingController emailController =
      TextEditingController(text: 'somthing@gmail.com');
  TextEditingController pincodeController =
      TextEditingController(text: '400052');
  TextEditingController dateOfBirthController = TextEditingController();
  bool isSignupScreen = true;
  ImagePicker imagePicker = ImagePicker();

  File? image;

  File? pickedFile;

  Future pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        return;
      }

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }

  Future pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }

    final imageTemporary = File(image.path);
    setState(() => this.image = imageTemporary);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(color: black),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: white,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: black,
          ),
        ),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return false;
        },
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Form(
                  key: updateProfilekey,
                  child: Column(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/images/logiin_profile.png",
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: ((builder) => bottomSheet()),
                                  );
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: maincolor,
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt_outlined,
                                    color: white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            const Sizebxh15(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  const Sizebxh15(),
                                  // name
                                  ProfileContent(
                                    icon: Icons.person_outline,
                                    labelText: 'Name',
                                    controller: nameController,
                                    emptyValidateText: "name can't be empty",
                                    keyboardType: TextInputType.text,
                                    updateProfileHintText:
                                        'enter your full name',
                                  ),

                                  // gender
                                  ProfileContent(
                                    icon: CupertinoIcons.person_2,
                                    labelText: 'Gender',
                                    controller: genderController,
                                    emptyValidateText: "name can't be empty",
                                    keyboardType: TextInputType.text,
                                    updateProfileHintText:
                                        'enter your full name',
                                  ),

                                  // phone number
                                  ProfileContent(
                                    icon: Icons.phone_in_talk_outlined,
                                    labelText: 'Phone Number',
                                    controller: phoneNumberController,
                                    emptyValidateText: "name can't be empty",
                                    keyboardType: TextInputType.phone,
                                    updateProfileHintText:
                                        'enter your full name',
                                    mobileLength: 10,
                                  ),

                                  // email
                                  ProfileContent(
                                    icon: Icons.mail_outline_rounded,
                                    labelText: 'Email',
                                    controller: emailController,
                                    emptyValidateText: "name can't be empty",
                                    keyboardType: TextInputType.emailAddress,
                                    updateProfileHintText:
                                        'enter your full name',
                                  ),

                                  // DOB
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Icon(
                                        Icons.calendar_today_outlined,
                                        color: bookingtext,
                                        // Icons.person_outline,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            'Date of birth',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: bookingtext,
                                              // color: subtitleColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextFormField(
                                    cursorColor: black,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Date of birth can't be empty";
                                      }
                                      return null;
                                    },
                                    readOnly: true,
                                    controller: dateOfBirthController,
                                    decoration: const InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.calendar_month_sharp,
                                        color: grey,
                                      ),
                                      hintText: "Select date of birth",
                                      hintStyle: TextStyle(
                                        color: bookingtext,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      border: UnderlineInputBorder(),
                                      enabledBorder: UnderlineInputBorder(),
                                      focusedBorder: UnderlineInputBorder(),
                                    ),
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime
                                            .now(), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(3000),
                                      );

                                      if (pickedDate != null) {
                                        print(pickedDate);
                                        String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);

                                        setState(() {
                                          dateOfBirthController.text =
                                              formattedDate;
                                        });
                                      } else {}
                                    },
                                  ),

                                  const Sizebxh15(),

                                  // pincode
                                  ProfileContent(
                                    controller: pincodeController,
                                    icon: Icons.location_on_outlined,
                                    emptyValidateText: "name can't be empty",
                                    keyboardType: TextInputType.number,
                                    updateProfileHintText:
                                        'enter your full name',
                                    labelText: 'Pincode',
                                    mobileLength: 6,
                                  ),

                                  const Sizebxh15(),

                                  Center(
                                    child: SizedBox(
                                      width: 150,
                                      height: 40,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: maincolor,
                                          onPrimary: white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                        ),
                                        onPressed: () {
                                          if (updateProfilekey.currentState!
                                              .validate()) {
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ProfileScreen()),
                                              (Route<dynamic> route) => false,
                                            );
                                          }
                                        },
                                        child: const Text(
                                          "Update",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Sizebxh15(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    pickedFile = File(pickedImage!.path);
    print(pickedFile!.path);
    // setState(() {
    //   _imageFile = PickedFile!;
    // });
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(
        20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: const Icon(
                  Icons.camera,
                  color: black,
                ),
                onPressed: () {
                  pickImageFromCamera();
                },
                label: const Text(
                  "Cameras",
                  style: TextStyle(
                    color: black,
                  ),
                ),
              ),
              TextButton.icon(
                icon: const Icon(
                  Icons.image,
                  color: black,
                ),
                onPressed: () {
                  pickImageFromGallery();
                },
                label: const Text(
                  "Gallery",
                  style: TextStyle(
                    color: black,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProfileContent extends StatelessWidget {
  TextEditingController controller;
  TextInputType keyboardType;
  IconData icon;
  String labelText;
  String updateProfileHintText;
  String emptyValidateText;
  int mobileLength;
  ProfileContent({
    required this.controller,
    required this.keyboardType,
    required this.updateProfileHintText,
    required this.icon,
    required this.labelText,
    required this.emptyValidateText,
    this.mobileLength = 1000,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: bookingtext,
              // Icons.person_outline,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  labelText,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: bookingtext,
                    // color: subtitleColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        TextFormField(
          maxLength: mobileLength,
          cursorColor: black,
          validator: (value) {
            if (value!.isEmpty) {
              return emptyValidateText;
              // return "name can't be empty";
            }
            return null;
          },
          // initialValue: 'Deepak',
          controller: controller,
          keyboardType: keyboardType,

          // keyboardType: TextInputType.text,
          decoration: InputDecoration(
            counterText: "",
            hintText: updateProfileHintText,
            // hintText: "enter your full name",
            hintStyle: const TextStyle(
              color: bookingtext,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            border: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
          ),
        ),

        // Container(
        //   decoration: const BoxDecoration(
        //     border: Border(
        //       bottom: BorderSide(
        //         width: 1,
        //         color: bookingtext,
        //       ),
        //     ),
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Expanded(
        //           child: Text(
        //             TextFieldText,
        //             // "400052",
        //             style: TextStyle(
        //               fontSize: 15,
        //               fontWeight: FontWeight.w600,
        //               color: bookingtext,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
