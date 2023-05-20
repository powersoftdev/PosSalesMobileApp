// ignore: file_names
// To parse this JSON data, do
//
//     final compute = computeFromJson(jsonString);

// ignore_for_file: file_names, duplicate_ignore

import 'dart:convert';

Compute computeFromJson(String str) => Compute.fromJson(json.decode(str));

String computeToJson(Compute data) => json.encode(data.toJson());

class Compute {
    String? status;
    String? message;
    dynamic metadata;
    OrderCompute? data;
    dynamic authToken;

    Compute({
        this.status,
        this.message,
        this.metadata,
        this.data,
        this.authToken,
    });

    factory Compute.fromJson(Map<String, dynamic> json) => Compute(
        status: json["status"],
        message: json["message"],
        metadata: json["metadata"],
        data: json["data"] == null ? null : OrderCompute.fromJson(json["data"]),
        authToken: json["auth_token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "metadata": metadata,
        "data": data?.toJson(),
        "auth_token": authToken,
    };
}

class OrderCompute {
    String? companyId;
    String? divisionId;
    String? departmentId;
    String? customerId;
    String? customerName;
    String? customerEmail;
   dynamic totalOrderCount;
   dynamic subtotal;
   dynamic discountAmount;
    double? taxAmount;
    double? total;
   dynamic availableCredit;
    double? amountToPay;

    OrderCompute({
        this.companyId,
        this.divisionId,
        this.departmentId,
        this.customerId,
        this.customerName,
        this.customerEmail,
        this.totalOrderCount,
        this.subtotal,
        this.discountAmount,
        this.taxAmount,
        this.total,
        this.availableCredit,
        this.amountToPay,
    });

    factory OrderCompute.fromJson(Map<String, dynamic> json) => OrderCompute(
        companyId: json["companyId"] ?? "",
        divisionId: json["divisionId"] ?? "",
        departmentId: json["departmentId"] ?? "",
        customerId: json["customerId"],
        customerName: json["customerName"] ?? "",
        customerEmail: json["customerEmail"] ?? "",
        totalOrderCount: json["totalOrderCount"] ?? "",
        subtotal: json["subtotal"] ?? "",
        discountAmount: json["discountAmount"] ?? "",
        taxAmount: json["taxAmount"]?.toDouble(),
        total: json["total"]?.toDouble(),
        availableCredit: json["availableCredit"],
        amountToPay: json["amountToPay"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "divisionId": divisionId,
        "departmentId": departmentId,
        "customerId": customerId,
        "customerName": customerName,
        "customerEmail": customerEmail,
        "totalOrderCount": totalOrderCount,
        "subtotal": subtotal,
        "discountAmount": discountAmount,
        "taxAmount": taxAmount,
        "total": total,
        "availableCredit": availableCredit,
        "amountToPay": amountToPay,
    };
}
