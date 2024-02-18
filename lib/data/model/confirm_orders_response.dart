class ConfirmOrdersResponse {
  List<Order>? data;
  String? today;
  String? fromdate;

  ConfirmOrdersResponse({this.data, this.today, this.fromdate});

  ConfirmOrdersResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Order>[];
      json['data'].forEach((v) {
        data!.add(Order.fromJson(v));
      });
    }
    today = json['today'];
    fromdate = json['fromdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['today'] = today;
    data['fromdate'] = fromdate;
    return data;
  }
}

class Order {
  int? id;
  int? userId;
  String? shopName;
  String? shopPhone;
  String? shopArea;
  int? zoneId;
  String? shopAddress;
  String? pickupAddress;
  dynamic shopLink;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? trackingId;
  dynamic orderId;
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
  String? pickupDate;
  String? pickupTime;
  String? remarks;
  int? inside;
  String? district;
  int? districtId;
  dynamic deliveryNote;
  dynamic deliveryDate;
  String? type;
  int? isPartial;
  dynamic securityCode;
  dynamic colection;
  dynamic delivery;
  dynamic insurance;
  dynamic cod;
  dynamic merchantPay;
  dynamic collect;
  dynamic returnCharge;

  Order(
      {this.id,
      this.userId,
      this.shopName,
      this.shopPhone,
      this.shopArea,
      this.zoneId,
      this.shopAddress,
      this.pickupAddress,
      this.shopLink,
      this.status,
      this.createdAt,
      this.updatedAt,
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
      this.districtId,
      this.deliveryNote,
      this.deliveryDate,
      this.type,
      this.isPartial,
      this.securityCode,
      this.colection,
      this.delivery,
      this.insurance,
      this.cod,
      this.merchantPay,
      this.collect,
      this.returnCharge});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    shopName = json['shop_name'];
    shopPhone = json['shop_phone'];
    shopArea = json['shop_area'];
    zoneId = json['zone_id'];
    shopAddress = json['shop_address'];
    pickupAddress = json['pickup_address'];
    shopLink = json['shop_link'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    isPartial = json['isPartial'];
    securityCode = json['security_code'];
    colection = json['colection'];
    delivery = json['delivery'];
    insurance = json['insurance'];
    cod = json['cod'];
    merchantPay = json['merchant_pay'];
    collect = json['collect'];
    returnCharge = json['return_charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['shop_name'] = shopName;
    data['shop_phone'] = shopPhone;
    data['shop_area'] = shopArea;
    data['zone_id'] = zoneId;
    data['shop_address'] = shopAddress;
    data['pickup_address'] = pickupAddress;
    data['shop_link'] = shopLink;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    data['isPartial'] = isPartial;
    data['security_code'] = securityCode;
    data['colection'] = colection;
    data['delivery'] = delivery;
    data['insurance'] = insurance;
    data['cod'] = cod;
    data['merchant_pay'] = merchantPay;
    data['collect'] = collect;
    data['return_charge'] = returnCharge;
    return data;
  }
}
