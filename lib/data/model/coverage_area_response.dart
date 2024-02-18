import 'package:flutter/src/material/dropdown.dart';

class CoverageAreaResponse {
  bool? status;
  String? message;
  List<CoverageArea>? data;

  CoverageAreaResponse({this.status, this.message, this.data});

  CoverageAreaResponse.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CoverageArea>[];
      json['data'].forEach((v) {
        data!.add(CoverageArea.fromJson(v));
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

class CoverageArea {
  int? id;
  int? inside;
  String? zoneName;
  String? district;
  String? area;
  // String area = '';
  int? districtId;
  int? zoneId;
  dynamic postCode;
  dynamic hDelivery;
  dynamic oneRe;
  dynamic oneUr;
  dynamic plusRe;
  dynamic plusUr;
  dynamic cod;
  dynamic insurance;
  String? createdAt;
  String? updatedAt;

  CoverageArea(
      {this.id,
      this.inside,
      this.zoneName,
      this.district,
      this.area,
      this.districtId,
      this.zoneId,
      this.postCode,
      this.hDelivery,
      this.oneRe,
      this.oneUr,
      this.plusRe,
      this.plusUr,
      this.cod,
      this.insurance,
      this.createdAt,
      this.updatedAt});

  CoverageArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inside = json['inside'];
    zoneName = json['zone_name'];
    // area = json['area'];
    district = json['name'];
    area = json['area'];
    districtId = json['district_id'];
    zoneId = json['zone_id'];
    postCode = json['post_code'];
    hDelivery = json['h_delivery'];
    oneRe = json['oneRe'];
    oneUr = json['oneUr'];
    plusRe = json['plusRe'];
    plusUr = json['plusUr'];
    cod = json['cod'];
    insurance = json['insurance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['inside'] = inside;
    data['zone_name'] = zoneName;
    // data['district'] = district;
    data['name'] = district;

    data['area'] = area;
    data['district_id'] = districtId;
    data['zone_id'] = zoneId;
    data['post_code'] = postCode;
    data['h_delivery'] = hDelivery;
    data['oneRe'] = oneRe;
    data['oneUr'] = oneUr;
    data['plusRe'] = plusRe;
    data['plusUr'] = plusUr;
    data['cod'] = cod;
    data['insurance'] = insurance;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

}
