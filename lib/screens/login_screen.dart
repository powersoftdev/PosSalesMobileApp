// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sales_order/Screens/dashboard.dart';
import '../Model/customer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';





class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final emailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  dynamic customerAddress1;

  dynamic customerAddress2;

  dynamic customerEmail;

  dynamic accountBalance;

  String? token;

  String password = '';

  //  late final SharedPreferences _prefs = await SharedPreferences.getInstance();
  Future<void> callApi() async {
    print(emailcontroller.text);
    print(passwordcontroller.text);

    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    var url = Uri.parse(
        'https://powersoftrd.com/PEMAPI/api/CustomerLoginEmail/741258?Email=' +
            emailcontroller.text +
            '&Password=' +
            passwordcontroller.text);
    var response = await http.get(url, headers: {
      "Access-Control-Allow-Origin": "*",
    }).timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        return http.Response('Error', 408);
      },
    );
    final CustomerModel responseData = CustomerModelFromJson(response.body);
//     showDialog(
//       context: context,
//       builder: (context) {
//         return Center(child: CircularProgressIndicator());
//       },
//     );

    var customerInformation = responseData.data.first;
    var customerName = customerInformation.customerName;
    var customerId = customerInformation.customerId;
    var customerEmail = customerInformation.customerEmail;
    var customerPhone = customerInformation.customerPhone;
    var accountBalance = customerInformation.accountBalance;
    var customerAddress1 = customerInformation.customerAddress1;
    var customerAddress2 = customerInformation.customerAddress2;
    var customerAddress3 = customerInformation.customerAddress3;

    if (responseData.status == 'Success') {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      await prefs.setString('customerEmail', emailcontroller.text);
      await prefs.setString('customerName', customerName);
      await prefs.setString('customerId', customerId);
      await prefs.setString('customerEmail', customerEmail);
      await prefs.setString('customerPhone', customerPhone);
      await prefs.setDouble('accountBalance', accountBalance);
      await prefs.setString('customerAddress1', customerAddress1);
      await prefs.setString('customerAddress2', customerAddress2);
      await prefs.setString('customerAddress3', customerAddress3);
      await prefs.setString('token', responseData.authToken);
      String? tokenFromSP = prefs.getString('token');

      print(customerName);
      print('responseData.authToken: ' + responseData.authToken);
      print('token from sp: ' + tokenFromSP!);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const DashBoard()));
    } else if (responseData.status == 'Failed') {
      showDialog(
          context: context,
          builder: (contex) {
            return AlertDialog(
              content: Text(responseData.message),
            );
          });
    }
  }


  @override
  Widget build(BuildContext context) {
    var _formKey;
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 180.0,
                      width: double.infinity,
                      color: Colors.white,
                      padding: const EdgeInsets.only(top: 5.0, left: 20.0),
                      child: Row(
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.blue.shade700,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const CircleAvatar(
                            radius: 80,
                            backgroundImage:
                                AssetImage('lib/images/newPhone.jpg'),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 660,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(100),
                              topRight: Radius.circular(100),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 300,
                              width: 500,
                              margin: const EdgeInsets.fromLTRB(20, 80, 20, 20),
                              padding: const EdgeInsets.only(
                                  top: 20.0, left: 15.0, right: 15.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Center(
                                      child: Text(
                                        'Please sign in to continue',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade700,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller: emailcontroller,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        hintText: 'Email address',
                                        prefixIcon: const Padding(
                                          padding: EdgeInsets.only(top: 0),
                                          child: Icon(Icons.email),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 3, color: Colors.blue),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'E-mail is required.';
                                        }
                                        String pattern = r'\w+@\w+\.\w+';
                                        if (!RegExp(pattern).hasMatch(value)) {
                                          return 'Invalid E-mail Address format.';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller: passwordcontroller,
                                      obscureText: _obscureText,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        hintText: 'Password',
                                        prefixIcon: const Padding(
                                          padding: EdgeInsets.only(top: 0),
                                          child: Icon(Icons.lock),
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: _toggle,
                                          child: Icon(
                                            _obscureText
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 3, color: Colors.blue),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      //obscureText: true,
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Field is required.';
                                      //   }
                                      //   String pattern =
                                      //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*[0-9]).{8,}$';
                                      //   if (!RegExp(pattern).hasMatch(value)) {
                                      //     return 'Invalid Password format.';
                                      //   }
                                      //   // password most contain a uppercase letter,number,lowercase letter and it must be at least 8 characters
                                      //   return null;
                                      // },
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    FloatingActionButton(
                                      onPressed: callApi,
                                      child: const Icon(Icons.forward),
                                    ),
                                    Container(
                                      width: double.infinity,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                              child: Text(
                                'Forget your password? Click here',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



