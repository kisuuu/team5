// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team_five/components/lists.dart';
import 'package:team_five/constants/constants.dart';
import 'package:team_five/screens/profile%20screens/update_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          'Profile',
          style: TextStyle(
            color: black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const Sizebxh20(),
              Center(
                child: Container(
                  width: 85,
                  height: 85,
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
              ),
              Center(
                child: Column(
                  children: [
                    const Sizebxh15(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          const Sizebxh15(),
                          // name
                          ProfileContent(
                            icon: Icons.person_outline,
                            labelText: 'Name',
                            textFieldText: 'Deepak Khot',
                          ),

                          // gender
                          ProfileContent(
                            icon: CupertinoIcons.person_2,
                            labelText: 'Gender',
                            textFieldText: 'Male',
                          ),

                          // phone number
                          ProfileContent(
                            icon: Icons.phone_in_talk_outlined,
                            labelText: 'Phone Number',
                            textFieldText: '9874512352',
                          ),

                          // email
                          ProfileContent(
                            icon: Icons.mail_outline_rounded,
                            labelText: 'Email',
                            textFieldText: 'somthing@gmail.com',
                          ),

                          // DOB
                          ProfileContent(
                            icon: Icons.calendar_today_outlined,
                            labelText: 'Date of birth',
                            textFieldText: '03-09-1999',
                          ),

                          // pincode
                          ProfileContent(
                            textFieldText: '400052',
                            icon: Icons.location_on_outlined,
                            labelText: 'Pincode',
                          ),

                          const SizedBox(
                            height: 10,
                          ),

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
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const UpdateProfile(),
                                  ),
                                ),
                                child: const Text(
                                  "Edit",
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
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileContent extends StatelessWidget {
  String textFieldText;
  IconData icon;
  String labelText;
  ProfileContent({
    required this.textFieldText,
    required this.icon,
    required this.labelText,
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
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: bookingtext,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    textFieldText,
                    // "400052",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: bookingtext,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
