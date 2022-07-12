import 'package:flutter/material.dart';
import 'package:team_five/components/lists.dart';
import 'package:team_five/constants/constants.dart';
import 'package:team_five/dignostics/visit_lab_screen.dart';
import 'package:team_five/screens/home_services/home_services_booking.dart';

class HomeServiceScreen extends StatefulWidget {
  const HomeServiceScreen({Key? key}) : super(key: key);

  @override
  State<HomeServiceScreen> createState() => _HomeServiceScreenState();
}

class _HomeServiceScreenState extends State<HomeServiceScreen> {
  List<HomeService> homeservicelist = [
    HomeService(
      dealHomeService: 'HbA1C @ Rs. 399',
    ),
    HomeService(
      dealHomeService: 'Thyroid Profile @ Rs. 399',
    ),
    HomeService(
      dealHomeService: 'Lipid Profile @ Rs. 399',
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
                  'Deals for Home Service',
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
              // height: 150,
              child: Column(
                children: [
                  DignosticList(
                    width: width,
                    label: 'HbA1C @ Rs. 399',
                    page: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const BookingHomeTestScreen(),
                        ),
                      );
                    },
                  ),
                  DignosticList(
                    width: width,
                    label: 'Thyroid Profile @ Rs. 399',
                    page: () {},
                  ),
                  DignosticList(
                    width: width,
                    label: 'Lipid Profile @ Rs. 399',
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
