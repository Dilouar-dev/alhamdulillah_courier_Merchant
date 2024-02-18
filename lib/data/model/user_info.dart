class UserInfoResponse {
  User? user;
  Payment? payment;
  String? valid;
  bool? status;

  UserInfoResponse({this.user, this.payment, this.valid, this.status});

  UserInfoResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    payment =
        json['payment'] != null ? Payment.fromJson(json['payment']) : null;
    valid = json['valid'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (payment != null) {
      data['payment'] = payment!.toJson();
    }
    data['valid'] = valid;
    data['status'] = status;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? address;
  dynamic photo;
  int? role;
  dynamic emailVerifiedAt;
  dynamic otpCode;
  dynamic otpCreatedTime;
  int? isVerified;
  String? createdAt;
  String? updatedAt;
  int? userId;
  int? districtId;
  int? zoneId;
  String? businessName;
  String? district;
  String? area;
  int? mCod;
  int? mDiscount;
  int? urDiscount;
  int? mInsurance;
  int? mReturnDiscount;
  int? createdBy;
  String? bType;

  User(
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
      this.updatedAt,
      this.userId,
      this.districtId,
      this.zoneId,
      this.businessName,
      this.district,
      this.area,
      this.mCod,
      this.mDiscount,
      this.urDiscount,
      this.mInsurance,
      this.mReturnDiscount,
      this.createdBy,
      this.bType});

  User.fromJson(Map<String, dynamic> json) {
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
    userId = json['user_id'];
    districtId = json['district_id'];
    zoneId = json['zone_id'];
    businessName = json['business_name'];
    district = json['district'];
    area = json['area'];
    mCod = json['m_cod'];
    mDiscount = json['m_discount'];
    urDiscount = json['ur_discount'];
    mInsurance = json['m_insurance'];
    mReturnDiscount = json['m_return_discount'];
    createdBy = json['created_by'];
    bType = json['b_type'];
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
    data['user_id'] = userId;
    data['district_id'] = districtId;
    data['zone_id'] = zoneId;
    data['business_name'] = businessName;
    data['district'] = district;
    data['area'] = area;
    data['m_cod'] = mCod;
    data['m_discount'] = mDiscount;
    data['ur_discount'] = urDiscount;
    data['m_insurance'] = mInsurance;
    data['m_return_discount'] = mReturnDiscount;
    data['created_by'] = createdBy;
    data['b_type'] = bType;
    return data;
  }
}

class Payment {
  int? id;
  String? pType;
  int? userId;
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

  Payment(
      {this.id,
      this.pType,
      this.userId,
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

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pType = json['p_type'];
    userId = json['user_id'];
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
    data['p_type'] = pType;
    data['user_id'] = userId;
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
