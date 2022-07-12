import 'package:flutter/material.dart';
import 'package:team_five/components/lists.dart';
import 'package:team_five/constants/constants.dart';

import '../screens/mri_scan.dart';

class VisitLabScreen extends StatefulWidget {
  const VisitLabScreen({Key? key}) : super(key: key);

  @override
  State<VisitLabScreen> createState() => _VisitLabScreenState();
}

class _VisitLabScreenState extends State<VisitLabScreen> {
  List<VisitLab> visitlablist = [
    VisitLab(
      visitLabFor: 'MRI Scan',
    ),
    VisitLab(
      visitLabFor: 'CT Scan',
    ),
    VisitLab(
      visitLabFor: 'Ultrasound',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
          15,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Scans',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width >= 600
                        ? const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 16)
                        : 20,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  DignosticList(
                    width: width,
                    label: 'MRI Scan',
                    page: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MriScanScreen(),
                        ),
                      );
                    },
                  ),
                  DignosticList(
                    width: width,
                    label: 'CT Scan',
                    page: () {},
                  ),
                  DignosticList(
                    width: width,
                    label: 'Ultrasound',
                    page: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DignosticList extends StatelessWidget {
  VoidCallback page;
  String label;
  DignosticList({
    Key? key,
    required this.width,
    required this.label,
    required this.page,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width >= 600
          ? const AdaptiveTextSize().getadaptiveTextSize(context, 50)
          : 60,
      child: Card(
        child: InkWell(
          onTap: page,
          // () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => const MriScanScreen(),
          //   ),
          // );
          // },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Text(
                label,
                // 'MRI Scan',
                style: TextStyle(
                  fontSize: width >= 600
                      ? const AdaptiveTextSize()
                          .getadaptiveTextSize(context, 13)
                      : 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
