import 'package:flutter/material.dart';
import 'package:team_five/components/lists.dart';
import 'package:team_five/constants/constants.dart';
import 'package:team_five/screens/health%20checkup/health_checkup_details.dart';

class HealthCheckupScreen extends StatefulWidget {
  const HealthCheckupScreen({Key? key}) : super(key: key);

  @override
  State<HealthCheckupScreen> createState() => _HealthCheckupScreenState();
}

class _HealthCheckupScreenState extends State<HealthCheckupScreen> {
  List<HealthCheckUp> healthcheckupdetails = [
    HealthCheckUp(
      healthCheckupList:
          '- CBC:Complete Blood Count\n- Thyroid Profile Complete- T3 T4 TSH\n- KFT:Kidney Function Tests\n- LFT:liver Function Tests\n- Lipid/Cholesterol Profile:Heart Health\n- UR/M:Complete Urine Examination\n- FBS:Fasting Blood Sugar\n- Electrolytes Profile\n- Calcium and Uric Acid\n- ESR(Westergren) - CBC:Complete Blood Count\n- Thyroid Profile Complete- T3 T4 TSH\n- KFT:Kidney Function Tests\n- LFT:liver Function Tests\n- Lipid/Cholesterol Profile:Heart Health\n- UR/M:Complete Urine Examination\n- FBS:Fasting Blood Sugar\n- Electrolytes Profile\n- Calcium and Uric Acid\n- ESR(Westergren)',
      healthCheckupTitle: 'Heath Checkup 1',
      healthCheckupRs: '₹999',
      healthCheckupimageurl: 'assets/images/bike.jpg',
    ),
    HealthCheckUp(
      healthCheckupList:
          '- CBC:Complete Blood Count\n- Thyroid Profile Complete- T3 T4 TSH\n- KFT:Kidney Function Tests\n- LFT:liver Function Tests\n- Lipid/Cholesterol Profile:Heart Health\n- UR/M:Complete Urine Examination\n- FBS:Fasting Blood Sugar\n- Electrolytes Profile\n- Calcium and Uric Acid\n- ESR(Westergren)',
      healthCheckupTitle: 'Heath Checkup 2',
      healthCheckupRs: '₹850',
      healthCheckupimageurl: 'assets/images/bike.jpg',
    ),
    HealthCheckUp(
      healthCheckupList:
          '- CBC:Complete Blood Count\n- Thyroid Profile Complete- T3 T4 TSH\n- KFT:Kidney Function Tests\n- LFT:liver Function Tests\n- Lipid/Cholesterol Profile:Heart Health\n- UR/M:Complete Urine Examination\n- FBS:Fasting Blood Sugar\n- Electrolytes Profile\n- Calcium and Uric Acid\n- ESR(Westergren)',
      healthCheckupTitle: 'Heath Checkup 3',
      healthCheckupRs: '₹599',
      healthCheckupimageurl: 'assets/images/bike.jpg',
    ),
    HealthCheckUp(
      healthCheckupList:
          '- CBC:Complete Blood Count\n- Thyroid Profile Complete- T3 T4 TSH\n- KFT:Kidney Function Tests\n- LFT:liver Function Tests\n- Lipid/Cholesterol Profile:Heart Health\n- UR/M:Complete Urine Examination\n- FBS:Fasting Blood Sugar\n- Electrolytes Profile\n- Calcium and Uric Acid\n- ESR(Westergren)',
      healthCheckupTitle: 'Heath Checkup 4',
      healthCheckupRs: '₹500',
      healthCheckupimageurl: 'assets/images/bike.jpg',
    ),
  ];

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
        padding: const EdgeInsets.all(
          15.0,
        ),
        child: Column(
          children: [
            const Text(
              "Choose Your Package",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: healthcheckupdetails.length,
                itemBuilder: (context, index) {
                  final healthcheckup = healthcheckupdetails[index];

                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HealthCheckupDetailsScreen(
                              healthcheckup: healthcheckup,
                            ),
                          ),
                        );
                      },
                      title: Row(
                        children: [
                          Text(
                            "${healthcheckup.healthCheckupTitle}  ",
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: maincolor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  25,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 1,
                              ),
                              child: Text(
                                healthcheckup.healthCheckupRs,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
