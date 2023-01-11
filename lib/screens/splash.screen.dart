import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sales_order/screens/login_screen.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('lib/images/loading-circles.json'),
      //  Column(
      //   children: [
      //     Image.asset('lib/images/sales1.png')
      //   ],
      // ),
      backgroundColor: Colors.blue, 
      nextScreen: const LoginScreen(),
      splashIconSize: 270,
      duration: 5000,
      splashTransition: SplashTransition.scaleTransition,

     // pageTransitionType: PageTransitionType.leftToRightPop,
      animationDuration: const Duration(seconds: 1),
      );
  }
}
