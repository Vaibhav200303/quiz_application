
import 'package:flutter/material.dart';
import 'package:quiz/onBoardingScreens/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/quiz_sign_in.dart';



class GetStartBtn extends StatelessWidget {
  const GetStartBtn({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Get the SharedPreferences instance
        SharedPreferences prefs = await SharedPreferences.getInstance();

        // Set the onboarding complete flag to true
        await prefs.setBool('onboarding_complete', true);

        // Navigate to the home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => QuizSignIn()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 60),
        width: size.width / 1.5,
        height: size.height / 13,
        decoration: BoxDecoration(
            color: MyColors.btnColor, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text("Get Started now", style: textTheme.headlineMedium),
        ),
      ),
    );
  }
}


class SkipBtn extends StatelessWidget {
  const SkipBtn({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      width: size.width / 1.5,
      height: size.height / 13,
      decoration: BoxDecoration(
          border: Border.all(
            color: MyColors.btnBorderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: onTap,
        splashColor: MyColors.btnBorderColor,
        child: Center(
          child: Text("Skip", style: textTheme.displaySmall),
        ),
      ),
    );
  }
}
