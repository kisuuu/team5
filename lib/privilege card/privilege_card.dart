import 'package:flutter/material.dart';
import 'package:team_five/components/lists.dart';
import 'package:team_five/constants/constants.dart';
import 'package:team_five/privilege%20card/privilege_card_form.dart';

class PrivilegeCardScreen extends StatefulWidget {
  const PrivilegeCardScreen({Key? key}) : super(key: key);

  @override
  State<PrivilegeCardScreen> createState() => _PrivilegeCardScreenState();
}

class _PrivilegeCardScreenState extends State<PrivilegeCardScreen> {
  // By defaut, the checkbox is unchecked and "agree" is "false"
  bool agree = false;

  // This function is triggered when the button is clicked
  void _doSomething() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PrivilegeCardForm()),
    );
    // Do something
  }

  List<PrivilegeCard> privilegedetails = [
    PrivilegeCard(
      privilegeDescription: '1. Lorem Ipsum is simply dummy text of the ',
    ),
    PrivilegeCard(
      privilegeDescription: '2. Lorem Ipsum is simply dummy text of the ',
    ),
    PrivilegeCard(
      privilegeDescription: '3. Lorem Ipsum is simply dummy text of the ',
    ),
    PrivilegeCard(
      privilegeDescription: '4. Lorem Ipsum is simply dummy text of the ',
    ),
    PrivilegeCard(
      privilegeDescription: '5. Lorem Ipsum is simply dummy text of the ',
    ),
    PrivilegeCard(
      privilegeDescription: '6. Lorem Ipsum is simply dummy text of the ',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(
          color: black,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: white,
          ),
        ),
        title: const Text(
          'Privilege Card',
          style: TextStyle(
            color: black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 25,
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    17,
                  ),
                ),
                border: Border.all(
                  color: privilegecardcontainer,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: privilegecardcontainer,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            15,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                              flex: 6,
                              child: Image(
                                image:
                                    AssetImage('assets/images/privilege.png'),
                              )),
                          Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Get Your Privilege Card For Best Discoount',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      height: 1.3,
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: SizedBox(
                        // height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Benifits of Privilege Card',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '1. Lorem Ipsum is simply dummy text of the',
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.5,
                                ),
                              ),
                              Text(
                                '2. Lorem Ipsum is simply dummy text of the',
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.5,
                                ),
                              ),
                              Text(
                                '3. Lorem Ipsum is simply dummy text of the',
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.5,
                                ),
                              ),
                              Text(
                                '4. Lorem Ipsum is simply dummy text of the',
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.5,
                                ),
                              ),
                              Text(
                                '5. Lorem Ipsum is simply dummy text of the',
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Material(
                  child: Checkbox(
                    value: agree,
                    onChanged: (value) {
                      setState(() {
                        agree = value ?? false;
                      });
                    },
                  ),
                ),
                const Text(
                  'I accept & ready to apply Privilege card ',
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: maincolor,
                  onPrimary: white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                  minimumSize: const Size(100, 40),
                ),
                onPressed: agree ? _doSomething : null,
                child: const Text(
                  'Apply for Card',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
