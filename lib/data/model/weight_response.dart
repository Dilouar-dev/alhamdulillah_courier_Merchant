class WeightResponse {
  bool? status;
  String? message;
  List<Weight>? data;

  WeightResponse({this.status, this.message, this.data});

  WeightResponse.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Weight>[];
      json['data'].forEach((v) {
        data!.add(Weight.fromJson(v));
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

class Weight {
  int? id;
  String? title;
  int? indRe;
  int? indUr;
  int? outRe;
  int? outUr;
  int? subRe;
  int? subUr;
  int? indReC;
  int? subReC;
  int? outReC;
  int? insurance;
  int? cod;
  int? status;
  int? createBy;
  String? createdAt;
  String? updatedAt;

  Weight(
      {this.id,
      this.title,
      this.indRe,
      this.indUr,
      this.outRe,
      this.outUr,
      this.subRe,
      this.subUr,
      this.indReC,
      this.subReC,
      this.outReC,
      this.insurance,
      this.cod,
      this.status,
      this.createBy,
      this.createdAt,
      this.updatedAt});

  Weight.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    indRe = json['ind_Re'];
    indUr = json['ind_Ur'];
    outRe = json['out_Re'];
    outUr = json['out_Ur'];
    subRe = json['sub_Re'];
    subUr = json['sub_Ur'];
    indReC = json['ind_ReC'];
    subReC = json['sub_ReC'];
    outReC = json['out_ReC'];
    insurance = json['insurance'];
    cod = json['cod'];
    status = json['status'];
    createBy = json['create_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['ind_Re'] = indRe;
    data['ind_Ur'] = indUr;
    data['out_Re'] = outRe;
    data['out_Ur'] = outUr;
    data['sub_Re'] = subRe;
    data['sub_Ur'] = subUr;
    data['ind_ReC'] = indReC;
    data['sub_ReC'] = subReC;
    data['out_ReC'] = outReC;
    data['insurance'] = insurance;
    data['cod'] = cod;
    data['status'] = status;
    data['create_by'] = createBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
