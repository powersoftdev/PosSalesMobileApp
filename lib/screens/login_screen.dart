// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, prefer_interpolation_to_compose_strings, use_build_context_synchronously, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:sales_order/Screens/dashboard.dart';
import '../Model/customer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  double viewHeight = 0;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  String? token;

  String password = '';

  Future<void> callApi() async {
    print(emailcontroller.text);
    print(passwordcontroller.text);

    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
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
        Navigator.of(context).pop();
        return http.Response(
            CustomerModelToJson(CustomerModel(
                status: "Failed",
                message: "Cannot Connect to Internet.",
                data: [],
                authToken: "")),
            408);
      },
    );
    final CustomerModel responseData = CustomerModelFromJson(response.body);

    if (responseData.status == 'Success') {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      var customerInformation = responseData.data.first;
      var customerName = customerInformation.customerName;
      var customerId = customerInformation.customerId;
      var customerEmail = customerInformation.customerEmail;
      var customerPhone = customerInformation.customerPhone;
      var accountBalance = customerInformation.accountBalance;
      var customerAddress1 = customerInformation.customerAddress1;
      var customerAddress2 = customerInformation.customerAddress2;
      var customerAddress3 = customerInformation.customerAddress3;
      var customerCity = customerInformation.customerCity;
      var customerState = customerInformation.customerState;
      var customerCountry = customerInformation.customerCountry;
      var customerTypeId = customerInformation.customerTypeId;
      var companyId = customerInformation.companyId;
      var departmentId = customerInformation.departmentId;
      var divisionId = customerInformation.divisionId;

      await prefs.setString('customerEmail', emailcontroller.text);
      await prefs.setString('customerName', customerName);
      await prefs.setString('customerId', customerId);
      await prefs.setString('customerEmail', customerEmail);
      await prefs.setString('customerPhone', customerPhone);
      await prefs.setInt('accountBalance', accountBalance!);
      await prefs.setString('customerAddress1', customerAddress1);
      await prefs.setString('customerAddress2', customerAddress2);
      await prefs.setString('customerAddress3', customerAddress3);
      await prefs.setString('customerCity', customerCity);
      await prefs.setString('customerTypeId', customerTypeId);
      await prefs.setString('companyId', companyId);
      await prefs.setString('divisionId', divisionId);
      await prefs.setString('departmentId', departmentId);
      await prefs.setString('customerCountry', customerCountry);
      await prefs.setString('customerState', customerState);
      await prefs.setString('token', responseData.authToken);
      String? tokenFromSP = prefs.getString('token');

      print(customerTypeId);
      print(customerPhone);
      print('responseData.authToken: ' + responseData.authToken);
      print('token from sp: ' + tokenFromSP!);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DashBoard()));
    } else if (responseData.status == 'Failed') {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(responseData.message),
            );
          });
    }
  }

  // @override
  // void initState() {
  //   callApi();
  //   super.initState();
  // }

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
          SizedBox(
            height: 180,
            child: Container(
              height: 180.0,
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.only(top: 5.0, left: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('lib/images/newPhone.jpg'),
                  ),
                ],
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: viewHeight - 180, maxHeight: viewHeight - 180),
            child: Stack(
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
                        constraints:
                            BoxConstraints(minHeight: 0, maxHeight: 300),
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
                                  'Please sign in to continue',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade700,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Flexible(
                                child: TextFormField(
                                  controller: emailcontroller,
                                  autofocus: false,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Email address',
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(top: 0),
                                      child: Icon(Icons.email),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 3, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  validator: MultiValidator(
                                    [
                                      EmailValidator(
                                          errorText: 'Not a valid Email'),
                                      RequiredValidator(errorText: 'Required'),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Flexible(
                                child: TextFormField(
                                  controller: passwordcontroller,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  obscureText: _obscureText,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Password',
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(top: 0),
                                      child: Icon(Icons.lock),
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: _toggle,
                                      child: Icon(
                                        _obscureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 3, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: MultiValidator(
                                    [
                                      RequiredValidator(errorText: 'Required'),
                                      MaxLengthValidator(15,
                                          errorText:
                                              'Not more than 15 Characters'),
                                      MinLengthValidator(8,
                                          errorText:
                                              'Should be at least 8 Characters')
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              FloatingActionButton(
                                onPressed: callApi,
                                child: Icon(Icons.forward),
                              ),
                              // Container(
                              //   width: double.infinity,
                              // )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                        child: Text(
                          'Forgot your password? Click here',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
