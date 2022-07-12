// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../constants/constants.dart';

class VisitLab {
  final String visitLabFor;

  VisitLab({
    required this.visitLabFor,
  });
}

class HomeService {
  final String dealHomeService;

  HomeService({
    required this.dealHomeService,
  });
}

class Gender {
  String name;
  bool isSelected;

  Gender({
    required this.name,
    required this.isSelected,
  });
}

class MriBodyParts {
  final String shortName;
  final String fullName;

  MriBodyParts({
    required this.shortName,
    required this.fullName,
  });
}

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}

class PrivilegeCard {
  final String privilegeDescription;

  PrivilegeCard({
    required this.privilegeDescription,
  });
}

class HealthCheckUp {
  final String healthCheckupTitle;
  final String healthCheckupRs;
  final String healthCheckupList;
  final String healthCheckupimageurl;

  HealthCheckUp({
    required this.healthCheckupTitle,
    required this.healthCheckupRs,
    required this.healthCheckupList,
    required this.healthCheckupimageurl,
  });
}

class HospitalLab {
  String hospitalName;
  String hospitalAddress;

  HospitalLab({
    required this.hospitalName,
    required this.hospitalAddress,
  });

  static HospitalLab fromJson(json) => HospitalLab(
        hospitalName: json['hospitalName'],
        hospitalAddress: json['hospitalAddress'],
      );
}

class BookingHistory {
  String name;
  String testType;
  String centerNAme;
  String amount;

  BookingHistory({
    required this.name,
    required this.testType,
    required this.centerNAme,
    required this.amount,
  });

  static BookingHistory fromJson(json) => BookingHistory(
        name: json['name'],
        testType: json['testType'],
        centerNAme: json['centerNAme'],
        amount: json['amount'],
      );
}

class NotificationList {
  final String notificationTitle;
  final String notificationSubtitle;

  NotificationList({
    required this.notificationTitle,
    required this.notificationSubtitle,
  });
}

class ProfileList {
  final String profileImage;
  final String noProfileImage;
  final String profileName;
  final String profileGender;
  final String profilePhoneNumber;
  final String profileEmail;
  final String profileDateOfBirth;
  final String profilePincode;

  ProfileList({
    required this.profileImage,
    required this.noProfileImage,
    required this.profileName,
    required this.profileGender,
    required this.profilePhoneNumber,
    required this.profileEmail,
    required this.profileDateOfBirth,
    required this.profilePincode,
  });
}

class Sizebxh15 extends StatelessWidget {
  const Sizebxh15({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 15,
    );
  }
}

class Sizebxw15 extends StatelessWidget {
  const Sizebxw15({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 15,
    );
  }
}

class Sizebxh20 extends StatelessWidget {
  const Sizebxh20({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}

class SubjectModel {
  String subjectId;
  String subjectName;
  SubjectModel({
    required this.subjectId,
    required this.subjectName,
  });
}

class ProfileListDetails {
  static ProfileList myProfile = ProfileList(
    noProfileImage: 'https://picsum.photos/seed/picsum/200/300',
    profileName: 'Deepak',
    profileEmail: 'creativeteam@gmail.com',
    profileDateOfBirth: '03-09-1999',
    profileGender: 'Male',
    profileImage: 'https://picsum.photos/id/237/200/300',
    profilePhoneNumber: '1245787874',
    profilePincode: '400078',
  );
}

class FormText extends StatelessWidget {
  String text;
  FormText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: grey,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
