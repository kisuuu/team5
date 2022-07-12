// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:team_five/constants/constants.dart';
import 'package:team_five/screens/booking%20history/booking_history.dart';
import 'package:team_five/screens/notification/notification.dart';
import 'package:team_five/screens/privacy%20policy/privacy_policy.dart';
import 'package:team_five/screens/profile%20screens/profile.dart';
import 'package:team_five/screens/terms_condiition.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Drawer(
      width: width >= 600
          ? const AdaptiveTextSize().getadaptiveTextSize(
              context,
              width * 0.32,
            )
          : width * 0.7,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Material(
      // color: Colors.amber,
      child: Container(
        padding: EdgeInsets.only(
          top: 35 + MediaQuery.of(context).padding.top,
          bottom: 10,
          left: 5,
          right: 5,
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: const NetworkImage(
                              "https://picsum.photos/seed/picsum/200/300"),
                          radius: width >= 600
                              ? const AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 20)
                              : 25,
                        ),
                        const Text(
                          "Deepak",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: width >= 600
                            ? const AdaptiveTextSize()
                                .getadaptiveTextSize(context, 20)
                            : 25,
                        child: const Icon(
                          Icons.add,
                          size: 30,
                          color: white,
                        ),
                      ),
                      const Text(
                        "Deepak",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Wrap(
      runSpacing: 0,
      children: [
        MenuList(
          width: width,
          icon: Icons.people_alt_sharp,
          text: 'About team5',
          path: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => AboutTeam5Screen(),
            // ));
          },
        ),
        MenuList(
          width: width,
          icon: Icons.chat,
          text: 'Terms & Conditions',
          path: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const TermsAndConditionScreen(),
            ));
          },
        ),
        MenuList(
          width: width,
          icon: Icons.privacy_tip,
          text: 'Privacy Policy',
          path: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PrivacyPolicyScreen(),
            ));
          },
        ),
        MenuList(
          width: width,
          icon: Icons.notifications_active,
          text: 'Notifications',
          path: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NotificationScreen(),
            ));
          },
        ),
        MenuList(
          width: width,
          icon: Icons.restore_page_sharp,
          text: 'Bookings History',
          path: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const BookingHistoryScreen(),
            ));
          },
        ),
        MenuList(
          width: width,
          icon: Icons.share,
          text: 'Share the App',
          path: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => AboutTeam5Screen(),
            // ));
          },
        ),
        MenuList(
          width: width,
          icon: Icons.logout,
          text: 'Logout',
          path: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => AboutTeam5Screen(),
            // ));
          },
        ),
      ],
    );
  }
}

class MenuList extends StatelessWidget {
  IconData icon;
  String text;
  VoidCallback path;
  MenuList({
    Key? key,
    required this.icon,
    required this.text,
    required this.path,
    required this.width,
  }) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: GestureDetector(
          child: Icon(
            icon,
            color: Colors.orange,
            size: width >= 600
                ? const AdaptiveTextSize().getadaptiveTextSize(context, 17)
                : 25,
          ),
        ),

        // Icon(
        //   Icons.people_alt_sharp,
        //   color: Colors.orange,
        // ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: width >= 600
                ? const AdaptiveTextSize().getadaptiveTextSize(context, 12)
                : 16,
          ),
        ),
        onTap: path
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => AboutTeam5Screen(),
        // )

        );
  }
}
