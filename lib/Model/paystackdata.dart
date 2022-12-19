// To parse this JSON data, do
//
//     final Payment = PaymentFromJson(jsonString);

import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
    Payment({
         this.status,
         this.message,
        this.data,
    });

    bool? status;
    String? message;
    Data? data;

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
         this.authorizationUrl,
         this.accessCode,
         this.reference,
    });

    String? authorizationUrl;
    String? accessCode;
    String? reference;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        authorizationUrl: json["authorization_url"],
        accessCode: json["access_code"],
        reference: json["reference"],
    );

    Map<String, dynamic> toJson() => {
        "authorization_url": authorizationUrl,
        "access_code": accessCode,
        "reference": reference,
    };
}
