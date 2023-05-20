// To parse this JSON data, do
//
//     final SearchItem = SearchItemFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';

SearchItem SearchItemFromJson(String str) => SearchItem.fromJson(json.decode(str));

String SearchItemToJson(SearchItem data) => json.encode(data.toJson());

class SearchItem {
    SearchItem({
        this.status,
        this.message,
        this.metadata,
        this.data,
        this.authToken,
    });

    final String? status;
    final String? message;
    final dynamic metadata;
    final List<Datum>? data;
    final dynamic authToken;

    factory SearchItem.fromJson(Map<String, dynamic> json) => SearchItem(
        status: json["status"],
        message: json["message"],
        metadata: json["metadata"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
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

class Datum {
    Datum({
        this.companyId,
        this.divisionId,
        this.departmentId,
        this.itemId,
        this.isActive,
        this.itemTypeId,
        this.itemName,
        this.itemDescription,
        this.itemLongDescription,
        this.itemCategoryId,
        this.itemFamilyId,
        this.salesDescription,
        this.purchaseDescription,
        this.pictureUrl,
        this.largePictureUrl,
        this.itemWeight,
        this.itemWeightMetric,
        this.itemShipWeight,
        this.itemUpccode,
        this.itemEpccode,
        this.itemRfid,
        this.itemSize,
        this.itemSizeCmm,
        this.itemDimentions,
        this.itemDimentionsCmm,
        this.itemColor,
        this.itemNrfcolor,
        this.itemStyle,
        this.itemNrfstyle,
        this.itemCareInstructions,
        this.itemDefaultWarehouse,
        this.itemDefaultWarehouseBin,
        this.itemLocationX,
        this.itemLocationY,
        this.itemLocationZ,
        this.downloadLocation,
        this.downloadPassword,
        this.itemUom,
        this.glitemSalesAccount,
        this.glitemCogsaccount,
        this.glitemInventoryAccount,
        this.packId,
        this.currencyId,
        this.currencyExchangeRate,
        this.price,
        this.itemPricingCode,
        this.pricingMethods,
        this.taxable,
        this.vendorId,
        this.leadTime,
        this.leadTimeUnit,
        this.reOrderLevel,
        this.reOrderQty,
        this.buildTime,
        this.buildTimeUnit,
        this.useageRate,
        this.useageRateUnit,
        this.salesForecast,
        this.salesForecastUnit,
        this.calculatedCover,
        this.calculatedCoverUnits,
        this.isAssembly,
        this.itemAssembly,
        this.lifo,
        this.lifovalue,
        this.lifocost,
        this.average,
        this.averageValue,
        this.averageCost,
        this.fifo,
        this.fifovalue,
        this.fifocost,
        this.expected,
        this.expectedValue,
        this.expectedCost,
        this.landed,
        this.landedValue,
        this.landedCost,
        this.other,
        this.otherValue,
        this.otherCost,
        this.commissionable,
        this.commissionType,
        this.commissionPerc,
        this.approved,
        this.approvedBy,
        this.approvedDate,
        this.enteredBy,
        this.taxGroupId,
        this.taxPercent,
        this.lockedBy,
        this.lockTs,
        this.isSerialLotItem,
        this.isWarrantyItem,
        this.warrantyPeriod,
        this.minimumQty,
        this.lastEditDate,
        this.creationDate,
        this.glitemFreightAccount,
        this.glitemHandlingAccount,
        this.allowPurchaseTrans,
        this.allowSalesTrans,
        this.allowInventoryTrans,
        this.toleranceLevel,
        this.branchCode,
        this.enforceQualityAssuranceOnPo,
        this.isPack,
        this.allowPack,
        this.minimumQtyForPacking,
        this.projectId,
    });

    final String? companyId;
    final String? divisionId;
    final String? departmentId;
    final String? itemId;
    final bool? isActive;
    final String? itemTypeId;
    final String? itemName;
    final String? itemDescription;
    final String? itemLongDescription;
    final String? itemCategoryId;
    final String? itemFamilyId;
    final dynamic salesDescription;
    final dynamic purchaseDescription;
    final dynamic pictureUrl;
    final dynamic largePictureUrl;
    final int? itemWeight;
    final int? itemWeightMetric;
    final int? itemShipWeight;
    final String? itemUpccode;
    final dynamic itemEpccode;
    final dynamic itemRfid;
    final dynamic itemSize;
    final dynamic itemSizeCmm;
    final dynamic itemDimentions;
    final dynamic itemDimentionsCmm;
    final dynamic itemColor;
    final dynamic itemNrfcolor;
    final dynamic itemStyle;
    final dynamic itemNrfstyle;
    final dynamic itemCareInstructions;
    final dynamic itemDefaultWarehouse;
    final dynamic itemDefaultWarehouseBin;
    final dynamic itemLocationX;
    final dynamic itemLocationY;
    final dynamic itemLocationZ;
    final dynamic downloadLocation;
    final dynamic downloadPassword;
    final String? itemUom;
    final String? glitemSalesAccount;
    final String? glitemCogsaccount;
    final String? glitemInventoryAccount;
    final dynamic packId;
    final dynamic currencyId;
    final dynamic currencyExchangeRate;
    final int? price;
    final String? itemPricingCode;
    final dynamic pricingMethods;
    final bool? taxable;
    final dynamic vendorId;
    final dynamic leadTime;
    final dynamic leadTimeUnit;
    final int? reOrderLevel;
    final int? reOrderQty;
    final dynamic buildTime;
    final dynamic buildTimeUnit;
    final dynamic useageRate;
    final dynamic useageRateUnit;
    final dynamic salesForecast;
    final dynamic salesForecastUnit;
    final dynamic calculatedCover;
    final dynamic calculatedCoverUnits;
    final bool? isAssembly;
    final dynamic itemAssembly;
    final int? lifo;
    final int? lifovalue;
    final int? lifocost;
    final int? average;
    final double? averageValue;
    final double? averageCost;
    final int? fifo;
    final int? fifovalue;
    final int? fifocost;
    final int? expected;
    final dynamic expectedValue;
    final dynamic expectedCost;
    final dynamic landed;
    final dynamic landedValue;
    final dynamic landedCost;
    final int? other;
    final dynamic otherValue;
    final dynamic otherCost;
    final bool? commissionable;
    final int? commissionType;
    final int? commissionPerc;
    final bool? approved;
    final dynamic approvedBy;
    final dynamic approvedDate;
    final String? enteredBy;
    final String? taxGroupId;
    final dynamic taxPercent;
    final dynamic lockedBy;
    final dynamic lockTs;
    final bool? isSerialLotItem;
    final bool? isWarrantyItem;
    final dynamic warrantyPeriod;
    final dynamic minimumQty;
    final DateTime? lastEditDate;
    final DateTime? creationDate;
    final dynamic glitemFreightAccount;
    final dynamic glitemHandlingAccount;
    final bool? allowPurchaseTrans;
    final bool? allowSalesTrans;
    final bool? allowInventoryTrans;
    final dynamic toleranceLevel;
    final dynamic branchCode;
    final dynamic enforceQualityAssuranceOnPo;
    final bool? isPack;
    final bool? allowPack;
    final dynamic minimumQtyForPacking;
    final dynamic projectId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        companyId: json["companyId"],
        divisionId: json["divisionId"],
        departmentId: json["departmentId"],
        itemId: json["itemId"],
        isActive: json["isActive"],
        itemTypeId: json["itemTypeId"],
        itemName: json["itemName"],
        itemDescription: json["itemDescription"],
        itemLongDescription: json["itemLongDescription"],
        itemCategoryId: json["itemCategoryId"],
        itemFamilyId: json["itemFamilyId"],
        salesDescription: json["salesDescription"],
        purchaseDescription: json["purchaseDescription"],
        pictureUrl: json["pictureUrl"],
        largePictureUrl: json["largePictureUrl"],
        itemWeight: json["itemWeight"],
        itemWeightMetric: json["itemWeightMetric"],
        itemShipWeight: json["itemShipWeight"],
        itemUpccode: json["itemUpccode"],
        itemEpccode: json["itemEpccode"],
        itemRfid: json["itemRfid"],
        itemSize: json["itemSize"],
        itemSizeCmm: json["itemSizeCmm"],
        itemDimentions: json["itemDimentions"],
        itemDimentionsCmm: json["itemDimentionsCmm"],
        itemColor: json["itemColor"],
        itemNrfcolor: json["itemNrfcolor"],
        itemStyle: json["itemStyle"],
        itemNrfstyle: json["itemNrfstyle"],
        itemCareInstructions: json["itemCareInstructions"],
        itemDefaultWarehouse: json["itemDefaultWarehouse"],
        itemDefaultWarehouseBin: json["itemDefaultWarehouseBin"],
        itemLocationX: json["itemLocationX"],
        itemLocationY: json["itemLocationY"],
        itemLocationZ: json["itemLocationZ"],
        downloadLocation: json["downloadLocation"],
        downloadPassword: json["downloadPassword"],
        itemUom: json["itemUom"],
        glitemSalesAccount: json["glitemSalesAccount"],
        glitemCogsaccount: json["glitemCogsaccount"],
        glitemInventoryAccount: json["glitemInventoryAccount"],
        packId: json["packId"],
        currencyId: json["currencyId"],
        currencyExchangeRate: json["currencyExchangeRate"],
        price: json["price"],
        itemPricingCode: json["itemPricingCode"],
        pricingMethods: json["pricingMethods"],
        taxable: json["taxable"],
        vendorId: json["vendorId"],
        leadTime: json["leadTime"],
        leadTimeUnit: json["leadTimeUnit"],
        reOrderLevel: json["reOrderLevel"],
        reOrderQty: json["reOrderQty"],
        buildTime: json["buildTime"],
        buildTimeUnit: json["buildTimeUnit"],
        useageRate: json["useageRate"],
        useageRateUnit: json["useageRateUnit"],
        salesForecast: json["salesForecast"],
        salesForecastUnit: json["salesForecastUnit"],
        calculatedCover: json["calculatedCover"],
        calculatedCoverUnits: json["calculatedCoverUnits"],
        isAssembly: json["isAssembly"],
        itemAssembly: json["itemAssembly"],
        lifo: json["lifo"],
        lifovalue: json["lifovalue"],
        lifocost: json["lifocost"],
        average: json["average"],
        averageValue: json["averageValue"]?.toDouble(),
        averageCost: json["averageCost"]?.toDouble(),
        fifo: json["fifo"],
        fifovalue: json["fifovalue"],
        fifocost: json["fifocost"],
        expected: json["expected"],
        expectedValue: json["expectedValue"],
        expectedCost: json["expectedCost"],
        landed: json["landed"],
        landedValue: json["landedValue"],
        landedCost: json["landedCost"],
        other: json["other"],
        otherValue: json["otherValue"],
        otherCost: json["otherCost"],
        commissionable: json["commissionable"],
        commissionType: json["commissionType"],
        commissionPerc: json["commissionPerc"],
        approved: json["approved"],
        approvedBy: json["approvedBy"],
        approvedDate: json["approvedDate"],
        enteredBy: json["enteredBy"],
        taxGroupId: json["taxGroupId"],
        taxPercent: json["taxPercent"],
        lockedBy: json["lockedBy"],
        lockTs: json["lockTs"],
        isSerialLotItem: json["isSerialLotItem"],
        isWarrantyItem: json["isWarrantyItem"],
        warrantyPeriod: json["warrantyPeriod"],
        minimumQty: json["minimumQty"],
        lastEditDate: json["lastEditDate"] == null ? null : DateTime.parse(json["lastEditDate"]),
        creationDate: json["creationDate"] == null ? null : DateTime.parse(json["creationDate"]),
        glitemFreightAccount: json["glitemFreightAccount"],
        glitemHandlingAccount: json["glitemHandlingAccount"],
        allowPurchaseTrans: json["allowPurchaseTrans"],
        allowSalesTrans: json["allowSalesTrans"],
        allowInventoryTrans: json["allowInventoryTrans"],
        toleranceLevel: json["toleranceLevel"],
        branchCode: json["branchCode"],
        enforceQualityAssuranceOnPo: json["enforceQualityAssuranceOnPo"],
        isPack: json["isPack"],
        allowPack: json["allowPack"],
        minimumQtyForPacking: json["minimumQtyForPacking"],
        projectId: json["projectId"],
    );

    Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "divisionId": divisionId,
        "departmentId": departmentId,
        "itemId": itemId,
        "isActive": isActive,
        "itemTypeId": itemTypeId,
        "itemName": itemName,
        "itemDescription": itemDescription,
        "itemLongDescription": itemLongDescription,
        "itemCategoryId": itemCategoryId,
        "itemFamilyId": itemFamilyId,
        "salesDescription": salesDescription,
        "purchaseDescription": purchaseDescription,
        "pictureUrl": pictureUrl,
        "largePictureUrl": largePictureUrl,
        "itemWeight": itemWeight,
        "itemWeightMetric": itemWeightMetric,
        "itemShipWeight": itemShipWeight,
        "itemUpccode": itemUpccode,
        "itemEpccode": itemEpccode,
        "itemRfid": itemRfid,
        "itemSize": itemSize,
        "itemSizeCmm": itemSizeCmm,
        "itemDimentions": itemDimentions,
        "itemDimentionsCmm": itemDimentionsCmm,
        "itemColor": itemColor,
        "itemNrfcolor": itemNrfcolor,
        "itemStyle": itemStyle,
        "itemNrfstyle": itemNrfstyle,
        "itemCareInstructions": itemCareInstructions,
        "itemDefaultWarehouse": itemDefaultWarehouse,
        "itemDefaultWarehouseBin": itemDefaultWarehouseBin,
        "itemLocationX": itemLocationX,
        "itemLocationY": itemLocationY,
        "itemLocationZ": itemLocationZ,
        "downloadLocation": downloadLocation,
        "downloadPassword": downloadPassword,
        "itemUom": itemUom,
        "glitemSalesAccount": glitemSalesAccount,
        "glitemCogsaccount": glitemCogsaccount,
        "glitemInventoryAccount": glitemInventoryAccount,
        "packId": packId,
        "currencyId": currencyId,
        "currencyExchangeRate": currencyExchangeRate,
        "price": price,
        "itemPricingCode": itemPricingCode,
        "pricingMethods": pricingMethods,
        "taxable": taxable,
        "vendorId": vendorId,
        "leadTime": leadTime,
        "leadTimeUnit": leadTimeUnit,
        "reOrderLevel": reOrderLevel,
        "reOrderQty": reOrderQty,
        "buildTime": buildTime,
        "buildTimeUnit": buildTimeUnit,
        "useageRate": useageRate,
        "useageRateUnit": useageRateUnit,
        "salesForecast": salesForecast,
        "salesForecastUnit": salesForecastUnit,
        "calculatedCover": calculatedCover,
        "calculatedCoverUnits": calculatedCoverUnits,
        "isAssembly": isAssembly,
        "itemAssembly": itemAssembly,
        "lifo": lifo,
        "lifovalue": lifovalue,
        "lifocost": lifocost,
        "average": average,
        "averageValue": averageValue,
        "averageCost": averageCost,
        "fifo": fifo,
        "fifovalue": fifovalue,
        "fifocost": fifocost,
        "expected": expected,
        "expectedValue": expectedValue,
        "expectedCost": expectedCost,
        "landed": landed,
        "landedValue": landedValue,
        "landedCost": landedCost,
        "other": other,
        "otherValue": otherValue,
        "otherCost": otherCost,
        "commissionable": commissionable,
        "commissionType": commissionType,
        "commissionPerc": commissionPerc,
        "approved": approved,
        "approvedBy": approvedBy,
        "approvedDate": approvedDate,
        "enteredBy": enteredBy,
        "taxGroupId": taxGroupId,
        "taxPercent": taxPercent,
        "lockedBy": lockedBy,
        "lockTs": lockTs,
        "isSerialLotItem": isSerialLotItem,
        "isWarrantyItem": isWarrantyItem,
        "warrantyPeriod": warrantyPeriod,
        "minimumQty": minimumQty,
        "lastEditDate": lastEditDate?.toIso8601String(),
        "creationDate": creationDate?.toIso8601String(),
        "glitemFreightAccount": glitemFreightAccount,
        "glitemHandlingAccount": glitemHandlingAccount,
        "allowPurchaseTrans": allowPurchaseTrans,
        "allowSalesTrans": allowSalesTrans,
        "allowInventoryTrans": allowInventoryTrans,
        "toleranceLevel": toleranceLevel,
        "branchCode": branchCode,
        "enforceQualityAssuranceOnPo": enforceQualityAssuranceOnPo,
        "isPack": isPack,
        "allowPack": allowPack,
        "minimumQtyForPacking": minimumQtyForPacking,
        "projectId": projectId,
    };
}
