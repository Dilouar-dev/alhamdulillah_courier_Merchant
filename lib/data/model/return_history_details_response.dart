class ReturnHistoryDetailsResponse {
  List<ROrder>? orders;
  bool? status;
  String? message;

  ReturnHistoryDetailsResponse({this.orders, this.status, this.message});

  ReturnHistoryDetailsResponse.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <ROrder>[];
      json['orders'].forEach((v) {
        orders!.add(ROrder.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class ROrder {
  int? id;
  int? userId;
  String? trackingId;
  String? orderId;
  String? customerName;
  dynamic customerEmail;
  String? customerPhone;
  String? customerAddress;
  String? shop;
  String? area;
  int? shopId;
  int? areaId;
  String? category;
  String? product;
  String? weight;
  int? collection;
  dynamic pickupDate;
  dynamic pickupTime;
  String? remarks;
  int? inside;
  String? district;
  dynamic deliveryNote;
  dynamic deliveryDate;
  String? type;
  String? status;
  int? isPartial;
  dynamic securityCode;
  String? createdAt;
  String? updatedAt;
  int? colection;
  int? delivery;
  int? insurance;
  int? cod;
  int? merchantPay;
  int? collect;
  int? returnCharge;
  int? pStatus;

  ROrder(
      {this.id,
      this.userId,
      this.trackingId,
      this.orderId,
      this.customerName,
      this.customerEmail,
      this.customerPhone,
      this.customerAddress,
      this.shop,
      this.area,
      this.shopId,
      this.areaId,
      this.category,
      this.product,
      this.weight,
      this.collection,
      this.pickupDate,
      this.pickupTime,
      this.remarks,
      this.inside,
      this.district,
      this.deliveryNote,
      this.deliveryDate,
      this.type,
      this.status,
      this.isPartial,
      this.securityCode,
      this.createdAt,
      this.updatedAt,
      this.colection,
      this.delivery,
      this.insurance,
      this.cod,
      this.merchantPay,
      this.collect,
      this.returnCharge,
      this.pStatus});

  ROrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    trackingId = json['tracking_id'];
    orderId = json['order_id'];
    customerName = json['customer_name'];
    customerEmail = json['customer_email'];
    customerPhone = json['customer_phone'];
    customerAddress = json['customer_address'];
    shop = json['shop'];
    area = json['area'];
    shopId = json['shop_id'];
    areaId = json['area_id'];
    category = json['category'];
    product = json['product'];
    weight = json['weight'];
    collection = json['collection'];
    pickupDate = json['pickup_date'];
    pickupTime = json['pickup_time'];
    remarks = json['remarks'];
    inside = json['inside'];
    district = json['district'];
    deliveryNote = json['delivery_note'];
    deliveryDate = json['delivery_date'];
    type = json['type'];
    status = json['status'];
    isPartial = json['isPartial'];
    securityCode = json['security_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    colection = json['colection'];
    delivery = json['delivery'];
    insurance = json['insurance'];
    cod = json['cod'];
    merchantPay = json['merchant_pay'];
    collect = json['collect'];
    returnCharge = json['return_charge'];
    pStatus = json['p_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['tracking_id'] = trackingId;
    data['order_id'] = orderId;
    data['customer_name'] = customerName;
    data['customer_email'] = customerEmail;
    data['customer_phone'] = customerPhone;
    data['customer_address'] = customerAddress;
    data['shop'] = shop;
    data['area'] = area;
    data['shop_id'] = shopId;
    data['area_id'] = areaId;
    data['category'] = category;
    data['product'] = product;
    data['weight'] = weight;
    data['collection'] = collection;
    data['pickup_date'] = pickupDate;
    data['pickup_time'] = pickupTime;
    data['remarks'] = remarks;
    data['inside'] = inside;
    data['district'] = district;
    data['delivery_note'] = deliveryNote;
    data['delivery_date'] = deliveryDate;
    data['type'] = type;
    data['status'] = status;
    data['isPartial'] = isPartial;
    data['security_code'] = securityCode;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['colection'] = colection;
    data['delivery'] = delivery;
    data['insurance'] = insurance;
    data['cod'] = cod;
    data['merchant_pay'] = merchantPay;
    data['collect'] = collect;
    data['return_charge'] = returnCharge;
    data['p_status'] = pStatus;
    return data;
  }
}
