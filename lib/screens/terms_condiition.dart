import 'package:flutter/material.dart';
import 'package:team_five/constants/constants.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

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
          'Terms & Conditions',
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
          horizontal: 15,
          // vertical: 10,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1. Terms',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width >= 600
                        ? const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 14)
                        : 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Tellus at sit ante rutrum suspendisse pretium, vitae vel dignissim. Nunc, scelerisque adipiscing condimentum massa dignissim tortor leo lacus. Sapien felis ultrices fringilla nisi sit nibh. Etiam volutpat nisl ornare lorem mus at a, et pulvinar. ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: width >= 600
                        ? const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 12)
                        : 16,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  '2. Use License',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width >= 600
                        ? const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 14)
                        : 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Fermentum erat nisl duis varius risus. Augue ac facilisi porta metus enim. Ullamcorper lacus praesent rhoncus, sapien rutrum nulla mattis vitae ultrices. ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: width >= 600
                        ? const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 14)
                        : 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '● Fermentum erat nisl duis varius risus.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: width >= 600
                              ? const AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 14)
                              : 16,
                        ),
                      ),
                      Text(
                        '● Augue ac facilisi porta metus enim.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: width >= 600
                              ? const AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 14)
                              : 16,
                        ),
                      ),
                      Text(
                        '● Ullamcorper lacus praesent rhoncus, sapien rutrum nulla mattis vitae ultrices.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: width >= 600
                              ? const AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 14)
                              : 16,
                        ),
                      ),
                      Text(
                        '● Nunc, scelerisque adipiscing condimentum massa dignissim tortor leo lacus.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: width >= 600
                              ? const AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 14)
                              : 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Aliquam eget purus sit malesuada tempor euismod. Eget commodo ultricies ut elit hendrerit risus. Elementum tellus nisl lectus bibendum malesuada orci dui. Nunc pharetra.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: width >= 600
                        ? const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 14)
                        : 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
