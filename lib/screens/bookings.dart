// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:team_five/constants/constants.dart';
import 'package:team_five/screens/MRI%20Scan/add_family.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

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
          'Bookings',
          style: TextStyle(
            color: black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          // vertical: 15,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    BookingContainer(),
                    BookingContainer(),
                    BookingContainer(),
                    BookingContainer(),
                    BookingContainer(),
                    BookingContainer(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BottomButtons(
                    text: 'Add Family',
                    navigation: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddFamilyScreen()),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  BottomButtons(
                    text: 'Proceed To Pay',
                    navigation: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => HomeScreen()),
                      // );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomButtons extends StatelessWidget {
  String text;
  VoidCallback navigation;
  BottomButtons({Key? key, required this.text, required this.navigation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: maincolor,
            onPrimary: white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            minimumSize: const Size(100, 50), //////// HERE
          ),
          onPressed: navigation,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class BookingContainer extends StatelessWidget {
  const BookingContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Column(
            children: const [
              SizedBox(
                height: 20,
              ),
              Text(
                'Privilege Card Holder',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: maincolor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: grey,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            child: Column(
              children: [
                //name
                BookingDetails(
                  text: 'Name',
                  textValue: 'Deepak Prasad Khot',
                ),
                const LineSpacing(),
                // gender
                BookingDetails(
                  text: 'Gender',
                  textValue: 'Male',
                ),
                const LineSpacing(),
                // dob
                BookingDetails(
                  text: 'DOB',
                  textValue: '03-09-1999',
                ),
                const LineSpacing(),
                //  test
                BookingDetails(
                  text: 'Test',
                  textValue: 'MRI Scan for brain',
                ),
                const LineSpacing(),
                // center
                BookingDetails(
                  text: 'Center',
                  textValue: 'Jhunjhunwala Hospital',
                ),
                const LineSpacing(),
                // app date
                BookingDetails(
                  text: 'App Date',
                  textValue: '3rd May 2022',
                ),
                const LineSpacing(),
                // amount
                BookingDetails(
                  text: 'Amount',
                  textValue: '₹ 900',
                ),
                const LineSpacing(),
                // discount
                BookingDetails(
                  text: 'Discount',
                  textValue: '5 %',
                ),
                const LineSpacing(),
                // total amount
                BookingDetailsTotalAmount(
                  text: 'Total Amount',
                  textValue: '₹ 855',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class LineSpacing extends StatelessWidget {
  const LineSpacing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 5,
    );
  }
}

class BookingDetails extends StatelessWidget {
  String text;
  String textValue;
  BookingDetails({
    Key? key,
    required this.text,
    required this.textValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            text,
            style: const TextStyle(
              color: bookingtext,
              fontSize: 15,
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Text(
            textValue,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: grey,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}

class BookingDetailsTotalAmount extends StatelessWidget {
  String text;
  String textValue;
  BookingDetailsTotalAmount({
    Key? key,
    required this.text,
    required this.textValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Text(
            textValue,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
