class DetailsHistoryPaymentResponse {
  MerchantPay? merchantPay;
  AdjInfo? adjInfo;
  PaymentInfo? paymentInfo;
  List<Order>? orders;
  num? tCollect;
  num? tCod;
  num? tInsurance;
  num? tDelivery;
  num? tReturnCharge;
  num? tPayable;
  bool? status;
  String? message;

  DetailsHistoryPaymentResponse(
      {this.merchantPay,
      this.adjInfo,
      this.paymentInfo,
      this.orders,
      this.tCollect,
      this.tCod,
      this.tInsurance,
      this.tDelivery,
      this.tReturnCharge,
      this.tPayable,
      this.status,
      this.message});

  DetailsHistoryPaymentResponse.fromJson(Map<String, dynamic> json) {
    merchantPay = json['merchantPay'] != null
        ? MerchantPay.fromJson(json['merchantPay'])
        : null;
    adjInfo =
        json['adjInfo'] != null ? AdjInfo.fromJson(json['adjInfo']) : null;
    paymentInfo = json['paymentInfo'] != null
        ? PaymentInfo.fromJson(json['paymentInfo'])
        : null;
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((v) {
        orders!.add(Order.fromJson(v));
      });
    }
    tCollect = json['tCollect'];
    tCod = json['tCod'];
    tInsurance = json['tInsurance'];
    tDelivery = json['tDelivery'];
    tReturnCharge = json['tReturnCharge'];
    tPayable = json['tPayable'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (merchantPay != null) {
      data['merchantPay'] = merchantPay!.toJson();
    }
    if (adjInfo != null) {
      data['adjInfo'] = adjInfo!.toJson();
    }
    if (paymentInfo != null) {
      data['paymentInfo'] = paymentInfo!.toJson();
    }
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    data['tCollect'] = tCollect;
    data['tCod'] = tCod;
    data['tInsurance'] = tInsurance;
    data['tDelivery'] = tDelivery;
    data['tReturnCharge'] = tReturnCharge;
    data['tPayable'] = tPayable;
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class MerchantPay {
  num? id;
  num? mId;
  num? mUserId;
  String? invoiceId;
  num? tPayable;
  num? tCurrentDue;
  num? mPayId;
  String? status;
  num? createdBy;
  num? updatedBy;
  String? createdAt;
  String? updatedAt;

  MerchantPay(
      {this.id,
      this.mId,
      this.mUserId,
      this.invoiceId,
      this.tPayable,
      this.tCurrentDue,
      this.mPayId,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  MerchantPay.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mId = json['m_id'];
    mUserId = json['m_user_id'];
    invoiceId = json['invoice_id'];
    tPayable = json['t_payable'];
    tCurrentDue = json['t_current_due'];
    mPayId = json['m_pay_id'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['m_id'] = mId;
    data['m_user_id'] = mUserId;
    data['invoice_id'] = invoiceId;
    data['t_payable'] = tPayable;
    data['t_current_due'] = tCurrentDue;
    data['m_pay_id'] = mPayId;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class AdjInfo {
  num? id;
  num? mId;
  num? pAmount;
  String? invoiceId;
  String? createdAt;
  String? updatedAt;

  AdjInfo(
      {this.id,
      this.mId,
      this.pAmount,
      this.invoiceId,
      this.createdAt,
      this.updatedAt});

  AdjInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mId = json['m_id'];
    pAmount = json['p_amount'];
    invoiceId = json['invoice_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['m_id'] = mId;
    data['p_amount'] = pAmount;
    data['invoice_id'] = invoiceId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class PaymentInfo {
  num? id;
  String? invoiceId;
  String? pType;
  num? mId;
  String? bankName;
  String? branchName;
  String? accountHolderName;
  String? accountType;
  String? accountNumber;
  String? routingNumber;
  String? createdAt;
  String? updatedAt;
  String? mbName;
  String? mbType;
  String? mbNumber;

  PaymentInfo(
      {this.id,
      this.invoiceId,
      this.pType,
      this.mId,
      this.bankName,
      this.branchName,
      this.accountHolderName,
      this.accountType,
      this.accountNumber,
      this.routingNumber,
      this.createdAt,
      this.updatedAt,
      this.mbName,
      this.mbType,
      this.mbNumber});

  PaymentInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoiceId = json['invoice_id'];
    pType = json['p_type'];
    mId = json['m_id'];
    bankName = json['bank_name'];
    branchName = json['branch_name'];
    accountHolderName = json['account_holder_name'];
    accountType = json['account_type'];
    accountNumber = json['account_number'];
    routingNumber = json['routing_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mbName = json['mb_name'];
    mbType = json['mb_type'];
    mbNumber = json['mb_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['invoice_id'] = invoiceId;
    data['p_type'] = pType;
    data['m_id'] = mId;
    data['bank_name'] = bankName;
    data['branch_name'] = branchName;
    data['account_holder_name'] = accountHolderName;
    data['account_type'] = accountType;
    data['account_number'] = accountNumber;
    data['routing_number'] = routingNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['mb_name'] = mbName;
    data['mb_type'] = mbType;
    data['mb_number'] = mbNumber;
    return data;
  }
}

class Order {
  String? shop;
  num? id;
  String? trackingId;
  num? colection;
  num? delivery;
  num? insurance;
  num? cod;
  num? merchantPay;
  num? collect;
  num? returnCharge;
  String? createdAt;
  String? updatedAt;
  String? merchant;

  Order(
      {this.shop,
      this.id,
      this.trackingId,
      this.colection,
      this.delivery,
      this.insurance,
      this.cod,
      this.merchantPay,
      this.collect,
      this.returnCharge,
      this.createdAt,
      this.updatedAt,
      this.merchant});

  Order.fromJson(Map<String, dynamic> json) {
    shop = json['shop'];
    id = json['id'];
    trackingId = json['tracking_id'];
    colection = json['colection'];
    delivery = json['delivery'];
    insurance = json['insurance'];
    cod = json['cod'];
    merchantPay = json['merchant_pay'];
    collect = json['collect'];
    returnCharge = json['return_charge'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    merchant = json['merchant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shop'] = shop;
    data['id'] = id;
    data['tracking_id'] = trackingId;
    data['colection'] = colection;
    data['delivery'] = delivery;
    data['insurance'] = insurance;
    data['cod'] = cod;
    data['merchant_pay'] = merchantPay;
    data['collect'] = collect;
    data['return_charge'] = returnCharge;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['merchant'] = merchant;
    return data;
  }
}
