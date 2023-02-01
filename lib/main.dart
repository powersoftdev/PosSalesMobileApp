// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:sales_order/Store/MyStore.dart';

import 'package:sales_order/screens/splash.screen.dart';



void main() { 
  return runApp(
    MultiProvider(providers: [
       ChangeNotifierProvider<MyStore>(create:  (_) => MyStore()),
    //  ChangeNotifierProvider<PaymentsData>(create:  (_) => PaymentsData()),

    ],
      // create: (BuildContext context) {
      //   return MyStore();
      // },
      child: MaterialApp(
        home: SplashScreen(),        //LoginScreen
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
