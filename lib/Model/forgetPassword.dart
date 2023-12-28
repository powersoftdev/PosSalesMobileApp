// To parse this JSON data, do
//
//     final ForgetPassword = ForgetPasswordFromJson(jsonString);

import 'dart:convert';

class ForgetPassword {
    String? username;
    dynamic otp;
    String? password;

    ForgetPassword({
        this.username,
        this.otp,
        this.password,
    });

    factory ForgetPassword.fromRawJson(String str) => ForgetPassword.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ForgetPassword.fromJson(Map<String, dynamic> json) => ForgetPassword(
        username: json["username"],
        otp: json["otp"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "otp": otp,
        "password": password,
    };
}
