// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

Temperatures? temperaturesFromJson(String str) => Temperatures.fromJson(json.decode(str));

String temperaturesToJson(Temperatures? data) => json.encode(data!.toJson());

class Temperatures {
    Temperatures({
        this.status,
        this.message,
        this.data,
        this.authToken,
    });

    final String? status;
    final String? message;
    final List<dynamic>? data;
    final dynamic authToken;

    factory Temperatures.fromJson(Map<String, dynamic> json) => Temperatures(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
        authToken: json["auth_token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "auth_token": authToken,
    };
}
