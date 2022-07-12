import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  MyApp({Key? key}) : super(key: key); //for storing form state.

//saving form after validation
  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _form, //assigning key to form

          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (text) {
                  if (!(text!.length > 5) && text.isNotEmpty) {
                    return "Enter valid name of more then 5 characters!";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (text) {
                  if (!(text!.contains('@')) && text.isNotEmpty) {
                    return "Enter a valid email address!";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () => _saveForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
