import 'package:flutter/material.dart';
import 'package:team_five/constants/constants.dart';
import 'package:team_five/dignostics/home_service.dart';
import 'package:team_five/dignostics/visit_lab_screen.dart';

class DignosticsScreen extends StatelessWidget {
  const DignosticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: black),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: white,
            ),
          ),
          title: Text(
            'Dignostics',
            style: TextStyle(
              fontSize: width >= 600
                  ? const AdaptiveTextSize().getadaptiveTextSize(context, 15)
                  : 20,
              color: black,
            ),
          ),
          bottom: TabBar(
            labelColor: black,
            labelStyle: TextStyle(
              fontSize: width >= 600
                  ? const AdaptiveTextSize().getadaptiveTextSize(context, 15)
                  : 18,
              fontWeight: FontWeight.bold,
            ),
            tabs: const [
              Tab(
                text: 'Visit Lab',
              ),
              Tab(
                text: 'Home Service',
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            VisitLabScreen(),
            HomeServiceScreen(),
          ],
        ),
      ),
    );
  }
}
