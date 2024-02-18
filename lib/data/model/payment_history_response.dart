class PaymentHistoryResponse {
  List<Payment>? data;
  String? today;
  String? fromdate;

  PaymentHistoryResponse({this.data, this.today, this.fromdate});

  PaymentHistoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Payment>[];
      json['data'].forEach((v) {
        data!.add(Payment.fromJson(v));
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

class Payment {
  num? id;
  num? mId;
  num? mUserId;
  String? invoiceId;//////////////////////
  num? tPayable;/////////////////////////
  num? tCurrentDue;///////////////////////
  num? mPayId;
  String? status;/////////////////
  num? createdBy;
  num? updatedBy;
  String? createdAt;//////////////////////
  String? updatedAt;
  Creator? creator;

  Payment(
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
      this.updatedAt,
      this.creator});

  Payment.fromJson(Map<String, dynamic> json) {
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
    creator =
        json['creator'] != null ? Creator.fromJson(json['creator']) : null;
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
    if (creator != null) {
      data['creator'] = creator!.toJson();
    }
    return data;
  }
}

class Creator {
  num? id;
  String? name;
  String? email;
  String? mobile;
  String? address;
  dynamic photo;
  num? role;
  dynamic emailVerifiedAt;
  dynamic otpCode;
  dynamic otpCreatedTime;
  num? isVerified;
  String? createdAt;
  String? updatedAt;

  Creator(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.address,
      this.photo,
      this.role,
      this.emailVerifiedAt,
      this.otpCode,
      this.otpCreatedTime,
      this.isVerified,
      this.createdAt,
      this.updatedAt});

  Creator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    photo = json['photo'];
    role = json['role'];
    emailVerifiedAt = json['email_verified_at'];
    otpCode = json['otp_code'];
    otpCreatedTime = json['otp_created_time'];
    isVerified = json['is_verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['address'] = address;
    data['photo'] = photo;
    data['role'] = role;
    data['email_verified_at'] = emailVerifiedAt;
    data['otp_code'] = otpCode;
    data['otp_created_time'] = otpCreatedTime;
    data['is_verified'] = isVerified;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
