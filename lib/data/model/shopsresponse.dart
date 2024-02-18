class ShopsResponse {
  bool? status;
  String? message;
  List<Shop>? data;

  ShopsResponse({this.status, this.message, this.data});

  ShopsResponse.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Shop>[];
      json['data'].forEach((v) {
        data!.add(Shop.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Shop {
  int? id;
  int? userId;
  String? shopName;
  String? shopPhone;
  String? shopArea;
  int? zoneId;
  String? shopAddress;
  String? pickupAddress;
  String? shopLink;
  int? status;
  String? createdAt;
  String? updatedAt;

  Shop(
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
      this.updatedAt});

  Shop.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
