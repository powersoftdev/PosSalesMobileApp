// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, prefer_interpolation_to_compose_strings, use_build_context_synchronously, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:sales_order/screens/newPassword.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  double viewHeight = 0;
  String? otp = "";
  String? token;
  String username = '';
  dynamic customerId;

  final otpController = List.generate(6, (index) => TextEditingController());

  // ignore: body_might_complete_normally_nullable
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    customerId = prefs.getString('customerId');
  }

  void callApi() async {
    await getToken();

    final response = await http.get(
        Uri.parse(
            'https://powersoftrd.com/PEMAPI/api/ResetPasswordOTP/741258?Username=$customerId + otp = $otp'),
        headers: {
          "Access-Control-Allow-Origin": "*",
        });
    // ignore: unused_local_variable
    final Map<String, dynamic> dataCheck = json.decode(response.body);

    final SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setString('otp', otp!);

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NewPassword()),
      );
    } else {
      throw Exception('Failed.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return
        // MaterialApp(
        //   home: Builder(builder: (context) =>
        Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Builder(builder: (context) {
        return SafeArea(
          child: LayoutBuilder(builder: (context, constraint) {
            return _buildLogIn(context, constraint.biggest);
          }),
        );
      }),
    );
    //   ),
    // );
  }

  Widget _buildLogIn(BuildContext context, Size size) {
    viewHeight = viewHeight > 0 ? viewHeight : size.height;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20),
            child: Row(
              children: [
                Image.asset(
                  'lib/images/sales4.gif',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            child: Container(
              height: 120.0,
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.only(top: 5.0, left: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter OTP',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  SizedBox(width: 10),
                  // CircleAvatar(
                  //   radius: 80,
                  //   backgroundImage: AssetImage('lib/images/newPhone.jpg'),
                  // ),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                // height: 660,
                decoration: BoxDecoration(
                  color: Colors.blue.shade700,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      // height: 300,
                      width: 500,
                      constraints: BoxConstraints(minHeight: 0, maxHeight: 300),
                      margin: EdgeInsets.fromLTRB(20, 80, 20, 20),
                      padding:
                          EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Form(
                        key: formkey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Center(
                              child: Text(
                                'Enter OTP sent to your Email/Phone',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade700,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            OtpTextField(
                              numberOfFields: 6,
                              fillColor: Colors.black.withOpacity(0.1),
                              filled: true,
                              onSubmit: (value) {
                                otp = value;
                                print(otp);
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "OTP Expires in 60 Seconds",
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Countdown(
                                  seconds: 60,
                                  build: (BuildContext context, double time) =>
                                      Text(
                                    time.toString(),
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  interval: Duration(milliseconds: 100),
                                  onFinished: () {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: resendApi,
                              child: Center(
                                child: Text(
                                  "Re-send OTP",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 22),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  // backgroundColor: Colors.blue[300],

                                  fixedSize: Size(
                                    350,
                                    45,
                                  )),
                              onPressed: callApi,
                              child: Text("Continue"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void resendApi() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    otp = pref.getString("otp");

    await getToken();
    final response = await http.get(
        Uri.parse(
            'https://powersoftrd.com/PEMAPI/api/ResetPasswordOTP/741258?Username=$customerId'),
        headers: {
          "Access-Control-Allow-Origin": "*",
        });
    // ignore: unused_local_variable
    final Map<String, dynamic> dataCheck = json.decode(response.body);

    if (dataCheck['status'].toString() == "Success") {
    } else {
      throw Exception('Failed.');
    }
  }
}
