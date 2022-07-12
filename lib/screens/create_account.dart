// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:team_five/components/lists.dart';
import 'package:team_five/constants/constants.dart';
import 'package:team_five/screens/sign_in.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Team5Logo(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      const Sizebxh15(),
                      // sign up
                      Row(
                        children: const [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: maincolor,
                            ),
                          ),
                        ],
                      ),
                      const Sizebxh15(),
                      // form for create account
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            // name text field
                            Textfield(
                              emptyValueValidationText: "name can't be empty",
                              hintText: 'Enter your full name',
                              icon: Icons.person,
                              keyType: TextInputType.text,
                              labelText: 'Name',
                            ),
                            const Sizebxh20(),
                            // phone number
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "phone number can't be empty";
                                } else if (value.length < 10) {
                                  return "phone number not correct";
                                }
                                return null;
                                // return null;
                              },
                              cursorColor: grey,
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              // textCapitalization: TextCapitalization.words,
                              decoration: const InputDecoration(
                                  counterText: "",
                                  focusColor: grey,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: grey,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35),
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.phone_in_talk_rounded,
                                    color: grey,
                                  ),
                                  // icon: Icon(Icons.person),
                                  hintText: 'Enter your Phone number',
                                  hintStyle: TextStyle(
                                    color: grey,
                                  ),
                                  labelText: 'Phone Number',
                                  labelStyle: TextStyle(
                                    color: grey,
                                  ),
                                  contentPadding: EdgeInsets.only(
                                    left: 25,
                                  )),
                            ),
                            const Sizebxh20(),
                            // email
                            Textfield(
                              emptyValueValidationText:
                                  "email id can't be empty",
                              hintText: 'Enter your email',
                              icon: Icons.mail_outline,
                              keyType: TextInputType.emailAddress,
                              labelText: 'Email id',
                            ),

                            const Sizebxh20(),
                            // date of birth
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "date of birth can't be empty";
                                }
                                return null;
                              },
                              controller: dateinput,
                              cursorColor: grey,
                              readOnly: true,
                              decoration: const InputDecoration(
                                  focusColor: grey,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: grey,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35),
                                    ),
                                  ),
                                  // filled: true,
                                  suffixIcon: Icon(
                                    Icons.calendar_month_sharp,
                                    color: grey,
                                  ),
                                  // icon: Icon(Icons.person),
                                  hintText: 'Enter your date of birth',
                                  hintStyle: TextStyle(
                                    color: grey,
                                  ),
                                  labelText: 'Date of birth',
                                  labelStyle: TextStyle(
                                    color: grey,
                                  ),
                                  contentPadding: EdgeInsets.only(
                                    left: 25,
                                  )),
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(
                                        2000), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  print(pickedDate);
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);

                                  setState(() {
                                    dateinput.text = formattedDate;
                                  });
                                } else {}
                              },
                            ),
                            const Sizebxh20(),

                            // pincode
                            Textfield(
                              emptyValueValidationText:
                                  "pincode can't be empty",
                              hintText: 'Enter your pincode',
                              icon: Icons.location_on,
                              keyType: TextInputType.number,
                              labelText: 'Pincode',
                            ),
                            const Sizebxh20(),
                            SizedBox(
                              // width: 150,
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: maincolor,
                                  onPrimary: white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    nameController.text;
                                    phoneNumberController.text;
                                    dateinput.text;
                                    emailController.text;
                                    pincodeController.text;
                                  }
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           const CreateAccountScreen()),
                                  // );
                                },
                                child: const Text(
                                  "Create Account",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const Sizebxh20(),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Already have an account? '),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const SignIn(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Sign in',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Textfield extends StatelessWidget {
  String emptyValueValidationText;
  String hintText;
  String labelText;
  TextInputType keyType;
  IconData icon;
  Textfield({
    required this.emptyValueValidationText,
    required this.hintText,
    required this.labelText,
    required this.keyType,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return emptyValueValidationText;
          //  return "name can't be empty";
        }
        return null;
      },
      cursorColor: grey,
      keyboardType: keyType,
      // keyboardType: TextInputType.text,
      decoration: InputDecoration(
          focusColor: grey,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: grey,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(35),
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(35),
            ),
          ),
          // filled: true,
          suffixIcon: Icon(
            icon,
            // Icons.person,
            color: grey,
          ),
          // icon: Icon(Icons.person),
          hintText: hintText,
          // hintText: 'Enter your full name',
          hintStyle: const TextStyle(
            color: grey,
          ),
          // labelText: 'Name',
          labelText: labelText,
          labelStyle: const TextStyle(
            color: grey,
          ),
          contentPadding: const EdgeInsets.only(
            left: 25,
          )),
    );
  }
}

class Team5Logo extends StatelessWidget {
  const Team5Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/team5logo.png',
        width: 250,
        height: 125,
      ),
    );
  }
}
