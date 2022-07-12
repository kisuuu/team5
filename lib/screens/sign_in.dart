import 'package:flutter/material.dart';
import 'package:team_five/constants/constants.dart';
import 'package:team_five/screens/create_account.dart';
import 'package:team_five/screens/home_screen.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const <Widget>[
            Team5Logo(),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: maincolor,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.phone_in_talk_rounded,
                          size: 18,
                        ),
                      ),
                      TextSpan(
                        text: " Phone number",
                        style: TextStyle(
                          color: black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            TextFormField(
              maxLength: 10,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Number Please';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: ' Enter Phone Number',
                prefixText: '+91 ',
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                prefixStyle: const TextStyle(
                  color: Colors.black54,
                  fontSize: 17,
                ),
                enabledBorder: const UnderlineInputBorder(),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                focusColor: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: maincolor,
                    onPrimary: white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (Route<dynamic> route) => false,
                  ),
                  child: const Text(
                    "Request OTP",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("don't have and account ",
                    style: TextStyle(
                      fontSize: 13,
                    )),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateAccountScreen()),
                  ),
                  child: const Text(
                    'Register?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // color: purple,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Team5Logo extends StatelessWidget {
  const Team5Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/team5logo.png',
          width: 250,
          height: 125,
        ),
      ),
    );
  }
}
