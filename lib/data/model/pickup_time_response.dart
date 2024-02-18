class PickupTimeResponse {
  bool? status;
  String? message;
  List<PickupTime>? data;

  PickupTimeResponse({this.status, this.message, this.data});

  PickupTimeResponse.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PickupTime>[];
      json['data'].forEach((v) {
        data!.add(PickupTime.fromJson(v));
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

class PickupTime {
  int? id;
  String? pickUp;
  int? status;
  String? createdAt;
  String? updatedAt;

  PickupTime(
      {this.id, this.pickUp, this.status, this.createdAt, this.updatedAt});

  PickupTime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pickUp = json['pick_up'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pick_up'] = pickUp;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
