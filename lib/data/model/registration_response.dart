class RegistrationResponse {
  bool? success;
  Token? token;
  User? user;
  String? message;

  RegistrationResponse({this.success, this.token, this.user, this.message});

  RegistrationResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (token != null) {
      data['token'] = token!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Token {
  String? token;

  Token({this.token});

  Token.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
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
  dynamic districtId;
  int? zoneId;
  String? businessName;
  dynamic district;
  String? area;
  dynamic mCod;
  dynamic mDiscount;
  int? urDiscount;
  dynamic mInsurance;
  int? mReturnDiscount;
  int? createdBy;
  dynamic bType;

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
