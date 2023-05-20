// ignore_for_file: depend_on_referenced_packages

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
import 'package:sales_order/screens/login_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset('lib/images/sales3.gif'),
        ],
      ),
      backgroundColor: Colors.blue,
      nextScreen: const LoginScreen(),
      splashIconSize: 200,
      duration: 5000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      centered: true,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
