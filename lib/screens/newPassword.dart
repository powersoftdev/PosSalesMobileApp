// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, body_might_complete_normally_nullable, avoid_print, unnecessary_brace_in_string_interps, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:http/http.dart' as http;
import 'package:sales_order/screens/splash.screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:form_field_validator/form_field_validator.dart';
import '../Model/forgetPassword.dart';
import 'size_config.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool _obscureText = true;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final GlobalKey<FormState> newpasswordformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> confirmNewpasswordformKey = GlobalKey<FormState>();

  final currentpasswordcontroller = TextEditingController();
  final newpasswordcontroller = TextEditingController();
  final confirmNewpasswordcontroller = TextEditingController();

  String newpassword = '';
  String confirmPassword = '';
  String? token;
  dynamic customerId;
  dynamic otp;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    customerId = prefs.getString('customerId');
  }

  void changePwdApi() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    otp = pref.getString("otp");

    await getToken();

    http.Response response = await http.post(
        Uri.parse('https://powersoftrd.com/PEMAPI/api/ResetPassword/741258?'),
        body: jsonEncode(ForgetPassword(
            username: customerId, otp: otp, password: newpassword)),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $token',
        });

    print(response.body);

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Password Reset Successful'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SplashScreen()),
                  );
                },
              ),
            ],
          );
        },
      );
    } else {
      throw Exception('Failed to create album.');
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text('Reset Password'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              TextFormField(
                key: newpasswordformKey,
                controller: currentpasswordcontroller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: _obscureText,
                autofocus: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20),
                  fillColor: Colors.white,
                  filled: true,
                  border: const OutlineInputBorder(),
                  labelText: 'New Password',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 2, color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: InkWell(
                    onTap: _toggle,
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                onChanged: (value) {
                  newpassword = value;
                },
                validator: MultiValidator(
                  [
                    RequiredValidator(errorText: 'Password Required'),
                    MaxLengthValidator(15,
                        errorText: 'Not more than 15 Characters'),
                    MinLengthValidator(8,
                        errorText: 'Should be at least 8 Characters')
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                key: confirmNewpasswordformKey,
                controller: confirmNewpasswordcontroller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: _obscureText,
                autofocus: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20),
                  fillColor: Colors.white,
                  filled: true,
                  border: const OutlineInputBorder(),
                  labelText: 'Confirm New Password',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Icon(Icons.lock),
                  ),
                  suffixIcon: InkWell(
                    onTap: _toggle,
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                onChanged: (value) {
                  confirmPassword = value;
                },
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Confirm password is required please enter';
                  }
                  if (value != newpassword) {
                    return 'Confirm password not matching';
                  }
                },
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton(
                height: 46,
                width: 400,
                text: 'Submit',
                animationDuration: const Duration(seconds: 2),
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                onPress: () {
                  if (formkey.currentState!.validate()) {
                    changePwdApi();
                    print(newpassword);
                  }
                },
                gradient: const LinearGradient(
                  colors: [Colors.blueGrey, Colors.blue],
                ),
                selectedGradientColor: const LinearGradient(
                    colors: [Colors.blue, Colors.blueGrey]),
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
                isReverse: true,
                borderColor: Colors.white,
                borderRadius: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
