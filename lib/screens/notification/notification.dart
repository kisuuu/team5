// ignore_for_file: must_be_immutable, unnecessary_const

import 'package:flutter/material.dart';
import 'package:team_five/constants/constants.dart';

import '../../components/lists.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);

  List<NotificationList> notificationlists = [
    NotificationList(
      notificationTitle: 'Your Card Validation is Expired',
      notificationSubtitle: 'Renew your Card Now',
    ),
    NotificationList(
      notificationTitle: 'New offer for our  customer',
      notificationSubtitle: 'Get  upto 50% off',
    ),
    NotificationList(
      notificationTitle: 'Your Card Validation is Expired',
      notificationSubtitle: 'Renew your Card Now',
    ),
    NotificationList(
      notificationTitle: 'Your Card Validation is Expired',
      notificationSubtitle: 'Renew your Card Now',
    ),
    NotificationList(
      notificationTitle: 'Your Card Validation is Expired',
      notificationSubtitle: 'Renew your Card Now',
    ),
  ];

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
          'Notification',
          style: TextStyle(
            color: black,
            fontSize: width >= 600
                ? const AdaptiveTextSize().getadaptiveTextSize(context, 16)
                : 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: ListView.builder(
          itemCount: notificationlists.length,
          itemBuilder: (context, index) {
            final notification = notificationlists[index];
            return SizedBox(
              height: width >= 600
                  ? const AdaptiveTextSize().getadaptiveTextSize(context, 60)
                  : 80,
              child: Card(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    title: Text(
                      notification.notificationTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width >= 600
                            ? const AdaptiveTextSize()
                                .getadaptiveTextSize(context, 13)
                            : 14,
                      ),
                    ),
                    subtitle: Text(
                      notification.notificationSubtitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: width >= 600
                            ? const AdaptiveTextSize()
                                .getadaptiveTextSize(context, 13)
                            : 13,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
