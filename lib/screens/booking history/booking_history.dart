import 'package:flutter/material.dart';
import 'package:team_five/components/lists.dart';
import 'package:team_five/constants/constants.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({Key? key}) : super(key: key);

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  List<BookingHistory> bookinghistorys = getBookingHistorys();
  static List<BookingHistory> getBookingHistorys() {
    const data = [
      {
        "centerNAme": "Jhunhunwala Hospital, Bhandup (West)",
        "name": "Deepak Khot",
        "testType": "MRI Brain Scan ",
        "amount": "₹ 855",
      },
      {
        "centerNAme": "Jhunhunwala Hospital, Bhandup (West)",
        "name": "Deepak Khot",
        "testType": "MRI Brain Scan ",
        "amount": "₹ 855",
      },
    ];

    return data.map<BookingHistory>(BookingHistory.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(color: black),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: white,
          ),
        ),
        title: Text(
          'Booking History',
          style: TextStyle(
            color: black,
            fontSize: width >= 600
                ? const AdaptiveTextSize().getadaptiveTextSize(context, 16)
                : 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(child: buildHospitals(bookinghistorys)),
      ),
    );
  }

  Widget buildHospitals(List<BookingHistory> bookinghistorys) {
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
        itemCount: bookinghistorys.length,
        itemBuilder: (context, index) {
          final hospital = bookinghistorys[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hospital.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width >= 600
                      ? const AdaptiveTextSize()
                          .getadaptiveTextSize(context, 16)
                      : 17,
                  color: const Color.fromRGBO(9, 112, 87, 1),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                hospital.testType,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width >= 600
                      ? const AdaptiveTextSize()
                          .getadaptiveTextSize(context, 14)
                      : 15,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                hospital.centerNAme,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width >= 600
                      ? const AdaptiveTextSize()
                          .getadaptiveTextSize(context, 14)
                      : 17,
                  color: grey,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.picture_as_pdf,
                            size: width >= 600
                                ? const AdaptiveTextSize()
                                    .getadaptiveTextSize(context, 17)
                                : 18,
                            color: Colors.red,
                          ),
                        ),
                        TextSpan(
                          text: " Download",
                          style: TextStyle(
                            fontSize: width >= 600
                                ? const AdaptiveTextSize()
                                    .getadaptiveTextSize(context, 13)
                                : 14,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    hospital.amount,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width >= 600
                          ? const AdaptiveTextSize()
                              .getadaptiveTextSize(context, 14)
                          : 15,
                      color: grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: width >= 600
                    ? const AdaptiveTextSize().getadaptiveTextSize(context, 29)
                    : 30,
              ),
            ],
          );
        });
  }
}
