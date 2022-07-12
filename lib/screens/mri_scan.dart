import 'package:flutter/material.dart';
import 'package:team_five/constants/constants.dart';
import 'package:team_five/screens/MRI%20Scan/body_part.dart';

class MriScanScreen extends StatefulWidget {
  const MriScanScreen({Key? key}) : super(key: key);

  @override
  State<MriScanScreen> createState() => _MriScanScreenState();
}

class _MriScanScreenState extends State<MriScanScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const BackButton(color: black),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: white,
            ),
          ),
          title: Text(
            'MRI Scan',
            style: TextStyle(
              color: black,
              fontSize: width >= 600
                  ? const AdaptiveTextSize().getadaptiveTextSize(context, 16)
                  : 20,
            ),
          ),
          // centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            // construct the profile details widget here
            SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  'Which MRI are you looking for ?',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: width >= 600
                        ? const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 16)
                        : 20,
                  ),
                ),
              ),
            ),

            // the tab bar with two items
            SizedBox(
              height: 50,
              child: AppBar(
                elevation: 0,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    color: white,
                  ),
                ),
                bottom: TabBar(
                  labelColor: black,
                  indicatorColor: maincolor,
                  labelStyle: TextStyle(
                    fontSize: width >= 600
                        ? const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 15)
                        : 18,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: const [
                    Tab(
                      text: 'Body Parts',
                    ),
                    Tab(
                      text: 'Common',
                    ),
                    Tab(
                      text: 'A to Z',
                    ),
                  ],
                ),
              ),
            ),

            // create widgets for each tab bar here
            const Expanded(
              child: TabBarView(
                children: [
                  BodyPartsScreen(),
                  Center(),
                  Center(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
