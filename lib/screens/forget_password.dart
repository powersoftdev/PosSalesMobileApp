import 'dart:convert';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'otp_screen.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> usernameformKey = GlobalKey<FormState>();

  final usernamecontroller = TextEditingController();

  String username = '';

  Future<void> callApi() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    final response = await http.get(
        Uri.parse(
            'https://powersoftrd.com/PEMAPI/api/ResetPasswordOTP/741258?Username=${usernamecontroller.text}'),
        headers: {
          "Access-Control-Allow-Origin": "*",
        });
    // ignore: unused_local_variable
    final Map<String, dynamic> dataCheck = json.decode(response.body);

    if (dataCheck['status'].toString() == "Success") {
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const OtpScreen()));
    } else {
      throw Exception('Failed.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
          child: Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
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
                    height: 180,
                    child: Container(
                      height: 180.0,
                      width: double.infinity,
                      color: Colors.white,
                      padding: const EdgeInsets.only(top: 5.0, left: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Reset Password',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.blue.shade700,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const CircleAvatar(
                            radius: 70,
                            backgroundImage:
                                AssetImage('lib/images/newPhone.jpg'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Enter your Email/Phone/ID",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    key: usernameformKey,
                    controller: usernamecontroller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autofocus: false,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.only(left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'username',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2, color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onChanged: (value) {
                      username = value;
                    },
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: 'Username Required'),
                        // MaxLengthValidator(150,
                        //     errorText: 'Not more than 15 Characters'),
                        // MinLengthValidator(2,
                        //     errorText: 'Should be at least 8 Characters')
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  FloatingActionButton(
                    onPressed: callApi,
                    child: const Icon(Icons.forward),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
