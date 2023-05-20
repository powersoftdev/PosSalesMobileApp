

// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

CustomerInfo customerFromJson(String str) => CustomerInfo.fromJson(json.decode(str));

String customerToJson(CustomerInfo data) => json.encode(data.toJson());

class CustomerInfo {
    String? status;
    String? message;
    dynamic metadata;
    Info? data;
    dynamic authToken;

    CustomerInfo({
        this.status,
        this.message,
        this.metadata,
        this.data,
        this.authToken,
    });

    factory CustomerInfo.fromJson(Map<String, dynamic> json) => CustomerInfo(
        status: json["status"],
        message: json["message"],
        metadata: json["metadata"],
        data: json["data"] == null ? null : Info.fromJson(json["data"]),
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

class Info {
    String? companyId;
    String? divisionId;
    String? departmentId;
    String? customerId;
    String? accountStatus;
    String? customerName;
    String? customerAddress1;
    String? customerAddress2;
    String? customerAddress3;
    String? customerCity;
    String? customerState;
    dynamic customerZip;
    String? customerCountry;
    String? customerPhone;
    dynamic customerFax;
    String? customerEmail;
    dynamic customerWebPage;
    dynamic customerLogin;
    DateTime? customerPasswordDate;
    bool? customerPasswordExpires;
    dynamic customerPasswordExpiresDate;
    String? customerFirstName;
    dynamic customerLastName;
    dynamic customerSalutation;
    dynamic attention;
    String? customerTypeId;
    dynamic taxIdno;
    dynamic vattaxIdnumber;
    dynamic vatTaxOtherNumber;
    dynamic currencyId;
    String? glsalesAccount;
    String? termsId;
    String? termsStart;
    dynamic employeeId;
    String? taxGroupId;
    String? priceMatrix;
    DateTime? priceMatrixCurrent;
    dynamic creditRating;
   dynamic creditLimit;
    dynamic creditComments;
    dynamic paymentDay;
    dynamic approvalDate;
    dynamic customerSince;
    bool? sendCreditMemos;
    bool? sendDebitMemos;
    bool? statements;
    dynamic statementCycleCode;
    dynamic customerSpecialInstructions;
    String? customerShipToId;
    dynamic customerShipForId;
    dynamic shipMethodId;
    String? warehouseId;
    dynamic routingInfo1;
    dynamic routingInfo2;
    dynamic routingInfo3;
    dynamic routingInfoCurrent;
    dynamic freightPayment;
    bool? pickTicketsNeeded;
    bool? packingListNeeded;
    bool? specialLabelsNeeded;
    bool? customerItemCodes;
    bool? confirmBeforeShipping;
    bool? backorders;
    bool? useStoreNumbers;
    bool? useDepartmentNumbers;
    dynamic specialShippingInstructions;
    dynamic routingNotes;
    bool? applyRebate;
   dynamic rebateAmount;
    dynamic rebateGlaccount;
    dynamic rebateAmountNotes;
    bool? applyNewStore;
   dynamic newStoreDiscount;
    dynamic newStoreGlaccount;
    dynamic newStoreDiscountNotes;
    bool? applyWarehouse;
   dynamic warehouseAllowance;
    dynamic warehouseGlaccount;
    dynamic warehouseAllowanceNotes;
    bool? applyAdvertising;
   dynamic advertisingDiscount;
    dynamic advertisingGlaccount;
    dynamic advertisingDiscountNotes;
    bool? applyManualAdvert;
   dynamic manualAdvertising;
    dynamic manualAdvertisingGlaccount;
    dynamic manualAdvertisingNotes;
    bool? applyTrade;
   dynamic tradeDiscount;
    dynamic tradeDiscountGlaccount;
    dynamic tradeDiscountNotes;
    dynamic specialTerms;
    dynamic ediqualifier;
    dynamic ediid;
    dynamic editestQualifier;
    dynamic editestId;
    dynamic edicontactName;
    dynamic edicontactAgentFax;
    dynamic edicontactAgentPhone;
    dynamic edicontactAddressLine;
    bool? edipurchaseOrders;
    bool? ediinvoices;
    bool? edipayments;
    bool? ediorderStatus;
    bool? edishippingNotices;
    bool? approved;
    dynamic approvedBy;
    dynamic approvedDate;
    dynamic enteredBy;
    bool? convertedFromVendor;
    bool? convertedFromLead;
    dynamic customerRegionId;
    String? customerSourceId;
    String? customerIndustryId;
    bool? confirmed;
    dynamic firstContacted;
    dynamic lastFollowUp;
    dynamic nextFollowUp;
    bool? referedByExistingCustomer;
    dynamic referedBy;
    dynamic referedDate;
    dynamic referalUrl;
    bool? hot;
    dynamic primaryInterest;
    dynamic lockedBy;
    dynamic lockTs;
   dynamic accountBalance;
    dynamic branchCode;
    dynamic knowYourCustomer;
    dynamic smsalert;
    dynamic emailAlert;
    CustomerFinancials? customerFinancials;

    Info({
        this.companyId,
        this.divisionId,
        this.departmentId,
        this.customerId,
        this.accountStatus,
        this.customerName,
        this.customerAddress1,
        this.customerAddress2,
        this.customerAddress3,
        this.customerCity,
        this.customerState,
        this.customerZip,
        this.customerCountry,
        this.customerPhone,
        this.customerFax,
        this.customerEmail,
        this.customerWebPage,
        this.customerLogin,
        this.customerPasswordDate,
        this.customerPasswordExpires,
        this.customerPasswordExpiresDate,
        this.customerFirstName,
        this.customerLastName,
        this.customerSalutation,
        this.attention,
        this.customerTypeId,
        this.taxIdno,
        this.vattaxIdnumber,
        this.vatTaxOtherNumber,
        this.currencyId,
        this.glsalesAccount,
        this.termsId,
        this.termsStart,
        this.employeeId,
        this.taxGroupId,
        this.priceMatrix,
        this.priceMatrixCurrent,
        this.creditRating,
        this.creditLimit,
        this.creditComments,
        this.paymentDay,
        this.approvalDate,
        this.customerSince,
        this.sendCreditMemos,
        this.sendDebitMemos,
        this.statements,
        this.statementCycleCode,
        this.customerSpecialInstructions,
        this.customerShipToId,
        this.customerShipForId,
        this.shipMethodId,
        this.warehouseId,
        this.routingInfo1,
        this.routingInfo2,
        this.routingInfo3,
        this.routingInfoCurrent,
        this.freightPayment,
        this.pickTicketsNeeded,
        this.packingListNeeded,
        this.specialLabelsNeeded,
        this.customerItemCodes,
        this.confirmBeforeShipping,
        this.backorders,
        this.useStoreNumbers,
        this.useDepartmentNumbers,
        this.specialShippingInstructions,
        this.routingNotes,
        this.applyRebate,
        this.rebateAmount,
        this.rebateGlaccount,
        this.rebateAmountNotes,
        this.applyNewStore,
        this.newStoreDiscount,
        this.newStoreGlaccount,
        this.newStoreDiscountNotes,
        this.applyWarehouse,
        this.warehouseAllowance,
        this.warehouseGlaccount,
        this.warehouseAllowanceNotes,
        this.applyAdvertising,
        this.advertisingDiscount,
        this.advertisingGlaccount,
        this.advertisingDiscountNotes,
        this.applyManualAdvert,
        this.manualAdvertising,
        this.manualAdvertisingGlaccount,
        this.manualAdvertisingNotes,
        this.applyTrade,
        this.tradeDiscount,
        this.tradeDiscountGlaccount,
        this.tradeDiscountNotes,
        this.specialTerms,
        this.ediqualifier,
        this.ediid,
        this.editestQualifier,
        this.editestId,
        this.edicontactName,
        this.edicontactAgentFax,
        this.edicontactAgentPhone,
        this.edicontactAddressLine,
        this.edipurchaseOrders,
        this.ediinvoices,
        this.edipayments,
        this.ediorderStatus,
        this.edishippingNotices,
        this.approved,
        this.approvedBy,
        this.approvedDate,
        this.enteredBy,
        this.convertedFromVendor,
        this.convertedFromLead,
        this.customerRegionId,
        this.customerSourceId,
        this.customerIndustryId,
        this.confirmed,
        this.firstContacted,
        this.lastFollowUp,
        this.nextFollowUp,
        this.referedByExistingCustomer,
        this.referedBy,
        this.referedDate,
        this.referalUrl,
        this.hot,
        this.primaryInterest,
        this.lockedBy,
        this.lockTs,
        this.accountBalance,
        this.branchCode,
        this.knowYourCustomer,
        this.smsalert,
        this.emailAlert,
        this.customerFinancials,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        companyId: json["companyId"],
        divisionId: json["divisionId"],
        departmentId: json["departmentId"],
        customerId: json["customerId"],
        accountStatus: json["accountStatus"],
        customerName: json["customerName"] ?? "",
        customerAddress1: json["customerAddress1"] ?? "",
        customerAddress2: json["customerAddress2"] ?? "",
        customerAddress3: json["customerAddress3"] ?? "",
        customerCity: json["customerCity"] ?? "",
        customerState: json["customerState"] ?? "",
        customerZip: json["customerZip"] ?? "",
        customerCountry: json["customerCountry" ] ?? "",
        customerPhone: json["customerPhone"] ?? "",
        customerFax: json["customerFax"] ?? "",
        customerEmail: json["customerEmail"] ?? "",
        customerWebPage: json["customerWebPage"],
        customerLogin: json["customerLogin"],
        customerPasswordDate: json["customerPasswordDate"] == null ? null : DateTime.parse(json["customerPasswordDate"]),
        customerPasswordExpires: json["customerPasswordExpires"],
        customerPasswordExpiresDate: json["customerPasswordExpiresDate"],
        customerFirstName: json["customerFirstName"] ?? "",
        customerLastName: json["customerLastName"],
        customerSalutation: json["customerSalutation"],
        attention: json["attention"],
        customerTypeId: json["customerTypeId"],
        taxIdno: json["taxIdno"],
        vattaxIdnumber: json["vattaxIdnumber"],
        vatTaxOtherNumber: json["vatTaxOtherNumber"],
        currencyId: json["currencyId"],
        glsalesAccount: json["glsalesAccount"],
        termsId: json["termsId"],
        termsStart: json["termsStart"],
        employeeId: json["employeeId"],
        taxGroupId: json["taxGroupId"],
        priceMatrix: json["priceMatrix"],
        priceMatrixCurrent: json["priceMatrixCurrent"] == null ? null : DateTime.parse(json["priceMatrixCurrent"]),
        creditRating: json["creditRating"],
        creditLimit: json["creditLimit"],
        creditComments: json["creditComments"],
        paymentDay: json["paymentDay"],
        approvalDate: json["approvalDate"],
        customerSince: json["customerSince"],
        sendCreditMemos: json["sendCreditMemos"],
        sendDebitMemos: json["sendDebitMemos"],
        statements: json["statements"],
        statementCycleCode: json["statementCycleCode"],
        customerSpecialInstructions: json["customerSpecialInstructions"],
        customerShipToId: json["customerShipToId"],
        customerShipForId: json["customerShipForId"],
        shipMethodId: json["shipMethodId"],
        warehouseId: json["warehouseId"],
        routingInfo1: json["routingInfo1"],
        routingInfo2: json["routingInfo2"],
        routingInfo3: json["routingInfo3"],
        routingInfoCurrent: json["routingInfoCurrent"],
        freightPayment: json["freightPayment"],
        pickTicketsNeeded: json["pickTicketsNeeded"],
        packingListNeeded: json["packingListNeeded"],
        specialLabelsNeeded: json["specialLabelsNeeded"],
        customerItemCodes: json["customerItemCodes"],
        confirmBeforeShipping: json["confirmBeforeShipping"],
        backorders: json["backorders"],
        useStoreNumbers: json["useStoreNumbers"],
        useDepartmentNumbers: json["useDepartmentNumbers"],
        specialShippingInstructions: json["specialShippingInstructions"],
        routingNotes: json["routingNotes"],
        applyRebate: json["applyRebate"],
        rebateAmount: json["rebateAmount"],
        rebateGlaccount: json["rebateGlaccount"],
        rebateAmountNotes: json["rebateAmountNotes"],
        applyNewStore: json["applyNewStore"],
        newStoreDiscount: json["newStoreDiscount"],
        newStoreGlaccount: json["newStoreGlaccount"],
        newStoreDiscountNotes: json["newStoreDiscountNotes"],
        applyWarehouse: json["applyWarehouse"],
        warehouseAllowance: json["warehouseAllowance"],
        warehouseGlaccount: json["warehouseGlaccount"],
        warehouseAllowanceNotes: json["warehouseAllowanceNotes"],
        applyAdvertising: json["applyAdvertising"],
        advertisingDiscount: json["advertisingDiscount"],
        advertisingGlaccount: json["advertisingGlaccount"],
        advertisingDiscountNotes: json["advertisingDiscountNotes"],
        applyManualAdvert: json["applyManualAdvert"],
        manualAdvertising: json["manualAdvertising"],
        manualAdvertisingGlaccount: json["manualAdvertisingGlaccount"],
        manualAdvertisingNotes: json["manualAdvertisingNotes"],
        applyTrade: json["applyTrade"],
        tradeDiscount: json["tradeDiscount"],
        tradeDiscountGlaccount: json["tradeDiscountGlaccount"],
        tradeDiscountNotes: json["tradeDiscountNotes"],
        specialTerms: json["specialTerms"],
        ediqualifier: json["ediqualifier"],
        ediid: json["ediid"],
        editestQualifier: json["editestQualifier"],
        editestId: json["editestId"],
        edicontactName: json["edicontactName"],
        edicontactAgentFax: json["edicontactAgentFax"],
        edicontactAgentPhone: json["edicontactAgentPhone"],
        edicontactAddressLine: json["edicontactAddressLine"],
        edipurchaseOrders: json["edipurchaseOrders"],
        ediinvoices: json["ediinvoices"],
        edipayments: json["edipayments"],
        ediorderStatus: json["ediorderStatus"],
        edishippingNotices: json["edishippingNotices"],
        approved: json["approved"],
        approvedBy: json["approvedBy"],
        approvedDate: json["approvedDate"],
        enteredBy: json["enteredBy"],
        convertedFromVendor: json["convertedFromVendor"],
        convertedFromLead: json["convertedFromLead"],
        customerRegionId: json["customerRegionId"],
        customerSourceId: json["customerSourceId"],
        customerIndustryId: json["customerIndustryId"],
        confirmed: json["confirmed"],
        firstContacted: json["firstContacted"],
        lastFollowUp: json["lastFollowUp"],
        nextFollowUp: json["nextFollowUp"],
        referedByExistingCustomer: json["referedByExistingCustomer"],
        referedBy: json["referedBy"],
        referedDate: json["referedDate"],
        referalUrl: json["referalUrl"],
        hot: json["hot"],
        primaryInterest: json["primaryInterest"],
        lockedBy: json["lockedBy"],
        lockTs: json["lockTs"],
        accountBalance: json["accountBalance"] ?? 0,
        branchCode: json["branchCode"],
        knowYourCustomer: json["knowYourCustomer"],
        smsalert: json["smsalert"],
        emailAlert: json["emailAlert"],
        customerFinancials: json["customerFinancials"] == null ? null : CustomerFinancials.fromJson(json["customerFinancials"]),
    );

    Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "divisionId": divisionId,
        "departmentId": departmentId,
        "customerId": customerId,
        "accountStatus": accountStatus,
        "customerName": customerName,
        "customerAddress1": customerAddress1,
        "customerAddress2": customerAddress2,
        "customerAddress3": customerAddress3,
        "customerCity": customerCity,
        "customerState": customerState,
        "customerZip": customerZip,
        "customerCountry": customerCountry,
        "customerPhone": customerPhone,
        "customerFax": customerFax,
        "customerEmail": customerEmail,
        "customerWebPage": customerWebPage,
        "customerLogin": customerLogin,
        "customerPasswordDate": customerPasswordDate?.toIso8601String(),
        "customerPasswordExpires": customerPasswordExpires,
        "customerPasswordExpiresDate": customerPasswordExpiresDate,
        "customerFirstName": customerFirstName,
        "customerLastName": customerLastName,
        "customerSalutation": customerSalutation,
        "attention": attention,
        "customerTypeId": customerTypeId,
        "taxIdno": taxIdno,
        "vattaxIdnumber": vattaxIdnumber,
        "vatTaxOtherNumber": vatTaxOtherNumber,
        "currencyId": currencyId,
        "glsalesAccount": glsalesAccount,
        "termsId": termsId,
        "termsStart": termsStart,
        "employeeId": employeeId,
        "taxGroupId": taxGroupId,
        "priceMatrix": priceMatrix,
        "priceMatrixCurrent": priceMatrixCurrent?.toIso8601String(),
        "creditRating": creditRating,
        "creditLimit": creditLimit,
        "creditComments": creditComments,
        "paymentDay": paymentDay,
        "approvalDate": approvalDate,
        "customerSince": customerSince,
        "sendCreditMemos": sendCreditMemos,
        "sendDebitMemos": sendDebitMemos,
        "statements": statements,
        "statementCycleCode": statementCycleCode,
        "customerSpecialInstructions": customerSpecialInstructions,
        "customerShipToId": customerShipToId,
        "customerShipForId": customerShipForId,
        "shipMethodId": shipMethodId,
        "warehouseId": warehouseId,
        "routingInfo1": routingInfo1,
        "routingInfo2": routingInfo2,
        "routingInfo3": routingInfo3,
        "routingInfoCurrent": routingInfoCurrent,
        "freightPayment": freightPayment,
        "pickTicketsNeeded": pickTicketsNeeded,
        "packingListNeeded": packingListNeeded,
        "specialLabelsNeeded": specialLabelsNeeded,
        "customerItemCodes": customerItemCodes,
        "confirmBeforeShipping": confirmBeforeShipping,
        "backorders": backorders,
        "useStoreNumbers": useStoreNumbers,
        "useDepartmentNumbers": useDepartmentNumbers,
        "specialShippingInstructions": specialShippingInstructions,
        "routingNotes": routingNotes,
        "applyRebate": applyRebate,
        "rebateAmount": rebateAmount,
        "rebateGlaccount": rebateGlaccount,
        "rebateAmountNotes": rebateAmountNotes,
        "applyNewStore": applyNewStore,
        "newStoreDiscount": newStoreDiscount,
        "newStoreGlaccount": newStoreGlaccount,
        "newStoreDiscountNotes": newStoreDiscountNotes,
        "applyWarehouse": applyWarehouse,
        "warehouseAllowance": warehouseAllowance,
        "warehouseGlaccount": warehouseGlaccount,
        "warehouseAllowanceNotes": warehouseAllowanceNotes,
        "applyAdvertising": applyAdvertising,
        "advertisingDiscount": advertisingDiscount,
        "advertisingGlaccount": advertisingGlaccount,
        "advertisingDiscountNotes": advertisingDiscountNotes,
        "applyManualAdvert": applyManualAdvert,
        "manualAdvertising": manualAdvertising,
        "manualAdvertisingGlaccount": manualAdvertisingGlaccount,
        "manualAdvertisingNotes": manualAdvertisingNotes,
        "applyTrade": applyTrade,
        "tradeDiscount": tradeDiscount,
        "tradeDiscountGlaccount": tradeDiscountGlaccount,
        "tradeDiscountNotes": tradeDiscountNotes,
        "specialTerms": specialTerms,
        "ediqualifier": ediqualifier,
        "ediid": ediid,
        "editestQualifier": editestQualifier,
        "editestId": editestId,
        "edicontactName": edicontactName,
        "edicontactAgentFax": edicontactAgentFax,
        "edicontactAgentPhone": edicontactAgentPhone,
        "edicontactAddressLine": edicontactAddressLine,
        "edipurchaseOrders": edipurchaseOrders,
        "ediinvoices": ediinvoices,
        "edipayments": edipayments,
        "ediorderStatus": ediorderStatus,
        "edishippingNotices": edishippingNotices,
        "approved": approved,
        "approvedBy": approvedBy,
        "approvedDate": approvedDate,
        "enteredBy": enteredBy,
        "convertedFromVendor": convertedFromVendor,
        "convertedFromLead": convertedFromLead,
        "customerRegionId": customerRegionId,
        "customerSourceId": customerSourceId,
        "customerIndustryId": customerIndustryId,
        "confirmed": confirmed,
        "firstContacted": firstContacted,
        "lastFollowUp": lastFollowUp,
        "nextFollowUp": nextFollowUp,
        "referedByExistingCustomer": referedByExistingCustomer,
        "referedBy": referedBy,
        "referedDate": referedDate,
        "referalUrl": referalUrl,
        "hot": hot,
        "primaryInterest": primaryInterest,
        "lockedBy": lockedBy,
        "lockTs": lockTs,
        "accountBalance": accountBalance,
        "branchCode": branchCode,
        "knowYourCustomer": knowYourCustomer,
        "smsalert": smsalert,
        "emailAlert": emailAlert,
        "customerFinancials": customerFinancials?.toJson(),
    };
}

class CustomerFinancials {
    String? companyId;
    String? divisionId;
    String? departmentId;
    String? customerId;
   dynamic availibleCredit;
   dynamic lateDays;
   dynamic averageDaytoPay;
    DateTime? lastPaymentDate;
   dynamic lastPaymentAmount;
   dynamic highestCredit;
   dynamic highestBalance;
   dynamic promptPerc;
   dynamic bookedOrders;
   dynamic advertisingDollars;
   dynamic totalAr;
   dynamic currentArbalance;
   dynamic under30;
   dynamic over30;
   dynamic over60;
   dynamic over90;
   dynamic over120;
   dynamic over150;
   dynamic over180;
   dynamic salesYtd;
    dynamic salesLastYear;
   dynamic salesLifetime;
    DateTime? lastSalesDate;
    dynamic paymentsLastYear;
   dynamic paymentsLifetime;
   dynamic paymentsYtd;
   dynamic writeOffsYtd;
   dynamic writeOffsLastYear;
   dynamic writeOffsLifetime;
   dynamic invoicesYtd;
    dynamic invoicesLastYear;
   dynamic invoicesLifetime;
   dynamic creditMemos;
    dynamic lastCreditMemoDate;
    dynamic creditMemosYtd;
    dynamic creditMemosLastYear;
    dynamic creditMemosLifetime;
   dynamic rmas;
    DateTime? lastRmadate;
   dynamic rmasYtd;
    dynamic rmasLastYear;
   dynamic rmasLifetime;
    dynamic lockedBy;
    dynamic lockTs;
    dynamic branchCode;

    CustomerFinancials({
        this.companyId,
        this.divisionId,
        this.departmentId,
        this.customerId,
        this.availibleCredit,
        this.lateDays,
        this.averageDaytoPay,
        this.lastPaymentDate,
        this.lastPaymentAmount,
        this.highestCredit,
        this.highestBalance,
        this.promptPerc,
        this.bookedOrders,
        this.advertisingDollars,
        this.totalAr,
        this.currentArbalance,
        this.under30,
        this.over30,
        this.over60,
        this.over90,
        this.over120,
        this.over150,
        this.over180,
        this.salesYtd,
        this.salesLastYear,
        this.salesLifetime,
        this.lastSalesDate,
        this.paymentsLastYear,
        this.paymentsLifetime,
        this.paymentsYtd,
        this.writeOffsYtd,
        this.writeOffsLastYear,
        this.writeOffsLifetime,
        this.invoicesYtd,
        this.invoicesLastYear,
        this.invoicesLifetime,
        this.creditMemos,
        this.lastCreditMemoDate,
        this.creditMemosYtd,
        this.creditMemosLastYear,
        this.creditMemosLifetime,
        this.rmas,
        this.lastRmadate,
        this.rmasYtd,
        this.rmasLastYear,
        this.rmasLifetime,
        this.lockedBy,
        this.lockTs,
        this.branchCode,
    });

    factory CustomerFinancials.fromJson(Map<String, dynamic> json) => CustomerFinancials(
        companyId: json["companyId"],
        divisionId: json["divisionId"],
        departmentId: json["departmentId"],
        customerId: json["customerId"],
        availibleCredit: json["availibleCredit"] ?? 0.0,
        lateDays: json["lateDays"],
        averageDaytoPay: json["averageDaytoPay"],
        lastPaymentDate: json["lastPaymentDate"] == null ? null : DateTime.parse(json["lastPaymentDate"]),
        lastPaymentAmount: json["lastPaymentAmount"],
        highestCredit: json["highestCredit"],
        highestBalance: json["highestBalance"],
        promptPerc: json["promptPerc"],
        bookedOrders: json["bookedOrders"],
        advertisingDollars: json["advertisingDollars"],
        totalAr: json["totalAr"],
        currentArbalance: json["currentArbalance"],
        under30: json["under30"],
        over30: json["over30"],
        over60: json["over60"],
        over90: json["over90"],
        over120: json["over120"],
        over150: json["over150"],
        over180: json["over180"],
        salesYtd: json["salesYtd"],
        salesLastYear: json["salesLastYear"],
        salesLifetime: json["salesLifetime"],
        lastSalesDate: json["lastSalesDate"] == null ? null : DateTime.parse(json["lastSalesDate"]),
        paymentsLastYear: json["paymentsLastYear"],
        paymentsLifetime: json["paymentsLifetime"],
        paymentsYtd: json["paymentsYtd"],
        writeOffsYtd: json["writeOffsYtd"],
        writeOffsLastYear: json["writeOffsLastYear"],
        writeOffsLifetime: json["writeOffsLifetime"],
        invoicesYtd: json["invoicesYtd"],
        invoicesLastYear: json["invoicesLastYear"],
        invoicesLifetime: json["invoicesLifetime"],
        creditMemos: json["creditMemos"],
        lastCreditMemoDate: json["lastCreditMemoDate"],
        creditMemosYtd: json["creditMemosYtd"],
        creditMemosLastYear: json["creditMemosLastYear"],
        creditMemosLifetime: json["creditMemosLifetime"],
        rmas: json["rmas"],
        lastRmadate: json["lastRmadate"] == null ? null : DateTime.parse(json["lastRmadate"]),
        rmasYtd: json["rmasYtd"],
        rmasLastYear: json["rmasLastYear"],
        rmasLifetime: json["rmasLifetime"],
        lockedBy: json["lockedBy"],
        lockTs: json["lockTs"],
        branchCode: json["branchCode"],
    );

    Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "divisionId": divisionId,
        "departmentId": departmentId,
        "customerId": customerId,
        "availibleCredit": availibleCredit,
        "lateDays": lateDays,
        "averageDaytoPay": averageDaytoPay,
        "lastPaymentDate": lastPaymentDate?.toIso8601String(),
        "lastPaymentAmount": lastPaymentAmount,
        "highestCredit": highestCredit,
        "highestBalance": highestBalance,
        "promptPerc": promptPerc,
        "bookedOrders": bookedOrders,
        "advertisingDollars": advertisingDollars,
        "totalAr": totalAr,
        "currentArbalance": currentArbalance,
        "under30": under30,
        "over30": over30,
        "over60": over60,
        "over90": over90,
        "over120": over120,
        "over150": over150,
        "over180": over180,
        "salesYtd": salesYtd,
        "salesLastYear": salesLastYear,
        "salesLifetime": salesLifetime,
        "lastSalesDate": lastSalesDate?.toIso8601String(),
        "paymentsLastYear": paymentsLastYear,
        "paymentsLifetime": paymentsLifetime,
        "paymentsYtd": paymentsYtd,
        "writeOffsYtd": writeOffsYtd,
        "writeOffsLastYear": writeOffsLastYear,
        "writeOffsLifetime": writeOffsLifetime,
        "invoicesYtd": invoicesYtd,
        "invoicesLastYear": invoicesLastYear,
        "invoicesLifetime": invoicesLifetime,
        "creditMemos": creditMemos,
        "lastCreditMemoDate": lastCreditMemoDate,
        "creditMemosYtd": creditMemosYtd,
        "creditMemosLastYear": creditMemosLastYear,
        "creditMemosLifetime": creditMemosLifetime,
        "rmas": rmas,
        "lastRmadate": lastRmadate?.toIso8601String(),
        "rmasYtd": rmasYtd,
        "rmasLastYear": rmasLastYear,
        "rmasLifetime": rmasLifetime,
        "lockedBy": lockedBy,
        "lockTs": lockTs,
        "branchCode": branchCode,
    };
}

