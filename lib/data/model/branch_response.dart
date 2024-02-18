class BranchResponse {
  bool? status;
  String? message;
  List<Branch>? data;

  BranchResponse({this.status, this.message, this.data});

  BranchResponse.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Branch>[];
      json['data'].forEach((v) {
        data!.add(Branch.fromJson(v));
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

class Branch {
  int? id;
  String? name;
  int? districtId;
  int? status;
  int? ceateBy;
  String? createdAt;
  String? updatedAt;

  Branch(
      {this.id,
      this.name,
      this.districtId,
      this.status,
      this.ceateBy,
      this.createdAt,
      this.updatedAt});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    districtId = json['district_id'];
    status = json['status'];
    ceateBy = json['ceate_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['district_id'] = districtId;
    data['status'] = status;
    data['ceate_by'] = ceateBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
