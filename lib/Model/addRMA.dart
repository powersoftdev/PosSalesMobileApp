// To parse this JSON data, do
//
//     final AddRma = AddRmaFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';

AddRma AddRmaFromJson(String str) => AddRma.fromJson(json.decode(str));

String AddRmaToJson(AddRma data) => json.encode(data.toJson());

class AddRma {
  AddRma({
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
    List? rmaDetails,
  });

  final String? companyId;
  final String? divisionId;
  final String? departmentId;
  String? invoiceNumber;
  String? orderNumber;
  final String? transactionTypeId;
  final bool? transOpen;
  DateTime? invoiceDate;
  final DateTime? invoiceDueDate;
  final DateTime? invoiceShipDate;
  final DateTime? invoiceCancelDate;
  final DateTime? systemDate;
  final bool? memorize;
  final String? purchaseOrderNumber;
  final String? taxExemptId;
  final String? taxGroupId;
  String? customerId;
  final String? termsId;
  final String? currencyId;
  final int? currencyExchangeRate;
  final int? subtotal;
  final int? discountPers;
  final int? discountAmount;
  final int? taxPercent;
  final int? taxAmount;
  final int? taxableSubTotal;
  final int? freight;
  final bool? taxFreight;
  final int? handling;
  final dynamic advertising;
  final int? total;
  final String? employeeId;
  final bool? commissionPaid;
  final bool? commissionSelectToPay;
  final int? commission;
  final int? commissionableSales;
  final int? comissionalbleCost;
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
  final int? amountPaid;
  final int? undistributedAmount;
  final int? balanceDue;
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
  final bool? printed;
  final DateTime? printedDate;
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
  String? headerMemo4;
  final String? headerMemo5;
  final String? headerMemo6;
  final String? headerMemo7;
  final String? headerMemo8;
  final String? headerMemo9;
  final bool? approved;
  final dynamic approvedBy;
  final dynamic approvedDate;
  final dynamic enteredBy;
  final String? signature;
  final dynamic signaturePassword;
  final dynamic supervisorSignature;
  final dynamic supervisorPassword;
  final dynamic managerSignature;
  final dynamic managerPassword;
  final dynamic lockedBy;
  final dynamic lockTs;
  final String? bankId;
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
  final String? branchCode;
  List<RmaDetail>? rmaDetail;

  factory AddRma.fromJson(Map<String, dynamic> json) => AddRma(
        companyId: json["companyId"],
        divisionId: json["divisionId"],
        departmentId: json["departmentId"],
        invoiceNumber: json["invoiceNumber"],
        orderNumber: json["orderNumber"],
        transactionTypeId: json["transactionTypeId"],
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
        undistributedAmount: json["undistributedAmount"],
        balanceDue: json["balanceDue"],
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
        "companyId": companyId,
        "divisionId": divisionId,
        "departmentId": departmentId,
        "invoiceNumber": invoiceNumber,
        "orderNumber": orderNumber,
        "transactionTypeId": transactionTypeId,
        "transOpen": transOpen,
        "invoiceDate": invoiceDate?.toIso8601String(),
        "invoiceDueDate": invoiceDueDate?.toIso8601String(),
        "invoiceShipDate": invoiceShipDate?.toIso8601String(),
        "invoiceCancelDate": invoiceCancelDate?.toIso8601String(),
        "systemDate": systemDate?.toIso8601String(),
        "memorize": memorize,
        "purchaseOrderNumber": purchaseOrderNumber,
        "taxExemptId": taxExemptId,
        "taxGroupId": taxGroupId,
        "customerId": customerId,
        "termsId": termsId,
        "currencyId": currencyId,
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
        "commissionPaid": commissionPaid,
        "commissionSelectToPay": commissionSelectToPay,
        "commission": commission,
        "commissionableSales": commissionableSales,
        "comissionalbleCost": comissionalbleCost,
        "customerDropShipment": customerDropShipment,
        "shipMethodId": shipMethodId,
        "warehouseId": warehouseId,
        "shipToId": shipToId,
        "shipForId": shipForId,
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
  int? invoiceLineNumber;
  String? itemId;
  final dynamic itemUpccode;
  final String? warehouseId;
  final String? warehouseBinId;
  final dynamic serialNumber;
  int? orderQty;
  final bool? backOrdered;
  final int? backOrderQty;
  final String? itemUom;
  final int? itemWeight;
  final String? description;
  final dynamic discountPerc;
  final bool? taxable;
  final String? currencyId;
  final int? currencyExchangeRate;
  final int? itemCost;
   double? itemUnitPrice;
  final String? taxGroupId;
  final int? taxAmount;
  final double? taxPercent;
  final int? subTotal;
  final int? total;
  final int? totalWeight;
  final String? glsalesAccount;
  final String? glcogaccount;
  final String? projectId;
  final dynamic warehouseBinZone;
  final dynamic palletLevel;
  final dynamic cartonLevel;
  final dynamic packLevelA;
  final dynamic packLevelB;
  final dynamic packLevelC;
  final String? trackingNumber;
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
  final String? glanalysisType1;
  final String? glanalysisType2;
  final String? assetId;
  final dynamic budgetId;
  final String? multipleDiscountGroupId;
  final dynamic multipleDiscountAmount;
  final dynamic multipleDiscountPercent;
  final dynamic discountAmount;
  final dynamic markUponCost;
  final dynamic markUpRate;
  final dynamic itemUnitCost;
  final dynamic taxInclusive;
  final DateTime? invoicedDate;
  final String? branchCode;
  final dynamic productTypeId;
  final dynamic advertTypeId;
  final int? unAppliedTotal;

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
        itemUnitPrice: json["itemUnitPrice"],
        taxGroupId: json["taxGroupId"],
        taxAmount: json["taxAmount"],
        taxPercent: json["taxPercent"]?.toDouble(),
        subTotal: json["subTotal"],
        total: json["total"],
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
        invoicedDate: json["invoicedDate"] == null
            ? null
            : DateTime.parse(json["invoicedDate"]),
        branchCode: json["branchCode"],
        productTypeId: json["productTypeId"],
        advertTypeId: json["advertTypeId"],
        unAppliedTotal: json["unAppliedTotal"],
      );

  Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "divisionId": divisionId,
        "departmentId": departmentId,
        "invoiceNumber": invoiceNumber,
        "invoiceLineNumber": invoiceLineNumber,
        "itemId": itemId,
        "itemUpccode": itemUpccode,
        "warehouseId": warehouseId,
        "warehouseBinId": warehouseBinId,
        "serialNumber": serialNumber,
        "orderQty": orderQty,
        "backOrdered": backOrdered,
        "backOrderQty": backOrderQty,
        "itemUom": itemUom,
        "itemWeight": itemWeight,
        "description": description,
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
        "projectId": projectId,
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
        "branchCode": branchCode,
        "productTypeId": productTypeId,
        "advertTypeId": advertTypeId,
        "unAppliedTotal": unAppliedTotal,
      };
}
