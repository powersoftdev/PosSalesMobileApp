// To parse this JSON data, do
//
//     final OrderReport = OrderReportFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

class OrderReport {
    OrderReport({
        this.status,
        this.message,
        this.metadata,
        this.data,
        this.authToken,
    });

    String? status;
    String? message;
    dynamic metadata;
    Data? data;
    dynamic authToken;

    factory OrderReport.fromRawJson(String str) => OrderReport.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrderReport.fromJson(Map<String, dynamic> json) => OrderReport(
        status: json["status"],
        message: json["message"],
        metadata: json["metadata"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
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

class Data {
    Data({
        this.fileContents,
        this.contentType,
        this.fileDownloadName,
        this.lastModified,
        this.entityTag,
        this.enableRangeProcessing,
    });

    String? fileContents;
    String? contentType;
    String? fileDownloadName;
    dynamic lastModified;
    dynamic entityTag;
    bool? enableRangeProcessing;

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        fileContents: json["fileContents"],
        contentType: json["contentType"],
        fileDownloadName: json["fileDownloadName"],
        lastModified: json["lastModified"],
        entityTag: json["entityTag"],
        enableRangeProcessing: json["enableRangeProcessing"],
    );

    Map<String, dynamic> toJson() => {
        "fileContents": fileContents,
        "contentType": contentType,
        "fileDownloadName": fileDownloadName,
        "lastModified": lastModified,
        "entityTag": entityTag,
        "enableRangeProcessing": enableRangeProcessing,
    };
}
