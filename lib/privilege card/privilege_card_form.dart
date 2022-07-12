// ignore_for_file: non_constant_identifier_names, avoid_print, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:team_five/components/lists.dart';
import 'package:team_five/constants/constants.dart';

class PrivilegeCardForm extends StatefulWidget {
  const PrivilegeCardForm({Key? key}) : super(key: key);

  @override
  State<PrivilegeCardForm> createState() => _PrivilegeCardFormState();
}

class _PrivilegeCardFormState extends State<PrivilegeCardForm> {
  TextEditingController dateinput = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  int valuess = 1;
  Widget CustomRadioButton(String text, int index, bool isSelected) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            valuess = index;
          });
          print(text);
        },
        style: ElevatedButton.styleFrom(
          primary: (valuess == index)
              ? const Color.fromRGBO(
                  13,
                  160,
                  134,
                  1,
                )
              : Colors.white,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: (valuess == index) ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
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
            'Privilege Card',
            style: TextStyle(
              color: black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          // height: 150,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
              vertical: 15,
            ),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //name
                      FormText(
                        text: 'Name',
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          isDense: true,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const Sizebxh15(),
                      // gender selection0
                      FormText(
                        text: 'Gender',
                      ),
                      Row(
                        children: <Widget>[
                          CustomRadioButton("Male", 1, true),
                          const SizedBox(
                            width: 15,
                          ),
                          CustomRadioButton("Female", 2, false),
                          const SizedBox(
                            width: 15,
                          ),
                          CustomRadioButton("Other", 3, false)
                        ],
                      ),
                      const Sizebxh15(),
                      // date of birth
                      FormText(
                        text: 'Date of birth',
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Date of birth can't be empty";
                          }
                          return null;
                        },
                        controller: dateinput,
                        cursorColor: grey,
                        readOnly: true,
                        decoration: const InputDecoration(
                          focusColor: grey,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: grey,
                            ),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: grey,
                            ),
                          ),
                          // filled: true,
                          suffixIcon: Icon(
                            Icons.calendar_month_sharp,
                            color: grey,
                          ),
                          // icon: Icon(Icons.person),
                        ),
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
                                DateFormat('yyyy-MM-dd').format(pickedDate);

                            setState(() {
                              dateinput.text = formattedDate;
                            });
                          } else {}
                        },
                      ),
                      const Sizebxh15(),
                      // relation
                      FormText(
                        text: 'Relation',
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          isDense: true,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Relation can't be empty";
                          }
                          return null;
                        },
                      ),
                      const Sizebxh15(),
                    ],
                  ),
                ),
                Button(formKey: _formKey),
              ],
            ),
          ),
        ));
  }

  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: maincolor,
            onPrimary: white,

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            minimumSize: const Size(100, 50), //////// HERE
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const BookingScreen()),
              // );
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AdvanceCustomAlert();
                  });
            }
          },
          child: const Text(
            'Apply',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class AdvanceCustomAlert extends StatelessWidget {
  const AdvanceCustomAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
            Column(
              children: [
                const CircleAvatar(
                  backgroundColor: Color.fromRGBO(17, 138, 165, 1),
                  radius: 35,
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Completed',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                    color: Color.fromRGBO(
                      106,
                      107,
                      120,
                      1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    'You successfully apply for your Privilege Card',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(
                        106,
                        107,
                        120,
                        1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(17, 138, 165, 1),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
