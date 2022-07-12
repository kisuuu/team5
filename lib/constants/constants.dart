// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

const white = Colors.white;
const maincolor = Color.fromRGBO(251, 129, 7, 1);
const black = Colors.black;
const grey = Colors.grey;

const blue = Color(0xFF4781ff);
const onBoardingTitle = TextStyle(
    fontSize: 30, color: Color(0xFF01002f), fontWeight: FontWeight.bold);
const onBoardingSubtitle = TextStyle(fontSize: 16, color: Color(0xFF88869f));
const onBoardingSkip = TextStyle(fontSize: 20, color: Colors.black);
const bookingtext = Color.fromRGBO(119, 122, 149, 1);
const privilegecardcontainer = Color.fromRGBO(211, 207, 242, 1);

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}
