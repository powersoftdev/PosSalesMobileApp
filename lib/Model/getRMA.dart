

// ignore_for_file: file_names, constant_identifier_names, unnecessary_question_mark

import 'dart:convert';

class GetRma {
  GetRma({
    this.status,
    this.message,
    this.metadata,
    this.data,
    this.authToken,
  });

  String? status;
  String? message;
  dynamic metadata;
  List<Datum>? data;
  dynamic authToken;

  factory GetRma.fromRawJson(String str) => GetRma.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetRma.fromJson(Map<String, dynamic> json) => GetRma(
        status: json["status"],
        message: json["message"],
        metadata: json["metadata"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        authToken: json["auth_token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "metadata": metadata,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "auth_token": authToken,
      };
}

class Datum {
  Datum({
    this.companyId,
    this.divisionId,
    this.departmentId,
    this.invoiceNumber,
    this.orderNumber,
    this.transactionTypeId,
    this.transOpen,
    this.invoiceDate,
    this.invoiceDueDate,
    this.invoiceShipDate,
    this.invoiceCancelDate,
    this.systemDate,
    this.memorize,
    this.purchaseOrderNumber,
    this.taxExemptId,
    this.taxGroupId,
    this.customerId,
    this.termsId,
    this.currencyId,
    this.currencyExchangeRate,
    this.subtotal,
    this.discountPers,
    this.discountAmount,
    this.taxPercent,
    this.taxAmount,
    this.taxableSubTotal,
    this.freight,
    this.taxFreight,
    this.handling,
    this.advertising,
    this.total,
    this.employeeId,
    this.commissionPaid,
    this.commissionSelectToPay,
    this.commission,
    this.commissionableSales,
    this.comissionalbleCost,
    this.customerDropShipment,
    this.shipMethodId,
    this.warehouseId,
    this.shipToId,
    this.shipForId,
    this.shippingName,
    this.shippingAddress1,
    this.shippingAddress2,
    this.shippingAddress3,
    this.shippingCity,
    this.shippingState,
    this.shippingZip,
    this.shippingCountry,
    this.scheduledStartDate,
    this.scheduledEndDate,
    this.serviceStartDate,
    this.serviceEndDate,
    this.performedBy,
    this.glsalesAccount,
    this.glcogaccount,
    this.paymentMethodId,
    this.amountPaid,
    this.undistributedAmount,
    this.balanceDue,
    this.checkNumber,
    this.checkDate,
    this.creditCardTypeId,
    this.creditCardName,
    this.creditCardNumber,
    this.creditCardExpDate,
    this.creditCardCsvnumber,
    this.creditCardBillToZip,
    this.creditCardValidationCode,
    this.creditCardApprovalNumber,
    this.picked,
    this.pickedDate,
    this.printed,
    this.printedDate,
    this.shipped,
    this.shipDate,
    this.trackingNumber,
    this.billed,
    this.billedDate,
    this.backordered,
    this.posted,
    this.postedDate,
    this.allowanceDiscountPerc,
    this.cashTendered,
    this.masterBillOfLading,
    this.masterBillOfLadingDate,
    this.trailerNumber,
    this.trailerPrefix,
    this.headerMemo1,
    this.headerMemo2,
    this.headerMemo3,
    this.headerMemo4,
    this.headerMemo5,
    this.headerMemo6,
    this.headerMemo7,
    this.headerMemo8,
    this.headerMemo9,
    this.approved,
    this.approvedBy,
    this.approvedDate,
    this.enteredBy,
    this.signature,
    this.signaturePassword,
    this.supervisorSignature,
    this.supervisorPassword,
    this.managerSignature,
    this.managerPassword,
    this.lockedBy,
    this.lockTs,
    this.bankId,
    this.discountLine1,
    this.discountLine2,
    this.discountLine3,
    this.discountLine4,
    this.discountLine5,
    this.discountGroupId1,
    this.discountGroupId2,
    this.discountGroupId3,
    this.discountGroupId4,
    this.discountGroupId5,
    this.branchCode,
    this.rmaDetail,
  });

  String? companyId;
  String? divisionId;
  String? departmentId;
  String? invoiceNumber;
  dynamic orderNumber;
  dynamic  transactionTypeId;
  bool? transOpen;
  DateTime? invoiceDate;
  DateTime? invoiceDueDate;
  DateTime? invoiceShipDate;
  DateTime? invoiceCancelDate;
  DateTime? systemDate;
  bool? memorize;
  String? purchaseOrderNumber;
  String? taxExemptId;
  String? taxGroupId;
  String? customerId;
  String? termsId;
  String? currencyId;
  int? currencyExchangeRate;
  double? subtotal;
  int? discountPers;
  double? discountAmount;
  int? taxPercent;
  double? taxAmount;
  double? taxableSubTotal;
  double? freight;
  bool? taxFreight;
  double? handling;
  dynamic advertising;
  double? total;
  String? employeeId;
  bool? commissionPaid;
  bool? commissionSelectToPay;
  double? commission;
  double? commissionableSales;
  double? comissionalbleCost;
  bool? customerDropShipment;
  String? shipMethodId;
  dynamic warehouseId;
  String? shipToId;
  String? shipForId;
  String? shippingName;
  String? shippingAddress1;
  String? shippingAddress2;
  String? shippingAddress3;
  String? shippingCity;
  String? shippingState;
  String? shippingZip;
  String? shippingCountry;
  dynamic scheduledStartDate;
  dynamic scheduledEndDate;
  dynamic serviceStartDate;
  dynamic serviceEndDate;
  dynamic performedBy;
  String? glsalesAccount;
  dynamic glcogaccount;
  String? paymentMethodId;
  double? amountPaid;
  double? undistributedAmount;
  double? balanceDue;
  String? checkNumber;
  dynamic checkDate;
  dynamic creditCardTypeId;
  String? creditCardName;
  dynamic creditCardNumber;
  dynamic creditCardExpDate;
  dynamic creditCardCsvnumber;
  String? creditCardBillToZip;
  String? creditCardValidationCode;
  String? creditCardApprovalNumber;
  bool? picked;
  DateTime? pickedDate;
  bool? printed;
  DateTime? printedDate;
  bool? shipped;
  DateTime? shipDate;
  String? trackingNumber;
  bool? billed;
  DateTime? billedDate;
  bool? backordered;
  bool? posted;
  DateTime? postedDate;
  dynamic allowanceDiscountPerc;
  dynamic cashTendered;
  String? masterBillOfLading;
  dynamic masterBillOfLadingDate;
  String? trailerNumber;
  String? trailerPrefix;
  String? headerMemo1;
  String? headerMemo2;
  String? headerMemo3;
  String? headerMemo4;
  String? headerMemo5;
  String? headerMemo6;
  String? headerMemo7;
  String? headerMemo8;
  String? headerMemo9;
  bool? approved;
  dynamic approvedBy;
  dynamic approvedDate;
  dynamic enteredBy;
  String? signature;
  dynamic signaturePassword;
  dynamic supervisorSignature;
  dynamic supervisorPassword;
  dynamic managerSignature;
  dynamic managerPassword;
  dynamic lockedBy;
  dynamic lockTs;
  dynamic bankId;
  dynamic discountLine1;
  dynamic discountLine2;
  dynamic discountLine3;
  dynamic discountLine4;
  dynamic discountLine5;
  dynamic discountGroupId1;
  dynamic discountGroupId2;
  dynamic discountGroupId3;
  dynamic discountGroupId4;
  dynamic discountGroupId5;
  dynamic branchCode;
  List<RmaDetail>? rmaDetail;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        companyId: json["companyId"],
        divisionId: json["divisionId"],
        departmentId: json["departmentId"],
        invoiceNumber: json["invoiceNumber"],
        orderNumber:json["orderNumber"],
        transactionTypeId:json["transactionTypeId"],
        transOpen: json["transOpen"],
        invoiceDate: json["invoiceDate"] == null
            ? null
            : DateTime.parse(json["invoiceDate"]),
        invoiceDueDate: json["invoiceDueDate"] == null
            ? null
            : DateTime.parse(json["invoiceDueDate"]),
        invoiceShipDate: json["invoiceShipDate"] == null
            ? null
            : DateTime.parse(json["invoiceShipDate"]),
        invoiceCancelDate: json["invoiceCancelDate"] == null
            ? null
            : DateTime.parse(json["invoiceCancelDate"]),
        systemDate: json["systemDate"] == null
            ? null
            : DateTime.parse(json["systemDate"]),
        memorize: json["memorize"],
        purchaseOrderNumber:json["purchaseOrderNumber"],
        taxExemptId: json["taxExemptId"],
        taxGroupId: json["taxGroupId"],
        customerId: json["customerId"],
        termsId:json["termsId"],
        currencyId: json["currencyId"],
        currencyExchangeRate: json["currencyExchangeRate"],
        subtotal: json["subtotal"]?.toDouble(),
        discountPers: json["discountPers"],
        discountAmount: json["discountAmount"],
        taxPercent: json["taxPercent"],
        taxAmount: json["taxAmount"],
        taxableSubTotal: json["taxableSubTotal"],
        freight: json["freight"],
        taxFreight: json["taxFreight"],
        handling: json["handling"],
        advertising: json["advertising"],
        total: json["total"]?.toDouble(),
        employeeId: json["employeeId"],
        commissionPaid: json["commissionPaid"],
        commissionSelectToPay: json["commissionSelectToPay"],
        commission: json["commission"],
        commissionableSales: json["commissionableSales"],
        comissionalbleCost: json["comissionalbleCost"],
        customerDropShipment: json["customerDropShipment"],
        shipMethodId: json["shipMethodId"],
        warehouseId:json["warehouseId"],
        shipToId: json["shipToId"],
        shipForId:json["shipForId"],
        shippingName: json["shippingName"],
        shippingAddress1: json["shippingAddress1"],
        shippingAddress2: json["shippingAddress2"],
        shippingAddress3: json["shippingAddress3"],
        shippingCity: json["shippingCity"],
        shippingState: json["shippingState"],
        shippingZip: json["shippingZip"],
        shippingCountry: json["shippingCountry"],
        scheduledStartDate: json["scheduledStartDate"],
        scheduledEndDate: json["scheduledEndDate"],
        serviceStartDate: json["serviceStartDate"],
        serviceEndDate: json["serviceEndDate"],
        performedBy: json["performedBy"],
        glsalesAccount: json["glsalesAccount"],
        glcogaccount: json["glcogaccount"],
        paymentMethodId: json["paymentMethodId"],
        amountPaid: json["amountPaid"],
        undistributedAmount: json["undistributedAmount"]?.toDouble(),
        balanceDue: json["balanceDue"]?.toDouble(),
        checkNumber: json["checkNumber"],
        checkDate: json["checkDate"],
        creditCardTypeId: json["creditCardTypeId"],
        creditCardName: json["creditCardName"],
        creditCardNumber: json["creditCardNumber"],
        creditCardExpDate: json["creditCardExpDate"],
        creditCardCsvnumber: json["creditCardCsvnumber"],
        creditCardBillToZip: json["creditCardBillToZip"],
        creditCardValidationCode: json["creditCardValidationCode"],
        creditCardApprovalNumber: json["creditCardApprovalNumber"],
        picked: json["picked"],
        pickedDate: json["pickedDate"] == null
            ? null
            : DateTime.parse(json["pickedDate"]),
        printed: json["printed"],
        printedDate: json["printedDate"] == null
            ? null
            : DateTime.parse(json["printedDate"]),
        shipped: json["shipped"],
        shipDate:
            json["shipDate"] == null ? null : DateTime.parse(json["shipDate"]),
        trackingNumber: json["trackingNumber"],
        billed: json["billed"],
        billedDate: json["billedDate"] == null
            ? null
            : DateTime.parse(json["billedDate"]),
        backordered: json["backordered"],
        posted: json["posted"],
        postedDate: json["postedDate"] == null
            ? null
            : DateTime.parse(json["postedDate"]),
        allowanceDiscountPerc: json["allowanceDiscountPerc"],
        cashTendered: json["cashTendered"],
        masterBillOfLading: json["masterBillOfLading"],
        masterBillOfLadingDate: json["masterBillOfLadingDate"],
        trailerNumber: json["trailerNumber"],
        trailerPrefix: json["trailerPrefix"],
        headerMemo1: json["headerMemo1"],
        headerMemo2: json["headerMemo2"],
        headerMemo3: json["headerMemo3"],
        headerMemo4: json["headerMemo4"],
        headerMemo5: json["headerMemo5"],
        headerMemo6: json["headerMemo6"],
        headerMemo7: json["headerMemo7"],
        headerMemo8: json["headerMemo8"],
        headerMemo9: json["headerMemo9"],
        approved: json["approved"],
        approvedBy: json["approvedBy"],
        approvedDate: json["approvedDate"],
        enteredBy: json["enteredBy"],
        signature: json["signature"],
        signaturePassword: json["signaturePassword"],
        supervisorSignature: json["supervisorSignature"],
        supervisorPassword: json["supervisorPassword"],
        managerSignature: json["managerSignature"],
        managerPassword: json["managerPassword"],
        lockedBy: json["lockedBy"],
        lockTs: json["lockTs"],
        bankId: json["bankId"],
        discountLine1: json["discountLine1"],
        discountLine2: json["discountLine2"],
        discountLine3: json["discountLine3"],
        discountLine4: json["discountLine4"],
        discountLine5: json["discountLine5"],
        discountGroupId1: json["discountGroupId1"],
        discountGroupId2: json["discountGroupId2"],
        discountGroupId3: json["discountGroupId3"],
        discountGroupId4: json["discountGroupId4"],
        discountGroupId5: json["discountGroupId5"],
        branchCode: json["branchCode"],
        rmaDetail: json["rmaDetail"] == null
            ? []
            : List<RmaDetail>.from(
                json["rmaDetail"]!.map((x) => RmaDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "companyId": companyIdValues.reverse[companyId],
        "divisionId": idValues.reverse[divisionId],
        "departmentId": idValues.reverse[departmentId],
        "invoiceNumber": invoiceNumber,
        "orderNumber": orderNumberValues.reverse[orderNumber],
        "transactionTypeId": transactionTypeIdValues.reverse[transactionTypeId],
        "transOpen": transOpen,
        "invoiceDate": invoiceDate?.toIso8601String(),
        "invoiceDueDate": invoiceDueDate?.toIso8601String(),
        "invoiceShipDate": invoiceShipDate?.toIso8601String(),
        "invoiceCancelDate": invoiceCancelDate?.toIso8601String(),
        "systemDate": systemDate?.toIso8601String(),
        "memorize": memorize,
        "purchaseOrderNumber":
            purchaseOrderNumberValues.reverse[purchaseOrderNumber],
        "taxExemptId": purchaseOrderNumberValues.reverse[taxExemptId],
        "taxGroupId": idValues.reverse[taxGroupId],
        "customerId": customerId,
        "termsId": termsIdValues.reverse[termsId],
        "currencyId": currencyIdValues.reverse[currencyId],
        "currencyExchangeRate": currencyExchangeRate,
        "subtotal": subtotal,
        "discountPers": discountPers,
        "discountAmount": discountAmount,
        "taxPercent": taxPercent,
        "taxAmount": taxAmount,
        "taxableSubTotal": taxableSubTotal,
        "freight": freight,
        "taxFreight": taxFreight,
        "handling": handling,
        "advertising": advertising,
        "total": total,
        "employeeId": employeeIdValues.reverse[employeeId],
        "commissionPaid": commissionPaid,
        "commissionSelectToPay": commissionSelectToPay,
        "commission": commission,
        "commissionableSales": commissionableSales,
        "comissionalbleCost": comissionalbleCost,
        "customerDropShipment": customerDropShipment,
        "shipMethodId": shipMethodId,
        "warehouseId": idValues.reverse[warehouseId],
        "shipToId": shipIdValues.reverse[shipToId],
        "shipForId": shipIdValues.reverse[shipForId],
        "shippingName": shippingNameValues.reverse[shippingName],
        "shippingAddress1": shippingAddress1,
        "shippingAddress2": shippingAddress2,
        "shippingAddress3": shippingAddress3,
        "shippingCity": shippingCity,
        "shippingState": shippingState,
        "shippingZip": shippingZip,
        "shippingCountry": shippingCountry,
        "scheduledStartDate": scheduledStartDate,
        "scheduledEndDate": scheduledEndDate,
        "serviceStartDate": serviceStartDate,
        "serviceEndDate": serviceEndDate,
        "performedBy": performedBy,
        "glsalesAccount": glsalesAccount,
        "glcogaccount": glcogaccount,
        "paymentMethodId": paymentMethodId,
        "amountPaid": amountPaid,
        "undistributedAmount": undistributedAmount,
        "balanceDue": balanceDue,
        "checkNumber": checkNumber,
        "checkDate": checkDate,
        "creditCardTypeId": creditCardTypeId,
        "creditCardName": creditCardName,
        "creditCardNumber": creditCardNumber,
        "creditCardExpDate": creditCardExpDate,
        "creditCardCsvnumber": creditCardCsvnumber,
        "creditCardBillToZip": creditCardBillToZip,
        "creditCardValidationCode": creditCardValidationCode,
        "creditCardApprovalNumber": creditCardApprovalNumber,
        "picked": picked,
        "pickedDate": pickedDate?.toIso8601String(),
        "printed": printed,
        "printedDate": printedDate?.toIso8601String(),
        "shipped": shipped,
        "shipDate": shipDate?.toIso8601String(),
        "trackingNumber": trackingNumber,
        "billed": billed,
        "billedDate": billedDate?.toIso8601String(),
        "backordered": backordered,
        "posted": posted,
        "postedDate": postedDate?.toIso8601String(),
        "allowanceDiscountPerc": allowanceDiscountPerc,
        "cashTendered": cashTendered,
        "masterBillOfLading": masterBillOfLading,
        "masterBillOfLadingDate": masterBillOfLadingDate,
        "trailerNumber": trailerNumber,
        "trailerPrefix": trailerPrefix,
        "headerMemo1": headerMemo1,
        "headerMemo2": headerMemo2,
        "headerMemo3": headerMemo3,
        "headerMemo4": headerMemo4Values.reverse[headerMemo4],
        "headerMemo5": headerMemo5,
        "headerMemo6": headerMemo6,
        "headerMemo7": headerMemo7,
        "headerMemo8": headerMemo8,
        "headerMemo9": headerMemo9Values.reverse[headerMemo9],
        "approved": approved,
        "approvedBy": approvedBy,
        "approvedDate": approvedDate,
        "enteredBy": enteredBy,
        "signature": signatureValues.reverse[signature],
        "signaturePassword": signaturePassword,
        "supervisorSignature": supervisorSignature,
        "supervisorPassword": supervisorPassword,
        "managerSignature": managerSignature,
        "managerPassword": managerPassword,
        "lockedBy": lockedBy,
        "lockTs": lockTs,
        "bankId": bankId,
        "discountLine1": discountLine1,
        "discountLine2": discountLine2,
        "discountLine3": discountLine3,
        "discountLine4": discountLine4,
        "discountLine5": discountLine5,
        "discountGroupId1": discountGroupId1,
        "discountGroupId2": discountGroupId2,
        "discountGroupId3": discountGroupId3,
        "discountGroupId4": discountGroupId4,
        "discountGroupId5": discountGroupId5,
        "branchCode": branchCode,
        "rmaDetail": rmaDetail == null
            ? []
            : List<dynamic>.from(rmaDetail!.map((x) => x.toJson())),
      };
}

enum CompanyId { VINTAGE_PRESS_LTD }

final companyIdValues =
    EnumValues({"VINTAGE PRESS LTD": CompanyId.VINTAGE_PRESS_LTD});

enum CurrencyId { NGN }

final currencyIdValues = EnumValues({"NGN": CurrencyId.NGN});

enum Id { DEFAULT, LAGOS_STORE }

final idValues =
    EnumValues({"DEFAULT": Id.DEFAULT, "LAGOS STORE": Id.LAGOS_STORE});

enum EmployeeId { ASA_SUNDAY_VPL_00118 }

final employeeIdValues =
    EnumValues({"ASA SUNDAY-VPL/00118": EmployeeId.ASA_SUNDAY_VPL_00118});

enum HeaderMemo4 {
  EMPTY,
  DEVELOPMENT_POWERSOFT_SOLUTIONS_ORGANDTHEBENEFITS,
  HELLO_MATE
}

final headerMemo4Values = EnumValues({
  "development@powersoft-solutions.organdthebenefits":
      HeaderMemo4.DEVELOPMENT_POWERSOFT_SOLUTIONS_ORGANDTHEBENEFITS,
  "": HeaderMemo4.EMPTY,
  "hello mate ": HeaderMemo4.HELLO_MATE
});

enum HeaderMemo9 { MOBILE_SALES_RMA }

final headerMemo9Values =
    EnumValues({"Mobile Sales RMA": HeaderMemo9.MOBILE_SALES_RMA});

enum OrderNumber { INV_636764 }

final orderNumberValues = EnumValues({"INV/636764": OrderNumber.INV_636764});

enum PurchaseOrderNumber { NONE }

final purchaseOrderNumberValues =
    EnumValues({"None": PurchaseOrderNumber.NONE});

class RmaDetail {
  RmaDetail({
    this.companyId,
    this.divisionId,
    this.departmentId,
    this.invoiceNumber,
    this.invoiceLineNumber,
    this.itemId,
    this.itemUpccode,
    this.warehouseId,
    this.warehouseBinId,
    this.serialNumber,
    this.orderQty,
    this.backOrdered,
    this.backOrderQty,
    this.itemUom,
    this.itemWeight,
    this.description,
    this.discountPerc,
    this.taxable,
    this.currencyId,
    this.currencyExchangeRate,
    this.itemCost,
    this.itemUnitPrice,
    this.taxGroupId,
    this.taxAmount,
    this.taxPercent,
    this.subTotal,
    this.total,
    this.totalWeight,
    this.glsalesAccount,
    this.glcogaccount,
    this.projectId,
    this.warehouseBinZone,
    this.palletLevel,
    this.cartonLevel,
    this.packLevelA,
    this.packLevelB,
    this.packLevelC,
    this.trackingNumber,
    this.scheduledStartDate,
    this.scheduledEndDate,
    this.serviceStartDate,
    this.serviceEndDate,
    this.performedBy,
    this.detailMemo1,
    this.detailMemo2,
    this.detailMemo3,
    this.detailMemo4,
    this.detailMemo5,
    this.lockedBy,
    this.lockTs,
    this.itemPricingCode,
    this.deliveryNumber,
    this.glanalysisType1,
    this.glanalysisType2,
    this.assetId,
    this.budgetId,
    this.multipleDiscountGroupId,
    this.multipleDiscountAmount,
    this.multipleDiscountPercent,
    this.discountAmount,
    this.markUponCost,
    this.markUpRate,
    this.itemUnitCost,
    this.taxInclusive,
    this.invoicedDate,
    this.branchCode,
    this.productTypeId,
    this.advertTypeId,
    this.unAppliedTotal,
  });

  String? companyId;
  String? divisionId;
  String? departmentId;
  String? invoiceNumber;
  int? invoiceLineNumber;
  String? itemId;
  dynamic itemUpccode;
  String? warehouseId;
  String? warehouseBinId;
  dynamic serialNumber;
  int? orderQty;
  bool? backOrdered;
  int? backOrderQty;
  String? itemUom;
  int? itemWeight;
  String? description;
  int? discountPerc;
  bool? taxable;
  String? currencyId;
  int? currencyExchangeRate;
  double? itemCost;
  double? itemUnitPrice;
  String? taxGroupId;
  double? taxAmount;
  int? taxPercent;
  double? subTotal;
  double? total;
  int? totalWeight;
  String? glsalesAccount;
  String? glcogaccount;
  String? projectId;
  dynamic warehouseBinZone;
  dynamic palletLevel;
  dynamic cartonLevel;
  dynamic packLevelA;
  dynamic packLevelB;
  dynamic packLevelC;
  dynamic trackingNumber;
  dynamic scheduledStartDate;
  dynamic scheduledEndDate;
  dynamic serviceStartDate;
  dynamic serviceEndDate;
  dynamic performedBy;
  dynamic detailMemo1;
  dynamic detailMemo2;
  dynamic detailMemo3;
  dynamic detailMemo4;
  dynamic detailMemo5;
  dynamic lockedBy;
  dynamic lockTs;
  dynamic itemPricingCode;
  dynamic deliveryNumber;
  dynamic glanalysisType1;
  dynamic glanalysisType2;
  dynamic assetId;
  dynamic budgetId;
  dynamic multipleDiscountGroupId;
  dynamic multipleDiscountAmount;
  dynamic multipleDiscountPercent;
  dynamic discountAmount;
  bool? markUponCost;
  dynamic markUpRate;
  dynamic itemUnitCost;
  bool? taxInclusive;
  dynamic invoicedDate;
  dynamic branchCode;
  dynamic productTypeId;
  dynamic advertTypeId;
  double? unAppliedTotal;

  factory RmaDetail.fromRawJson(String str) =>
      RmaDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RmaDetail.fromJson(Map<String, dynamic> json) => RmaDetail(
        companyId: json["companyId"],
        divisionId: json["divisionId"],
        departmentId: json["departmentId"],
        invoiceNumber: json["invoiceNumber"],
        invoiceLineNumber: json["invoiceLineNumber"],
        itemId: json["itemId"],
        itemUpccode: json["itemUpccode"],
        warehouseId: json["warehouseId"],
        warehouseBinId: json["warehouseBinId"],
        serialNumber: json["serialNumber"],
        orderQty: json["orderQty"],
        backOrdered: json["backOrdered"],
        backOrderQty: json["backOrderQty"],
        itemUom: json["itemUom"],
        itemWeight: json["itemWeight"],
        description: json["description"],
        discountPerc: json["discountPerc"],
        taxable: json["taxable"],
        currencyId: json["currencyId"],
        currencyExchangeRate: json["currencyExchangeRate"],
        itemCost: json["itemCost"],
        itemUnitPrice: json["itemUnitPrice"]?.toDouble(),
        taxGroupId: json["taxGroupId"],
        taxAmount: json["taxAmount"],
        taxPercent: json["taxPercent"],
        subTotal: json["subTotal"]?.toDouble(),
        total: json["total"]?.toDouble(),
        totalWeight: json["totalWeight"],
        glsalesAccount: json["glsalesAccount"],
        glcogaccount: json["glcogaccount"],
        projectId: json["projectId"],
        warehouseBinZone: json["warehouseBinZone"],
        palletLevel: json["palletLevel"],
        cartonLevel: json["cartonLevel"],
        packLevelA: json["packLevelA"],
        packLevelB: json["packLevelB"],
        packLevelC: json["packLevelC"],
        trackingNumber: json["trackingNumber"],
        scheduledStartDate: json["scheduledStartDate"],
        scheduledEndDate: json["scheduledEndDate"],
        serviceStartDate: json["serviceStartDate"],
        serviceEndDate: json["serviceEndDate"],
        performedBy: json["performedBy"],
        detailMemo1: json["detailMemo1"],
        detailMemo2: json["detailMemo2"],
        detailMemo3: json["detailMemo3"],
        detailMemo4: json["detailMemo4"],
        detailMemo5: json["detailMemo5"],
        lockedBy: json["lockedBy"],
        lockTs: json["lockTs"],
        itemPricingCode: json["itemPricingCode"],
        deliveryNumber: json["deliveryNumber"],
        glanalysisType1: json["glanalysisType1"],
        glanalysisType2: json["glanalysisType2"],
        assetId: json["assetId"],
        budgetId: json["budgetId"],
        multipleDiscountGroupId: json["multipleDiscountGroupId"],
        multipleDiscountAmount: json["multipleDiscountAmount"],
        multipleDiscountPercent: json["multipleDiscountPercent"],
        discountAmount: json["discountAmount"],
        markUponCost: json["markUponCost"],
        markUpRate: json["markUpRate"],
        itemUnitCost: json["itemUnitCost"],
        taxInclusive: json["taxInclusive"],
        invoicedDate: json["invoicedDate"],
        branchCode: json["branchCode"] ?? "",
        productTypeId: json["productTypeId"],
        advertTypeId: json["advertTypeId"],
        unAppliedTotal: json["unAppliedTotal"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "companyId": companyIdValues.reverse[companyId],
        "divisionId": idValues.reverse[divisionId],
        "departmentId": idValues.reverse[departmentId],
        "invoiceNumber": invoiceNumber,
        "invoiceLineNumber": invoiceLineNumber,
        "itemId": itemIdValues.reverse[itemId],
        "itemUpccode": itemUpccode,
        "warehouseId": idValues.reverse[warehouseId],
        "warehouseBinId": branchCodeValues.reverse[warehouseBinId],
        "serialNumber": serialNumber,
        "orderQty": orderQty,
        "backOrdered": backOrdered,
        "backOrderQty": backOrderQty,
        "itemUom": itemUomValues.reverse[itemUom],
        "itemWeight": itemWeight,
        "description": descriptionValues.reverse[description],
        "discountPerc": discountPerc,
        "taxable": taxable,
        "currencyId": currencyIdValues.reverse[currencyId],
        "currencyExchangeRate": currencyExchangeRate,
        "itemCost": itemCost,
        "itemUnitPrice": itemUnitPrice,
        "taxGroupId": taxGroupId,
        "taxAmount": taxAmount,
        "taxPercent": taxPercent,
        "subTotal": subTotal,
        "total": total,
        "totalWeight": totalWeight,
        "glsalesAccount": glsalesAccount,
        "glcogaccount": glcogaccount,
        "projectId": idValues.reverse[projectId],
        "warehouseBinZone": warehouseBinZone,
        "palletLevel": palletLevel,
        "cartonLevel": cartonLevel,
        "packLevelA": packLevelA,
        "packLevelB": packLevelB,
        "packLevelC": packLevelC,
        "trackingNumber": trackingNumber,
        "scheduledStartDate": scheduledStartDate,
        "scheduledEndDate": scheduledEndDate,
        "serviceStartDate": serviceStartDate,
        "serviceEndDate": serviceEndDate,
        "performedBy": performedBy,
        "detailMemo1": detailMemo1,
        "detailMemo2": detailMemo2,
        "detailMemo3": detailMemo3,
        "detailMemo4": detailMemo4,
        "detailMemo5": detailMemo5,
        "lockedBy": lockedBy,
        "lockTs": lockTs,
        "itemPricingCode": itemPricingCode,
        "deliveryNumber": deliveryNumber,
        "glanalysisType1": glanalysisType1,
        "glanalysisType2": glanalysisType2,
        "assetId": assetId,
        "budgetId": budgetId,
        "multipleDiscountGroupId": multipleDiscountGroupId,
        "multipleDiscountAmount": multipleDiscountAmount,
        "multipleDiscountPercent": multipleDiscountPercent,
        "discountAmount": discountAmount,
        "markUponCost": markUponCost,
        "markUpRate": markUpRate,
        "itemUnitCost": itemUnitCost,
        "taxInclusive": taxInclusive,
        "invoicedDate": invoicedDate,
        "branchCode": branchCodeValues.reverse[branchCode],
        "productTypeId": productTypeId,
        "advertTypeId": advertTypeId,
        "unAppliedTotal": unAppliedTotal,
      };
}

enum BranchCode { LAGOS }

final branchCodeValues = EnumValues({"LAGOS": BranchCode.LAGOS});

enum Description { COMMERCIAL_PLATE }

final descriptionValues =
    EnumValues({"COMMERCIAL-PLATE": Description.COMMERCIAL_PLATE});

enum ItemId { GBELEGBO, THE_NATION, THE_NATION_SUNDAY }

final itemIdValues = EnumValues({
  "GBELEGBO": ItemId.GBELEGBO,
  "THE NATION": ItemId.THE_NATION,
  "THE NATION SUNDAY": ItemId.THE_NATION_SUNDAY
});

enum ItemUom { EACH }

final itemUomValues = EnumValues({"Each": ItemUom.EACH});

enum ShipId { SAME }

final shipIdValues = EnumValues({"SAME": ShipId.SAME});

enum ShippingName { MONEY_CENTRAL }

final shippingNameValues =
    EnumValues({"MONEY CENTRAL": ShippingName.MONEY_CENTRAL});

enum Signature { ADMIN }

final signatureValues = EnumValues({"Admin": Signature.ADMIN});

enum TermsId { NET_DUE }

final termsIdValues = EnumValues({"Net Due": TermsId.NET_DUE});

enum TransactionTypeId { RMA, INVOICE }

final transactionTypeIdValues = EnumValues(
    {"Invoice": TransactionTypeId.INVOICE, "RMA": TransactionTypeId.RMA});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
