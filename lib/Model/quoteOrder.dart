

// ignore_for_file: file_names, constant_identifier_names

import 'dart:convert';

QuoteOrder quoteOrderFromJson(String str) => QuoteOrder.fromJson(json.decode(str));

String quoteOrderToJson(QuoteOrder data) => json.encode(data.toJson());

class QuoteOrder {
    QuoteOrder({
        this.status,
        this.message,
        this.metadata,
        this.data,
        this.authToken,
    });

    final String? status;
    final String? message;
    final dynamic metadata;
    final List<QuoteOrders>? data;
    final dynamic authToken;

    factory QuoteOrder.fromJson(Map<String, dynamic> json) => QuoteOrder(
        status: json["status"],
        message: json["message"],
        metadata: json["metadata"],
        data: json["data"] == null ? [] : List<QuoteOrders>.from(json["data"]!.map((x) => QuoteOrders.fromJson(x))),
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

class QuoteOrders {
    QuoteOrders({
        this.companyId,
        this.divisionId,
        this.departmentId,
        this.orderNumber,
        this.transactionTypeId,
        this.orderTypeId,
        this.orderDate,
        this.orderDueDate,
        this.orderShipDate,
        this.orderCancelDate,
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
        this.commission,
        this.commissionableSales,
        this.comissionalbleCost,
        this.customerDropShipment,
        this.shipMethodId,
        this.warehouseId,
        this.shipForId,
        this.shipToId,
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
        this.balanceDue,
        this.undistributedAmount,
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
        this.backordered,
        this.picked,
        this.pickedDate,
        this.printed,
        this.printedDate,
        this.shipped,
        this.shipDate,
        this.trackingNumber,
        this.billed,
        this.billedDate,
        this.invoiced,
        this.invoiceNumber,
        this.invoiceDate,
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
        this.originalOrderNumber,
        this.originalOrderDate,
        this.deliveryNumber,
        this.headerMemo10,
        this.headerMemo11,
        this.headerMemo12,
        this.ullage1,
        this.ullage2,
        this.ullage3,
        this.ullage4,
        this.ullage5,
        this.ullage6,
        this.ullage7,
        this.ullage8,
        this.ullage9,
        this.ullage10,
        this.ullage11,
        this.ullage12,
        this.branchCode,
        this.merged,
        this.created,
        this.financeApproved,
        this.financeApprovedDate,
        this.financeComment,
        this.financeReturnedDate,
        this.bdmapproved,
        this.bdmapprovedDate,
        this.bdmcomment,
        this.fmapproved,
        this.fmapprovedDate,
        this.fmcomment,
        this.mdapproved,
        this.mdapprovedDate,
        this.mdcomment,
        this.regularized,
        this.fmvoid,
        this.fmvoidedDate,
        this.receiptId,
        this.commercialComment,
        this.fmapprovedBy,
        this.commercialApprovedBy,
        this.financeApprovedBy,
        this.cooapprovedBy,
        this.orderDetail,
    });

    final String? companyId;
    final String? divisionId;
    final String? departmentId;
    final String? orderNumber;
    final String? transactionTypeId;
    final String? orderTypeId;
    final DateTime? orderDate;
    final DateTime? orderDueDate;
    final DateTime? orderShipDate;
    final DateTime? orderCancelDate;
    final DateTime? systemDate;
    final bool? memorize;
    final String? purchaseOrderNumber;
    final String? taxExemptId;
    final String? taxGroupId;
    final String? customerId;
    final String? termsId;
    final String? currencyId;
    final int? currencyExchangeRate;
    final double? subtotal;
    final int? discountPers;
    final double? discountAmount;
    final int? taxPercent;
    final double? taxAmount;
    final double? taxableSubTotal;
    final double? freight;
    final bool? taxFreight;
    final double? handling;
    final double? advertising;
    final double? total;
    final dynamic employeeId;
    final double? commission;
    final double? commissionableSales;
    final double? comissionalbleCost;
    final bool? customerDropShipment;
    final dynamic shipMethodId;
    final Id? warehouseId;
    final ShipId? shipForId;
    final ShipId? shipToId;
    final dynamic shippingName;
    final dynamic shippingAddress1;
    final dynamic shippingAddress2;
    final dynamic shippingAddress3;
    final dynamic shippingCity;
    final dynamic shippingState;
    final dynamic shippingZip;
    final dynamic shippingCountry;
    final dynamic scheduledStartDate;
    final dynamic scheduledEndDate;
    final dynamic serviceStartDate;
    final dynamic serviceEndDate;
    final dynamic performedBy;
    final dynamic glsalesAccount;
    final dynamic glcogaccount;
    final dynamic paymentMethodId;
    final double? amountPaid;
    final dynamic balanceDue;
    final dynamic undistributedAmount;
    final dynamic checkNumber;
    final dynamic checkDate;
    final dynamic creditCardTypeId;
    final dynamic creditCardName;
    final dynamic creditCardNumber;
    final dynamic creditCardExpDate;
    final dynamic creditCardCsvnumber;
    final dynamic creditCardBillToZip;
    final dynamic creditCardValidationCode;
    final dynamic creditCardApprovalNumber;
    final bool? backordered;
    final bool? picked;
    final DateTime? pickedDate;
    final bool? printed;
    final DateTime? printedDate;
    final bool? shipped;
    final DateTime? shipDate;
    final dynamic trackingNumber;
    final bool? billed;
    final dynamic billedDate;
    final bool? invoiced;
    final dynamic invoiceNumber;
    final DateTime? invoiceDate;
    final bool? posted;
    final DateTime? postedDate;
    final dynamic allowanceDiscountPerc;
    final dynamic cashTendered;
    final dynamic masterBillOfLading;
    final dynamic masterBillOfLadingDate;
    final dynamic trailerNumber;
    final dynamic trailerPrefix;
    final dynamic headerMemo1;
    final dynamic headerMemo2;
    final dynamic headerMemo3;
    final dynamic headerMemo4;
    final dynamic headerMemo5;
    final dynamic headerMemo6;
    final dynamic headerMemo7;
    final dynamic headerMemo8;
    final dynamic headerMemo9;
    final dynamic approved;
    final dynamic approvedBy;
    final dynamic approvedDate;
    final dynamic enteredBy;
    final dynamic signature;
    final dynamic signaturePassword;
    final dynamic supervisorSignature;
    final dynamic supervisorPassword;
    final dynamic managerSignature;
    final dynamic managerPassword;
    final dynamic lockedBy;
    final dynamic lockTs;
    final BankId? bankId;
    final dynamic originalOrderNumber;
    final dynamic originalOrderDate;
    final dynamic deliveryNumber;
    final dynamic headerMemo10;
    final dynamic headerMemo11;
    final String? headerMemo12;
    final dynamic ullage1;
    final dynamic ullage2;
    final dynamic ullage3;
    final dynamic ullage4;
    final dynamic ullage5;
    final dynamic ullage6;
    final dynamic ullage7;
    final dynamic ullage8;
    final dynamic ullage9;
    final dynamic ullage10;
    final dynamic ullage11;
    final dynamic ullage12;
    final dynamic branchCode;
    final dynamic merged;
    final dynamic created;
    final dynamic financeApproved;
    final dynamic financeApprovedDate;
    final dynamic financeComment;
    final dynamic financeReturnedDate;
    final dynamic bdmapproved;
    final dynamic bdmapprovedDate;
    final dynamic bdmcomment;
    final dynamic fmapproved;
    final dynamic fmapprovedDate;
    final dynamic fmcomment;
    final dynamic mdapproved;
    final dynamic mdapprovedDate;
    final dynamic mdcomment;
    final dynamic regularized;
    final dynamic fmvoid;
    final dynamic fmvoidedDate;
    final dynamic receiptId;
    final dynamic commercialComment;
    final dynamic fmapprovedBy;
    final dynamic commercialApprovedBy;
    final dynamic financeApprovedBy;
    final dynamic cooapprovedBy;
    final List<OrderDetail>? orderDetail;

    factory QuoteOrders.fromJson(Map<String, dynamic> json) => QuoteOrders(
        companyId: json["companyId"],
        divisionId: json["divisionId"],
        departmentId: json["departmentId"],
        orderNumber: json["orderNumber"],
        transactionTypeId: json["transactionTypeId"],
        orderTypeId: json["orderTypeId"],
        orderDate: json["orderDate"] == null ? null : DateTime.parse(json["orderDate"]),
        orderDueDate: json["orderDueDate"] == null ? null : DateTime.parse(json["orderDueDate"]),
        orderShipDate: json["orderShipDate"] == null ? null : DateTime.parse(json["orderShipDate"]),
        orderCancelDate: json["orderCancelDate"] == null ? null : DateTime.parse(json["orderCancelDate"]),
        systemDate: json["systemDate"] == null ? null : DateTime.parse(json["systemDate"]),
        memorize: json["memorize"],
        purchaseOrderNumber: json["purchaseOrderNumber"],
        taxExemptId: json["taxExemptId"],
        taxGroupId: json["taxGroupId"],
        customerId: json["customerId"],
        termsId: json["termsId"],
        currencyId: json["currencyId"],
        currencyExchangeRate: json["currencyExchangeRate"],
        subtotal: json["subtotal"],
        discountPers: json["discountPers"],
        discountAmount: json["discountAmount"],
        taxPercent: json["taxPercent"],
        taxAmount: json["taxAmount"],
        taxableSubTotal: json["taxableSubTotal"],
        freight: json["freight"],
        taxFreight: json["taxFreight"],
        handling: json["handling"],
        advertising: json["advertising"],
        total: json["total"],
        employeeId: json["employeeId"],
        commission: json["commission"],
        commissionableSales: json["commissionableSales"],
        comissionalbleCost: json["comissionalbleCost"],
        customerDropShipment: json["customerDropShipment"],
        shipMethodId: json["shipMethodId"],
        warehouseId: idValues.map[json["warehouseId"]]!,
        shipForId: shipIdValues.map[json["shipForId"]]!,
        shipToId: shipIdValues.map[json["shipToId"]]!,
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
        balanceDue: json["balanceDue"],
        undistributedAmount: json["undistributedAmount"],
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
        backordered: json["backordered"],
        picked: json["picked"],
        pickedDate: json["pickedDate"] == null ? null : DateTime.parse(json["pickedDate"]),
        printed: json["printed"],
        printedDate: json["printedDate"] == null ? null : DateTime.parse(json["printedDate"]),
        shipped: json["shipped"],
        shipDate: json["shipDate"] == null ? null : DateTime.parse(json["shipDate"]),
        trackingNumber: json["trackingNumber"],
        billed: json["billed"],
        billedDate: json["billedDate"],
        invoiced: json["invoiced"],
        invoiceNumber: json["invoiceNumber"],
        invoiceDate: json["invoiceDate"] == null ? null : DateTime.parse(json["invoiceDate"]),
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
        bankId: bankIdValues.map[json["bankId"]]!,
        originalOrderNumber: json["originalOrderNumber"],
        originalOrderDate: json["originalOrderDate"],
        deliveryNumber: json["deliveryNumber"],
        headerMemo10: json["headerMemo10"],
        headerMemo11: json["headerMemo11"],
        headerMemo12: json["headerMemo12"] ?? "",
        ullage1: json["ullage1"],
        ullage2: json["ullage2"],
        ullage3: json["ullage3"],
        ullage4: json["ullage4"],
        ullage5: json["ullage5"],
        ullage6: json["ullage6"],
        ullage7: json["ullage7"],
        ullage8: json["ullage8"],
        ullage9: json["ullage9"],
        ullage10: json["ullage10"],
        ullage11: json["ullage11"],
        ullage12: json["ullage12"],
        branchCode: json["branchCode"],
        merged: json["merged"],
        created: json["created"],
        financeApproved: json["financeApproved"],
        financeApprovedDate: json["financeApprovedDate"],
        financeComment: json["financeComment"],
        financeReturnedDate: json["financeReturnedDate"],
        bdmapproved: json["bdmapproved"],
        bdmapprovedDate: json["bdmapprovedDate"],
        bdmcomment: json["bdmcomment"],
        fmapproved: json["fmapproved"],
        fmapprovedDate: json["fmapprovedDate"],
        fmcomment: json["fmcomment"],
        mdapproved: json["mdapproved"],
        mdapprovedDate: json["mdapprovedDate"],
        mdcomment: json["mdcomment"],
        regularized: json["regularized"],
        fmvoid: json["fmvoid"],
        fmvoidedDate: json["fmvoidedDate"],
        receiptId: json["receiptId"],
        commercialComment: json["commercialComment"],
        fmapprovedBy: json["fmapprovedBy"],
        commercialApprovedBy: json["commercialApprovedBy"],
        financeApprovedBy: json["financeApprovedBy"],
        cooapprovedBy: json["cooapprovedBy"],
        orderDetail: json["orderDetail"] == null ? [] : List<OrderDetail>.from(json["orderDetail"]!.map((x) => OrderDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "companyId": companyIdValues.reverse[companyId],
        "divisionId": idValues.reverse[divisionId],
        "departmentId": idValues.reverse[departmentId],
        "orderNumber": orderNumber,
        "transactionTypeId": typeIdValues.reverse[transactionTypeId],
        "orderTypeId": typeIdValues.reverse[orderTypeId],
        "orderDate": orderDate?.toIso8601String(),
        "orderDueDate": orderDueDate?.toIso8601String(),
        "orderShipDate": orderShipDate?.toIso8601String(),
        "orderCancelDate": orderCancelDate?.toIso8601String(),
        "systemDate": systemDate?.toIso8601String(),
        "memorize": memorize,
        "purchaseOrderNumber": purchaseOrderNumberValues.reverse[purchaseOrderNumber],
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
        "employeeId": employeeId,
        "commission": commission,
        "commissionableSales": commissionableSales,
        "comissionalbleCost": comissionalbleCost,
        "customerDropShipment": customerDropShipment,
        "shipMethodId": shipMethodId,
        "warehouseId": idValues.reverse[warehouseId],
        "shipForId": shipIdValues.reverse[shipForId],
        "shipToId": shipIdValues.reverse[shipToId],
        "shippingName": shippingName,
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
        "balanceDue": balanceDue,
        "undistributedAmount": undistributedAmount,
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
        "backordered": backordered,
        "picked": picked,
        "pickedDate": pickedDate?.toIso8601String(),
        "printed": printed,
        "printedDate": printedDate?.toIso8601String(),
        "shipped": shipped,
        "shipDate": shipDate?.toIso8601String(),
        "trackingNumber": trackingNumber,
        "billed": billed,
        "billedDate": billedDate,
        "invoiced": invoiced,
        "invoiceNumber": invoiceNumber,
        "invoiceDate": invoiceDate?.toIso8601String(),
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
        "headerMemo9": headerMemo9,
        "approved": approved,
        "approvedBy": approvedBy,
        "approvedDate": approvedDate,
        "enteredBy": enteredBy,
        "signature": signature,
        "signaturePassword": signaturePassword,
        "supervisorSignature": supervisorSignature,
        "supervisorPassword": supervisorPassword,
        "managerSignature": managerSignature,
        "managerPassword": managerPassword,
        "lockedBy": lockedBy,
        "lockTs": lockTs,
        "bankId": bankIdValues.reverse[bankId],
        "originalOrderNumber": originalOrderNumber,
        "originalOrderDate": originalOrderDate,
        "deliveryNumber": deliveryNumber,
        "headerMemo10": headerMemo10,
        "headerMemo11": headerMemo11,
        "headerMemo12": headerMemo12Values.reverse[headerMemo12],
        "ullage1": ullage1,
        "ullage2": ullage2,
        "ullage3": ullage3,
        "ullage4": ullage4,
        "ullage5": ullage5,
        "ullage6": ullage6,
        "ullage7": ullage7,
        "ullage8": ullage8,
        "ullage9": ullage9,
        "ullage10": ullage10,
        "ullage11": ullage11,
        "ullage12": ullage12,
        "branchCode": branchCode,
        "merged": merged,
        "created": created,
        "financeApproved": financeApproved,
        "financeApprovedDate": financeApprovedDate,
        "financeComment": financeComment,
        "financeReturnedDate": financeReturnedDate,
        "bdmapproved": bdmapproved,
        "bdmapprovedDate": bdmapprovedDate,
        "bdmcomment": bdmcomment,
        "fmapproved": fmapproved,
        "fmapprovedDate": fmapprovedDate,
        "fmcomment": fmcomment,
        "mdapproved": mdapproved,
        "mdapprovedDate": mdapprovedDate,
        "mdcomment": mdcomment,
        "regularized": regularized,
        "fmvoid": fmvoid,
        "fmvoidedDate": fmvoidedDate,
        "receiptId": receiptId,
        "commercialComment": commercialComment,
        "fmapprovedBy": fmapprovedBy,
        "commercialApprovedBy": commercialApprovedBy,
        "financeApprovedBy": financeApprovedBy,
        "cooapprovedBy": cooapprovedBy,
        "orderDetail": orderDetail == null ? [] : List<dynamic>.from(orderDetail!.map((x) => x.toJson())),
    };
}

enum BankId { CASH }

final bankIdValues = EnumValues({
    "CASH": BankId.CASH
});

enum CompanyId { VINTAGE_PRESS_LTD }

final companyIdValues = EnumValues({
    "VINTAGE PRESS LTD": CompanyId.VINTAGE_PRESS_LTD
});

enum CurrencyId { NGN }

final currencyIdValues = EnumValues({
    "NGN": CurrencyId.NGN
});

enum Id { DEFAULT }

final idValues = EnumValues({
    "DEFAULT": Id.DEFAULT
});

enum HeaderMemo12 { SALES_MOBILE_QUOTE }

final headerMemo12Values = EnumValues({
    "Sales Mobile Quote": HeaderMemo12.SALES_MOBILE_QUOTE
});

class OrderDetail {
    OrderDetail({
        this.companyId,
        this.divisionId,
        this.departmentId,
        this.orderNumber,
        this.orderLineNumber,
        this.itemId,
        this.itemUpccode,
        this.warehouseId,
        this.warehouseBinId,
        this.serialNumber,
        this.description,
        this.orderQty,
        this.backOrdered,
        this.backOrderQyyty,
        this.itemUom,
        this.itemWeight,
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
        this.trackingNumber,
        this.warehouseBinZone,
        this.palletLevel,
        this.cartonLevel,
        this.packLevelA,
        this.packLevelB,
        this.packLevelC,
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
        this.invoiced,
        this.invoicedDate,
        this.invoicedQty,
        this.deliveryNumber,
        this.glanalysisType1,
        this.glanalysisType2,
        this.assetId,
        this.multipleDiscountGroupId,
        this.multipleDiscountAmount,
        this.multipleDiscountPercent,
        this.discountAmount,
        this.markUponCost,
        this.markUpRate,
        this.itemUnitCost,
        this.branchCode,
        this.productTypeId,
        this.advertTypeId,
        this.backOrderBooked,
        this.backOrderBookedDate,
        this.backOrderBookedBy,
    });

    final String? companyId;
    final String? divisionId;
    final String? departmentId;
    final String? orderNumber;
    final int? orderLineNumber;
    final String? itemId;
    final dynamic itemUpccode;
    final String? warehouseId;
    final dynamic warehouseBinId;
    final dynamic serialNumber;
    final dynamic description;
    final int? orderQty;
    final bool? backOrdered;
    final int? backOrderQyyty;
    final ItemUom? itemUom;
    final int? itemWeight;
    final int? discountPerc;
    final bool? taxable;
    final dynamic currencyId;
    final dynamic currencyExchangeRate;
    final double? itemCost;
    final double? itemUnitPrice;
    final String? taxGroupId;
    final double? taxAmount;
    final dynamic taxPercent;
    final double? subTotal;
    final double? total;
    final int? totalWeight;
    final dynamic glsalesAccount;
    final dynamic glcogaccount;
    final Id? projectId;
    final dynamic trackingNumber;
    final dynamic warehouseBinZone;
    final dynamic palletLevel;
    final dynamic cartonLevel;
    final dynamic packLevelA;
    final dynamic packLevelB;
    final dynamic packLevelC;
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
    final bool? invoiced;
    final DateTime? invoicedDate;
    final int? invoicedQty;
    final dynamic deliveryNumber;
    final dynamic glanalysisType1;
    final dynamic glanalysisType2;
    final dynamic assetId;
    final dynamic multipleDiscountGroupId;
    final dynamic multipleDiscountAmount;
    final dynamic multipleDiscountPercent;
    final double? discountAmount;
    final dynamic markUponCost;
    final dynamic markUpRate;
    final dynamic itemUnitCost;
    final dynamic branchCode;
    final dynamic productTypeId;
    final dynamic advertTypeId;
    final dynamic backOrderBooked;
    final dynamic backOrderBookedDate;
    final dynamic backOrderBookedBy;

    factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        companyId: json["companyId"],
        divisionId: json["divisionId"],
        departmentId: json["departmentId"],
        orderNumber: json["orderNumber"],
        orderLineNumber: json["orderLineNumber"],
        itemId: json["itemId"],
        itemUpccode: json["itemUpccode"],
        warehouseId: json["warehouseId"],
        warehouseBinId: json["warehouseBinId"],
        serialNumber: json["serialNumber"],
        description: json["description"],
        orderQty: json["orderQty"],
        backOrdered: json["backOrdered"],
        backOrderQyyty: json["backOrderQyyty"],
        itemUom: itemUomValues.map[json["itemUom"]]!,
        itemWeight: json["itemWeight"],
        discountPerc: json["discountPerc"],
        taxable: json["taxable"],
        currencyId: json["currencyId"],
        currencyExchangeRate: json["currencyExchangeRate"],
        itemCost: json["itemCost"],
        itemUnitPrice: json["itemUnitPrice"],
        taxGroupId: json["taxGroupId"],
        taxAmount: json["taxAmount"],
        taxPercent: json["taxPercent"],
        subTotal: json["subTotal"],
        total: json["total"],
        totalWeight: json["totalWeight"],
        glsalesAccount: json["glsalesAccount"],
        glcogaccount: json["glcogaccount"],
        projectId: idValues.map[json["projectId"]]!,
        trackingNumber: json["trackingNumber"],
        warehouseBinZone: json["warehouseBinZone"],
        palletLevel: json["palletLevel"],
        cartonLevel: json["cartonLevel"],
        packLevelA: json["packLevelA"],
        packLevelB: json["packLevelB"],
        packLevelC: json["packLevelC"],
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
        invoiced: json["invoiced"],
        invoicedDate: json["invoicedDate"] == null ? null : DateTime.parse(json["invoicedDate"]),
        invoicedQty: json["invoicedQty"],
        deliveryNumber: json["deliveryNumber"],
        glanalysisType1: json["glanalysisType1"],
        glanalysisType2: json["glanalysisType2"],
        assetId: json["assetId"],
        multipleDiscountGroupId: json["multipleDiscountGroupId"],
        multipleDiscountAmount: json["multipleDiscountAmount"],
        multipleDiscountPercent: json["multipleDiscountPercent"],
        discountAmount: json["discountAmount"],
        markUponCost: json["markUponCost"],
        markUpRate: json["markUpRate"],
        itemUnitCost: json["itemUnitCost"],
        branchCode: json["branchCode"],
        productTypeId: json["productTypeId"],
        advertTypeId: json["advertTypeId"],
        backOrderBooked: json["backOrderBooked"],
        backOrderBookedDate: json["backOrderBookedDate"],
        backOrderBookedBy: json["backOrderBookedBy"],
    );

    Map<String, dynamic> toJson() => {
        "companyId": companyIdValues.reverse[companyId],
        "divisionId": idValues.reverse[divisionId],
        "departmentId": idValues.reverse[departmentId],
        "orderNumber": orderNumber,
        "orderLineNumber": orderLineNumber,
        "itemId": itemId,
        "itemUpccode": itemUpccode,
        "warehouseId": idValues.reverse[warehouseId],
        "warehouseBinId": warehouseBinId,
        "serialNumber": serialNumber,
        "description": description,
        "orderQty": orderQty,
        "backOrdered": backOrdered,
        "backOrderQyyty": backOrderQyyty,
        "itemUom": itemUomValues.reverse[itemUom],
        "itemWeight": itemWeight,
        "discountPerc": discountPerc,
        "taxable": taxable,
        "currencyId": currencyId,
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
        "trackingNumber": trackingNumber,
        "warehouseBinZone": warehouseBinZone,
        "palletLevel": palletLevel,
        "cartonLevel": cartonLevel,
        "packLevelA": packLevelA,
        "packLevelB": packLevelB,
        "packLevelC": packLevelC,
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
        "invoiced": invoiced,
        "invoicedDate": invoicedDate?.toIso8601String(),
        "invoicedQty": invoicedQty,
        "deliveryNumber": deliveryNumber,
        "glanalysisType1": glanalysisType1,
        "glanalysisType2": glanalysisType2,
        "assetId": assetId,
        "multipleDiscountGroupId": multipleDiscountGroupId,
        "multipleDiscountAmount": multipleDiscountAmount,
        "multipleDiscountPercent": multipleDiscountPercent,
        "discountAmount": discountAmount,
        "markUponCost": markUponCost,
        "markUpRate": markUpRate,
        "itemUnitCost": itemUnitCost,
        "branchCode": branchCode,
        "productTypeId": productTypeId,
        "advertTypeId": advertTypeId,
        "backOrderBooked": backOrderBooked,
        "backOrderBookedDate": backOrderBookedDate,
        "backOrderBookedBy": backOrderBookedBy,
    };
}

enum ItemUom { EACH }

final itemUomValues = EnumValues({
    "Each": ItemUom.EACH
});

enum TypeId { QUOTE }

final typeIdValues = EnumValues({
    "Quote": TypeId.QUOTE
});

enum PurchaseOrderNumber { NONE }

final purchaseOrderNumberValues = EnumValues({
    "None": PurchaseOrderNumber.NONE
});

enum ShipId { SAME }

final shipIdValues = EnumValues({
    "SAME": ShipId.SAME
});

enum TermsId { NET_DUE }

final termsIdValues = EnumValues({
    "Net Due": TermsId.NET_DUE
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
