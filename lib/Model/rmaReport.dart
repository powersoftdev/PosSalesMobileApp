// To parse this JSON data, do
//
//     final RmaReport = RmaReportFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

class RmaReport {
    String? status;
    String? message;
    dynamic metadata;
    Data? data;
    dynamic authToken;

    RmaReport({
        this.status,
        this.message,
        this.metadata,
        this.data,
        this.authToken,
    });

    factory RmaReport.fromRawJson(String str) => RmaReport.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RmaReport.fromJson(Map<String, dynamic> json) => RmaReport(
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
    String? fileContents;
    String? contentType;
    String? fileDownloadName;
    dynamic lastModified;
    dynamic entityTag;
    bool? enableRangeProcessing;

    Data({
        this.fileContents,
        this.contentType,
        this.fileDownloadName,
        this.lastModified,
        this.entityTag,
        this.enableRangeProcessing,
    });

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
