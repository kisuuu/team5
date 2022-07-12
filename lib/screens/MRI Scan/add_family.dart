// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:team_five/components/lists.dart';
import 'package:team_five/constants/constants.dart';

class AddFamilyScreen extends StatefulWidget {
  const AddFamilyScreen({Key? key}) : super(key: key);

  @override
  State<AddFamilyScreen> createState() => _AddFamilyScreenState();
}

class _AddFamilyScreenState extends State<AddFamilyScreen> {
  String dropdownvalue = 'Jhunjhunwala Hospital - Bhandup ';

// List of items in our dropdown menu
  var mricenters = [
    'Jhunjhunwala Hospital - Bhandup ',
    'Jhunjhunwala Hospital - Mulund',
    'Jhunjhunwala Hospital - Bhandup',
    'Jhunjhunwala Hospital - Nahur',
    'Jhunjhunwala Hospital - Thane',
  ];

  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  TextEditingController appoinmentdate = TextEditingController();
  static final List<Animal> _animals = [
    Animal(id: 1, name: "MRI Scan For Brain"),
    Animal(id: 2, name: "MRI Scan For Spine"),
    Animal(id: 3, name: "MRI Scan For Joints"),
    Animal(id: 4, name: "MRI Scan For Abdomen"),
    Animal(id: 5, name: "MRI Scan For Pelvic region "),
    Animal(id: 6, name: "MRI Scan For Breast"),
    Animal(id: 7, name: "MRI Scan For Blood vessels "),
    Animal(id: 8, name: "MRI Scan For Heart"),
  ];

  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
      .toList();
  final List<Animal> _selectedAnimals2 = [];
  final _formKey = GlobalKey<FormState>();
  int valuess = 1;
  Widget customRadioButton(String text, int index, bool isSelected) {
    return OutlinedButton(
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
    );
  }

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
            'Add Family',
            style: TextStyle(
              color: black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          // height: 150,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
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
                      // gender selection
                      FormText(
                        text: 'Gender',
                      ),
                      Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 15,
                          ),
                          customRadioButton("Male", 1, true),
                          const SizedBox(
                            width: 15,
                          ),
                          customRadioButton("Female", 2, false),
                          const SizedBox(
                            width: 15,
                          ),
                          customRadioButton("Other", 3, false)
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
                            return "date of birth can't be empty";
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
                      // select type
                      FormText(
                        text: 'Type of test',
                      ),
                      Column(
                        children: <Widget>[
                          MultiSelectBottomSheetField(
                            initialChildSize: 0.4,
                            listType: MultiSelectListType.CHIP,
                            searchable: true,
                            buttonText: const Text("Select Type"),
                            items: _items,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select atleast one type';
                              }
                              return null;
                            },
                            onConfirm: (values) {
                              // _selectedAnimals2 = values;
                            },
                            chipDisplay: MultiSelectChipDisplay(
                              onTap: (value) {
                                setState(() {
                                  _selectedAnimals2.remove(value);
                                });
                              },
                            ),
                          ),
                          _selectedAnimals2.isEmpty || _selectedAnimals2.isEmpty
                              ? Container()
                              : Container(
                                  padding: const EdgeInsets.all(10),
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "None selected",
                                    style: TextStyle(color: Colors.black54),
                                  )),
                        ],
                      ),
                      const Sizebxh15(),
                      // select center
                      FormText(
                        text: 'Center',
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: DropdownButton(
                                isExpanded: true,
                                // Initial Value
                                value: dropdownvalue,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: mricenters.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Sizebxh15(),
                      // appoinment date
                      FormText(
                        text: 'Appoinment Date',
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "appoinment date can't be empty";
                          }
                          return null;
                        },
                        controller: appoinmentdate,
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
                            firstDate: DateTime
                                .now(), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(3000),
                          );

                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);

                            setState(() {
                              appoinmentdate.text = formattedDate;
                            });
                          } else {}
                        },
                      ),
                      const Sizebxh15(),
                      //appoinment time
                      FormText(
                        text: 'Appoinment time',
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "appoinment time can't be empty";
                          }
                          return null;
                        },
                        controller:
                            timeinput, //editing controller of this TextField
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.timer), //icon of text field
                            labelText: "Enter Time" //label text of field
                            ),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );

                          if (pickedTime != null) {
                            print(
                              pickedTime.format(context),
                            ); //output 10:51 PM
                            DateTime parsedTime = DateFormat.jm().parse(
                              pickedTime.format(context).toString(),
                            );
                            //converting to DateTime so that we can further format on different pattern.
                            print(parsedTime); //output 1970-01-01 22:53:00.000
                            String formattedTime =
                                DateFormat('HH:mm:ss').format(parsedTime);
                            print(formattedTime); //output 14:59:00
                            //DateFormat() is from intl package, you can format the time on any pattern you need.

                            setState(() {
                              timeinput.text =
                                  formattedTime; //set the value of text field.
                            });
                          } else {
                            print("Time is not selected");
                          }
                        },
                      ),
                      const Sizebxh15(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
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
