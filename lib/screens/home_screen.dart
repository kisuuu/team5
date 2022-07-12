// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:team_five/components/drawer.dart';
import 'package:team_five/components/lists.dart';
import 'package:team_five/constants/constants.dart';
import 'package:team_five/privilege%20card/privilege_card.dart';
import 'package:team_five/screens/dignostics_screen.dart';
import 'package:team_five/screens/health%20checkup/health_checkup.dart';
import 'package:team_five/screens/hospital/view_all.dart';
import 'package:team_five/screens/notification/notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(
              255,
              17,
              199,
              177,
            ),
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_active_rounded,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NotificationScreen(),
                ),
              );
            },
          ),
          // add more IconButton
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Your location',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            Text(
              'Mumbai',
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      drawer: const NavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          // vertical: 15,
          horizontal: 25,
        ),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    const Sizebxh15(),
                    GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 10,
                      ),
                      shrinkWrap: true,
                      children: [
                        HomePageGridView(
                          color: const Color.fromARGB(255, 158, 54, 107),
                          icon: 'assets/images/dignosics.png',
                          title: 'Dignostics',
                          navigation: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const DignosticsScreen(),
                              ),
                            );
                          },
                        ),
                        HomePageGridView(
                          color: const Color.fromARGB(255, 85, 84, 219),
                          icon: 'assets/images/covid-19.png',
                          title: 'ACOVID-19',
                          navigation: () {},
                        ),
                        HomePageGridView(
                          color: const Color.fromARGB(255, 255, 168, 115),
                          icon: 'assets/images/health_check.png',
                          title: 'Health Check',
                          navigation: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const HealthCheckupScreen(),
                              ),
                            );
                          },
                        ),
                        HomePageGridView(
                          color: const Color.fromARGB(255, 160, 121, 236),
                          icon: 'assets/images/Privilege_Card.png',
                          title: 'Privilege Card',
                          navigation: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PrivilegeCardScreen(),
                              ),
                            );
                          },
                        ),
                        HomePageGridView(
                          color: const Color.fromARGB(255, 11, 184, 184),
                          icon: 'assets/images/insurance.png',
                          title: 'Insurance',
                          navigation: () {},
                        ),
                        HomePageGridView(
                          color: const Color.fromARGB(255, 219, 84, 84),
                          icon: 'assets/images/request_a_call.png',
                          title: 'Request a Call',
                          navigation: () {},
                        ),
                      ],
                    ),
                    const Sizebxh15(),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/aboutus.png',
                          // fit: BoxFit.fitWidth,
                          width: MediaQuery.of(context).size.width * 0.87,
                          // height: 200,
                        ),
                      ],
                    ),
                    const Sizebxh15(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Hospital Labs',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: width >= 600
                                    ? const AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 17)
                                    : 20,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        HospitalViewAllScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'View all',
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: width >= 600
                                      ? const AdaptiveTextSize()
                                          .getadaptiveTextSize(context, 12)
                                      : 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: width >= 600
                              ? const AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 120)
                              : 150,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              VerticalLab(
                                title: 'Hospital Labs',
                                urlImage: 'assets/images/hospitallab.jpg.jpg',
                              ),
                              const Sizebxw15(),
                              VerticalLab(
                                title: 'Hospital Labs',
                                urlImage: 'assets/images/hospitallab.jpg.jpg',
                              ),
                              const Sizebxw15(),
                              VerticalLab(
                                title: 'Hospital Labs',
                                urlImage: 'assets/images/hospitallab.jpg.jpg',
                              ),
                              const Sizebxw15(),
                              VerticalLab(
                                title: 'Hospital Labs',
                                urlImage: 'assets/images/hospitallab.jpg.jpg',
                              ),
                              const Sizebxw15(),
                              VerticalLab(
                                title: 'Hospital Labs',
                                urlImage: 'assets/images/hospitallab.jpg.jpg',
                              ),
                              const Sizebxw15(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/offer.png',
                          // fit: BoxFit.fitWidth,
                          width: MediaQuery.of(context).size.width * 0.87,
                          // height: 200,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VerticalLab extends StatelessWidget {
  String urlImage;
  String title;
  VerticalLab({
    Key? key,
    required this.title,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CircleAvatar(
          radius: width >= 600
              ? const AdaptiveTextSize().getadaptiveTextSize(context, 35)
              : 38, // Image radius
          backgroundImage: AssetImage(urlImage),
          // backgroundImage: AssetImage('assets/images/hospitallab.jpg.jpg'),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: width >= 600
                ? const AdaptiveTextSize().getadaptiveTextSize(context, 13)
                : 12,
          ),
        ),
        // Text('Hospital Labs'),
      ],
    );
  }
}

class HomePageGridView extends StatelessWidget {
  Color color;
  VoidCallback navigation;
  final String icon;
  final String title;
  HomePageGridView({
    Key? key,
    required this.icon,
    required this.title,
    required this.navigation,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: color,
        // color: const Color.fromARGB(255, 158, 54, 107),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: InkWell(
        onTap: navigation,
        child: SizedBox(
          height: 70,
          width: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.12,
                height: MediaQuery.of(context).size.width * 0.12,
                // color: Colors.amber,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(icon),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: width >= 600
                        ? const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 13)
                        : 12,
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
