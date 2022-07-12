import 'package:flutter/material.dart';
import 'package:team_five/components/lists.dart';
import 'package:team_five/constants/constants.dart';

import 'Mri_scan_for_brain.dart';

class BodyPartsScreen extends StatefulWidget {
  const BodyPartsScreen({Key? key}) : super(key: key);

  @override
  State<BodyPartsScreen> createState() => _BodyPartsScreenState();
}

class _BodyPartsScreenState extends State<BodyPartsScreen> {
  List<MriBodyParts> mriforbodyparts = [
    MriBodyParts(
      shortName: 'Brain',
      fullName: 'MRI Scan For Brain',
    ),
    MriBodyParts(
      shortName: 'Spine',
      fullName: 'MRI Scan For Brain',
    ),
    MriBodyParts(
      shortName: 'Joints',
      fullName: 'MRI Scan For Brain',
    ),
    MriBodyParts(
      shortName: 'Abdomen',
      fullName: 'MRI Scan For Brain',
    ),
    MriBodyParts(
      shortName: 'Pelvic region ',
      fullName: 'MRI Scan For Brain',
    ),
    MriBodyParts(
      shortName: 'Breast',
      fullName: 'MRI Scan For Brain',
    ),
    MriBodyParts(
      shortName: 'Blood vessels ',
      fullName: 'MRI Scan For Brain',
    ),
    MriBodyParts(
      shortName: 'Heart',
      fullName: 'MRI Scan For Brain',
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
            Expanded(
              child: Column(
                children: [
                  MriscanBodypart(
                      width: width,
                      titleText: 'Brain',
                      nextpage: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MriForBrain(),
                          ),
                        );
                      }),
                  MriscanBodypart(
                    width: width,
                    titleText: 'Spine',
                    nextpage: () {},
                  ),
                  MriscanBodypart(
                    width: width,
                    titleText: 'Joints',
                    nextpage: () {},
                  ),
                  MriscanBodypart(
                    width: width,
                    titleText: 'Abdomen',
                    nextpage: () {},
                  ),
                  MriscanBodypart(
                    width: width,
                    titleText: 'Pelvic region',
                    nextpage: () {},
                  ),
                  MriscanBodypart(
                    width: width,
                    titleText: 'Breast',
                    nextpage: () {},
                  ),
                  MriscanBodypart(
                    width: width,
                    titleText: 'Blood vessels',
                    nextpage: () {},
                  ),
                  MriscanBodypart(
                    width: width,
                    titleText: 'Heart',
                    nextpage: () {},
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

// ignore: must_be_immutable
class MriscanBodypart extends StatelessWidget {
  String titleText;
  VoidCallback nextpage;

  MriscanBodypart({
    required this.titleText,
    required this.nextpage,
    Key? key,
    required this.width,
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
          onTap: nextpage,
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
                titleText,
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
