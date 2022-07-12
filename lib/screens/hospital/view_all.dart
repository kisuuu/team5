// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:team_five/components/lists.dart';
import 'package:team_five/constants/constants.dart';

class HospitalViewAllScreen extends StatelessWidget {
  HospitalViewAllScreen({Key? key}) : super(key: key);
  List<HospitalLab> hospitallabs = getHospitallabs();
  static List<HospitalLab> getHospitallabs() {
    const data = [
      {
        "hospitalName": "Jhunhunwala Hospital, Bhandup (West)",
        "hospitalAddress":
            "Sheetal Apartment, B - Wing, 1st Floor, S Pratap Singh Rd,Bhandup West, opp. Shiv Sena Shakha, Mumbai, Maharashtra 400078",
      },
      {
        "hospitalName": "Jhunhunwala Hospital, Mulund (West)",
        "hospitalAddress":
            "Sheetal Apartment, B - Wing, 1st Floor, S Pratap Singh Rd,Bhandup West, opp. Shiv Sena Shakha, Mumbai, Maharashtra 400078",
      },
      {
        "hospitalName": "Jhunhunwala Hospital, Nahur (West)",
        "hospitalAddress":
            "Sheetal Apartment, B - Wing, 1st Floor, S Pratap Singh Rd,Bhandup West, opp. Shiv Sena Shakha, Mumbai, Maharashtra 400078",
      },
      {
        "hospitalName": "Jhunhunwala Hospital, Thane (West)",
        "hospitalAddress":
            "Sheetal Apartment, B - Wing, 1st Floor, S Pratap Singh Rd,Bhandup West, opp. Shiv Sena Shakha, Mumbai, Maharashtra 400078",
      },
    ];

    return data.map<HospitalLab>(HospitalLab.fromJson).toList();
  }

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
          'Terms & Conditions',
          style: TextStyle(
            color: black,
          ),
        ),
      ),
      body: Center(
        child: buildHospitals(
          hospitallabs,
        ),
      ),
    );
  }

  Widget buildHospitals(List<HospitalLab> hospitallabs) => ListView.builder(
        itemCount: hospitallabs.length,
        itemBuilder: (context, index) {
          final hospital = hospitallabs[index];
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.5,
                  color: Colors.grey[300]!,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hospital.hospitalName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    hospital.hospitalAddress,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 150,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                      child: const Text('Select'),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
}
