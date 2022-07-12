import 'package:flutter/material.dart';
import 'package:team_five/components/lists.dart';

import '../../constants/constants.dart';

class HealthCheckupDetailsScreen extends StatelessWidget {
  final HealthCheckUp healthcheckup;
  const HealthCheckupDetailsScreen({Key? key, required this.healthcheckup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(color: black),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: white,
          ),
        ),
        title: const Text(
          'Health Checkup',
          style: TextStyle(
            color: black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.81,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.asset(
                        healthcheckup.healthCheckupimageurl,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Sizebxh15(),
                    Text(
                      healthcheckup.healthCheckupList,
                      style: const TextStyle(
                        fontSize: 17,
                        height: 2,
                        color: bookingtext,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250, // <-- Your width
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Book Now',
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
