// To parse this JSON data, do
//
//     final RME = RMEFromJson(jsonString);

// ignore_for_file: constant_identifier_names, duplicate_ignore

import 'dart:convert';

RME rmeFromJson(String str) => RME.fromJson(json.decode(str));

String rmeToJson(RME data) => json.encode(data.toJson());

class RME {
    RME({
        this.status,
        this.message,
        this.metadata,
        this.data,
        this.authToken,
    });

    final String? status;
    final String? message;
    final dynamic metadata;
    final List<ReturnRme>? data;
    final dynamic authToken;

    factory RME.fromJson(Map<String, dynamic> json) => RME(
        status: json["status"],
        message: json["message"],
        metadata: json["metadata"],
        data: json["data"] == null ? [] : List<ReturnRme>.from(json["data"]!.map((x) => ReturnRme.fromJson(x))),
        authToken: json["auth_token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "metadata": metadata,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "auth_token": authToken,
    };
}

class ReturnRme {
    ReturnRme({
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
        this.prdoubleed,
        this.prdoubleedDate,
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

    final String? companyId;
    final String? divisionId;
    final String? departmentId;
    final String? invoiceNumber;
    final String? orderNumber;
    final String? transactionTypeId;
    final bool? transOpen;
    final DateTime? invoiceDate;
    final DateTime? invoiceDueDate;
    final DateTime? invoiceShipDate;
    final DateTime? invoiceCancelDate;
    final DateTime? systemDate;
    final bool? memorize;
    final PurchaseOrderNumber? purchaseOrderNumber;
    final PurchaseOrderNumber? taxExemptId;
    final Id? taxGroupId;
    final String? customerId;
    final String? termsId;
    final String? currencyId;
    final double? currencyExchangeRate;
    final double? subtotal;
    final double? discountPers;
    final double? discountAmount;
    final double? taxPercent;
    final double? taxAmount;
    final double? taxableSubTotal;
    final double? freight;
    final bool? taxFreight;
    final double? handling;
    final dynamic advertising;
    final double? total;
    final String? employeeId;
    final bool? commissionPaid;
    final bool? commissionSelectToPay;
    final double? commission;
    final double? commissionableSales;
    final double? comissionalbleCost;
    final bool? customerDropShipment;
    final String? shipMethodId;
    final String? warehouseId;
    final String? shipToId;
    final String? shipForId;
    final String? shippingName;
    final String? shippingAddress1;
    final String? shippingAddress2;
    final String? shippingAddress3;
    final String? shippingCity;
    final String? shippingState;
    final String? shippingZip;
    final String? shippingCountry;
    final dynamic scheduledStartDate;
    final dynamic scheduledEndDate;
    final dynamic serviceStartDate;
    final dynamic serviceEndDate;
    final dynamic performedBy;
    final String? glsalesAccount;
    final dynamic glcogaccount;
    final String? paymentMethodId;
    final double? amountPaid;
    final double? undistributedAmount;
    final double? balanceDue;
    final String? checkNumber;
    final dynamic checkDate;
    final String? creditCardTypeId;
    final String? creditCardName;
    final dynamic creditCardNumber;
    final dynamic creditCardExpDate;
    final dynamic creditCardCsvnumber;
    final String? creditCardBillToZip;
    final String? creditCardValidationCode;
    final String? creditCardApprovalNumber;
    final bool? picked;
    final DateTime? pickedDate;
    final bool? prdoubleed;
    final DateTime? prdoubleedDate;
    final bool? shipped;
    final DateTime? shipDate;
    final String? trackingNumber;
    final bool? billed;
    final DateTime? billedDate;
    final bool? backordered;
    final bool? posted;
    final DateTime? postedDate;
    final dynamic allowanceDiscountPerc;
    final dynamic cashTendered;
    final String? masterBillOfLading;
    final dynamic masterBillOfLadingDate;
    final String? trailerNumber;
    final String? trailerPrefix;
    final String? headerMemo1;
    final String? headerMemo2;
    final String? headerMemo3;
    final String? headerMemo4;
    final String? headerMemo5;
    final String? headerMemo6;
    final String? headerMemo7;
    final String? headerMemo8;
    final HeaderMemo9? headerMemo9;
    final bool? approved;
    final dynamic approvedBy;
    final dynamic approvedDate;
    final dynamic enteredBy;
    final Signature? signature;
    final dynamic signaturePassword;
    final dynamic supervisorSignature;
    final dynamic supervisorPassword;
    final dynamic managerSignature;
    final dynamic managerPassword;
    final dynamic lockedBy;
    final dynamic lockTs;
    final dynamic bankId;
    final dynamic discountLine1;
    final dynamic discountLine2;
    final dynamic discountLine3;
    final dynamic discountLine4;
    final dynamic discountLine5;
    final dynamic discountGroupId1;
    final dynamic discountGroupId2;
    final dynamic discountGroupId3;
    final dynamic discountGroupId4;
    final dynamic discountGroupId5;
    final dynamic branchCode;
    final List<RmaDetail>? rmaDetail;

    factory ReturnRme.fromJson(Map<String, dynamic> json) => ReturnRme(
        companyId: json["companyId"],
        divisionId: json["divisionId"],
        departmentId: json["departmentId"],
        invoiceNumber: json["invoiceNumber"],
        orderNumber: json["orderNumber"],
        transactionTypeId: json["transactionTypeId"],
        transOpen: json["transOpen"],
        invoiceDate: json["invoiceDate"] == null ? null : DateTime.parse(json["invoiceDate"]),
        invoiceDueDate: json["invoiceDueDate"] == null ? null : DateTime.parse(json["invoiceDueDate"]),
        invoiceShipDate: json["invoiceShipDate"] == null ? null : DateTime.parse(json["invoiceShipDate"]),
        invoiceCancelDate: json["invoiceCancelDate"] == null ? null : DateTime.parse(json["invoiceCancelDate"]),
        systemDate: json["systemDate"] == null ? null : DateTime.parse(json["systemDate"]),
        memorize: json["memorize"],
        purchaseOrderNumber: purchaseOrderNumberValues.map[json["purchaseOrderNumber"]],
        taxExemptId: purchaseOrderNumberValues.map[json["taxExemptId"]],
        taxGroupId: idValues.map[json["taxGroupId"]],
        customerId: json["customerId"],
        termsId: json["termsId"],
        currencyId:json["currencyId"],
        currencyExchangeRate: json["currencyExchangeRate"],
        subtotal: json["subtotal"]?.toDouble(),
        discountPers: json["discountPers"],
        discountAmount: json["discountAmount"],
        taxPercent: json["taxPercent"],
        taxAmount: json["taxAmount"]?.toDouble(),
        taxableSubTotal: json["taxableSubTotal"]?.toDouble(),
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
        warehouseId: json["warehouseId"],
        shipToId: json["shipToId"],
        shipForId: json["shipForId"],
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
        pickedDate: json["pickedDate"] == null ? null : DateTime.parse(json["pickedDate"]),
        prdoubleed: json["prdoubleed"],
        prdoubleedDate: json["prdoubleedDate"] == null ? null : DateTime.parse(json["prdoubleedDate"]),
        shipped: json["shipped"],
        shipDate: json["shipDate"] == null ? null : DateTime.parse(json["shipDate"]),
        trackingNumber: json["trackingNumber"],
        billed: json["billed"],
        billedDate: json["billedDate"] == null ? null : DateTime.parse(json["billedDate"]),
        backordered: json["backordered"],
        posted: json["posted"],
        postedDate: json["postedDate"] == null ? null : DateTime.parse(json["postedDate"]),
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
        headerMemo9: headerMemo9Values.map[json["headerMemo9"]],
        approved: json["approved"],
        approvedBy: json["approvedBy"],
        approvedDate: json["approvedDate"],
        enteredBy: json["enteredBy"],
        signature: signatureValues.map[json["signature"]],
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
        rmaDetail: json["rmaDetail"] == null ? [] : List<RmaDetail>.from(json["rmaDetail"]!.map((x) => RmaDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "companyId": companyIdValues.reverse[companyId],
        "divisionId": idValues.reverse[divisionId],
        "departmentId": idValues.reverse[departmentId],
        "invoiceNumber": invoiceNumber,
        "orderNumber": orderNumber,
        "transactionTypeId": transactionTypeIdValues.reverse[transactionTypeId],
        "transOpen": transOpen,
        "invoiceDate": invoiceDate?.toIso8601String(),
        "invoiceDueDate": invoiceDueDate?.toIso8601String(),
        "invoiceShipDate": invoiceShipDate?.toIso8601String(),
        "invoiceCancelDate": invoiceCancelDate?.toIso8601String(),
        "systemDate": systemDate?.toIso8601String(),
        "memorize": memorize,
        "purchaseOrderNumber": purchaseOrderNumberValues.reverse[purchaseOrderNumber],
        "taxExemptId": purchaseOrderNumberValues.reverse[taxExemptId],
        "taxGroupId": idValues.reverse[taxGroupId],
        "customerId": customerIdValues.reverse[customerId],
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
        "prdoubleed": prdoubleed,
        "prdoubleedDate": prdoubleedDate?.toIso8601String(),
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
        "headerMemo4": headerMemo4,
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
        "rmaDetail": rmaDetail == null ? [] : List<dynamic>.from(rmaDetail!.map((x) => x.toJson())),
    };
}

// ignore: constant_identifier_names
enum CompanyId { VdoubleAGE_PRESS_LTD }

final companyIdValues = EnumValues({
    "VdoubleAGE PRESS LTD": CompanyId.VdoubleAGE_PRESS_LTD
});

enum CurrencyId { NGN }

final currencyIdValues = EnumValues({
    "NGN": CurrencyId.NGN
});

enum CustomerId { COMMPRdouble_036 }

final customerIdValues = EnumValues({
    "COMMPRdouble 036": CustomerId.COMMPRdouble_036
});

enum Id { DEFAULT }

final idValues = EnumValues({
    "DEFAULT": Id.DEFAULT
});

enum EmployeeId { ASA_SUNDAY_VPL_00118, EMPTY }

final employeeIdValues = EnumValues({
    "ASA SUNDAY-VPL/00118": EmployeeId.ASA_SUNDAY_VPL_00118,
    "": EmployeeId.EMPTY
});

enum HeaderMemo9 { EMPTY, MOBILE_SALES_RMA }

final headerMemo9Values = EnumValues({
    "": HeaderMemo9.EMPTY,
    "Mobile Sales RMA": HeaderMemo9.MOBILE_SALES_RMA
});

enum PurchaseOrderNumber { NONE }

final purchaseOrderNumberValues = EnumValues({
    "None": PurchaseOrderNumber.NONE
});

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

    final String? companyId;
    final String? divisionId;
    final String? departmentId;
    final String? invoiceNumber;
    final double? invoiceLineNumber;
    final String? itemId;
    final dynamic itemUpccode;
    final String? warehouseId;
    final String? warehouseBinId;
    final dynamic serialNumber;
    final double? orderQty;
    final bool? backOrdered;
    final double? backOrderQty;
    final ItemUom? itemUom;
    final double? itemWeight;
    final String? description;
    final double? discountPerc;
    final bool? taxable;
    final CurrencyId? currencyId;
    final double? currencyExchangeRate;
    final double? itemCost;
    final double? itemUnitPrice;
    final dynamic taxGroupId;
    final double? taxAmount;
    final double? taxPercent;
    final double? subTotal;
    final double? total;
    final double? totalWeight;
    final String? glsalesAccount;
    final dynamic glcogaccount;
    final String? projectId;
    final dynamic warehouseBinZone;
    final dynamic palletLevel;
    final dynamic cartonLevel;
    final dynamic packLevelA;
    final dynamic packLevelB;
    final dynamic packLevelC;
    final dynamic trackingNumber;
    final dynamic scheduledStartDate;
    final dynamic scheduledEndDate;
    final dynamic serviceStartDate;
    final dynamic serviceEndDate;
    final dynamic performedBy;
    final dynamic detailMemo1;
    final dynamic detailMemo2;
    final dynamic detailMemo3;
    final dynamic detailMemo4;
    final dynamic detailMemo5;
    final dynamic lockedBy;
    final dynamic lockTs;
    final dynamic itemPricingCode;
    final dynamic deliveryNumber;
    final dynamic glanalysisType1;
    final dynamic glanalysisType2;
    final dynamic assetId;
    final dynamic budgetId;
    final dynamic multipleDiscountGroupId;
    final dynamic multipleDiscountAmount;
    final dynamic multipleDiscountPercent;
    final dynamic discountAmount;
    final bool? markUponCost;
    final dynamic markUpRate;
    final dynamic itemUnitCost;
    final bool? taxInclusive;
    final DateTime? invoicedDate;
    final BranchCode? branchCode;
    final dynamic productTypeId;
    final dynamic advertTypeId;
    final double? unAppliedTotal;

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
        itemUom: itemUomValues.map[json["itemUom"]]!,
        itemWeight: json["itemWeight"],
        description: json["description"],
        discountPerc: json["discountPerc"],
        taxable: json["taxable"],
        currencyId: currencyIdValues.map[json["currencyId"]],
        currencyExchangeRate: json["currencyExchangeRate"],
        itemCost: json["itemCost"],
        itemUnitPrice: json["itemUnitPrice"]?.toDouble(),
        taxGroupId: taxGroupIdValues.map[json["taxGroupId"]],
        taxAmount: json["taxAmount"]?.toDouble(),
        taxPercent: json["taxPercent"]?.toDouble(),
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
        invoicedDate: json["invoicedDate"] == null ? null : DateTime.parse(json["invoicedDate"]),
        branchCode: branchCodeValues.map[json["branchCode"]],
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
        "itemId": descriptionValues.reverse[itemId],
        "itemUpccode": itemUpccode,
        "warehouseId": warehouseIdValues.reverse[warehouseId],
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
        "taxGroupId": taxGroupIdValues.reverse[taxGroupId],
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
        "invoicedDate": invoicedDate?.toIso8601String(),
        "branchCode": branchCodeValues.reverse[branchCode],
        "productTypeId": productTypeId,
        "advertTypeId": advertTypeId,
        "unAppliedTotal": unAppliedTotal,
    };
}

enum BranchCode { LAGOS }

final branchCodeValues = EnumValues({
    "LAGOS": BranchCode.LAGOS
});

enum Description { COMMERCIAL_PLATE, COMMERCIAL_IMPRESSION, COMMERCIAL_NEWSPRdouble }

final descriptionValues = EnumValues({
    "COMMERCIAL-IMPRESSION": Description.COMMERCIAL_IMPRESSION,
    "COMMERCIAL-NEWSPRdouble": Description.COMMERCIAL_NEWSPRdouble,
    "COMMERCIAL-PLATE": Description.COMMERCIAL_PLATE
});

enum ItemUom { EACH }

final itemUomValues = EnumValues({
    "Each": ItemUom.EACH
});

enum TaxGroupId { EMPTY, VAT7_5 }

final taxGroupIdValues = EnumValues({
    "": TaxGroupId.EMPTY,
    "VAT7.5": TaxGroupId.VAT7_5
});

enum WarehouseId { LAGOS_STORE }

final warehouseIdValues = EnumValues({
    "LAGOS STORE": WarehouseId.LAGOS_STORE
});

enum ShipId { SAME }

final shipIdValues = EnumValues({
    "SAME": ShipId.SAME
});

enum ShippingName { MONEY_CENTRAL, TRIBUNE }

final shippingNameValues = EnumValues({
    "MONEY CENTRAL": ShippingName.MONEY_CENTRAL,
    "TRIBUNE": ShippingName.TRIBUNE
});

enum Signature { ADMIN, doubleERNAL_AUDIT2_LAGOS, ACCOUNT3_LAGOS }

final signatureValues = EnumValues({
    "Account3/lagos": Signature.ACCOUNT3_LAGOS,
    "Admin": Signature.ADMIN,
    "doubleernal Audit2/Lagos": Signature.doubleERNAL_AUDIT2_LAGOS
});

enum TermsId { NET_DUE }

final termsIdValues = EnumValues({
    "Net Due": TermsId.NET_DUE
});

enum TransactionTypeId { RMA }

final transactionTypeIdValues = EnumValues({
    "RMA": TransactionTypeId.RMA
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
