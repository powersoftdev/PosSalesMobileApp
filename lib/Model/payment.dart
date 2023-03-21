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

    final String? status;
    final String? message;
    final Data? data;
   

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      
    };
}

class Data {
    Data({
        this.authorizationUrl,
        this.accessCode,
        this.reference,
    });

    final String? authorizationUrl;
    final String? accessCode;
    final String? reference;

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
