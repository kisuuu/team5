import 'package:flutter/material.dart';
import 'package:team_five/constants/animated.dart';
import 'package:team_five/constants/constants.dart';
import 'package:team_five/screens/sign_in.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Slide(
                hero: Image.asset(
                  "assets/images/intro1.png",
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                title: "Home test Service",
                subtitle: "Free Home Sample Collection",
                onNext: nextPage),
            Slide(
                hero: Image.asset(
                  "assets/images/intro2.png",
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                title: "X-rays & Scans",
                subtitle: "Search Best Labs Near You",
                onNext: nextPage),
            Slide(
                hero: Image.asset(
                  "assets/images/intro3.png",
                  width: MediaQuery.of(context).size.width * 0.75,
                ),
                title: "Privilege Card",
                subtitle:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ut euismod turpis",
                onNext: nextPage),
            const SignIn(),
          ],
        ),
      ),
    );
  }

  void nextPage() {
    pageController.nextPage(
        // duration: const Duration(seconds: 200000000000), curve: Curves.ease);
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease);
  }
}

class Slide extends StatelessWidget {
  final Widget hero;
  final String title;
  final String subtitle;
  final VoidCallback onNext;

  const Slide(
      {Key? key,
      required this.hero,
      required this.title,
      required this.subtitle,
      required this.onNext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const SignIn()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text(
                  "Skip",
                  style: onBoardingSkip,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          child: hero,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                title,
                style: onBoardingTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                subtitle,
                style: onBoardingSubtitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 35,
              ),
              ProgressButton(onNext: onNext),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

class ProgressButton extends StatelessWidget {
  final VoidCallback onNext;
  const ProgressButton({Key? key, required this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: Stack(children: [
        AnimatedIndicator(
          duration: const Duration(seconds: 10),
          size: 75,
          callback: onNext,
        ),
        Center(
          child: GestureDetector(
            onTap: onNext,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99), color: maincolor),
              child: const Center(
                  child: Icon(
                Icons.arrow_forward_ios,
              )),
            ),
          ),
        )
      ]),
    );
  }
}
