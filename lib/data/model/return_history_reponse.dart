class ReturnHistoryResponse {
  List<ReturnOrder>? data;
  String? today;
  String? fromdate;

  ReturnHistoryResponse({this.data, this.today, this.fromdate});

  ReturnHistoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ReturnOrder>[];
      json['data'].forEach((v) {
        data!.add(new ReturnOrder.fromJson(v));
      });
    }
    today = json['today'];
    fromdate = json['fromdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['today'] = this.today;
    data['fromdate'] = this.fromdate;
    return data;
  }
}

class ReturnOrder {
  int? id;
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
  String? createdAt;
  String? updatedAt;
  String? name;
  String? email;
  String? mobile;
  String? address;
  Null? photo;
  int? role;
  Null? emailVerifiedAt;
  String? password;
  Null? otpCode;
  Null? otpCreatedTime;
  String? rememberToken;
  int? isVerified;
  String? invoiceId;
  String? merchantId;
  String? shop;
  int? riderId;
  String? status;
  int? securityCode;
  int? createBy;
  Null? updateBy;
  int? tCollect;
  Creator? creator;
  Rider? rider;
  Null? updator;
  Creator? merchant;

  ReturnOrder(
      {this.id,
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
        this.bType,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.email,
        this.mobile,
        this.address,
        this.photo,
        this.role,
        this.emailVerifiedAt,
        this.password,
        this.otpCode,
        this.otpCreatedTime,
        this.rememberToken,
        this.isVerified,
        this.invoiceId,
        this.merchantId,
        this.shop,
        this.riderId,
        this.status,
        this.securityCode,
        this.createBy,
        this.updateBy,
        this.tCollect,
        this.creator,
        this.rider,
        this.updator,
        this.merchant});

  ReturnOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    photo = json['photo'];
    role = json['role'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    otpCode = json['otp_code'];
    otpCreatedTime = json['otp_created_time'];
    rememberToken = json['remember_token'];
    isVerified = json['is_verified'];
    invoiceId = json['invoice_id'];
    merchantId = json['merchant_id'];
    shop = json['shop'];
    riderId = json['rider_id'];
    status = json['status'];
    securityCode = json['security_code'];
    createBy = json['create_by'];
    updateBy = json['update_by'];
    tCollect = json['t_collect'];
    creator =
    json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
    rider = json['rider'] != null ? new Rider.fromJson(json['rider']) : null;
    updator = json['updator'];
    merchant = json['merchant'] != null
        ? new Creator.fromJson(json['merchant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['district_id'] = this.districtId;
    data['zone_id'] = this.zoneId;
    data['business_name'] = this.businessName;
    data['district'] = this.district;
    data['area'] = this.area;
    data['m_cod'] = this.mCod;
    data['m_discount'] = this.mDiscount;
    data['ur_discount'] = this.urDiscount;
    data['m_insurance'] = this.mInsurance;
    data['m_return_discount'] = this.mReturnDiscount;
    data['created_by'] = this.createdBy;
    data['b_type'] = this.bType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['photo'] = this.photo;
    data['role'] = this.role;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['otp_code'] = this.otpCode;
    data['otp_created_time'] = this.otpCreatedTime;
    data['remember_token'] = this.rememberToken;
    data['is_verified'] = this.isVerified;
    data['invoice_id'] = this.invoiceId;
    data['merchant_id'] = this.merchantId;
    data['shop'] = this.shop;
    data['rider_id'] = this.riderId;
    data['status'] = this.status;
    data['security_code'] = this.securityCode;
    data['create_by'] = this.createBy;
    data['update_by'] = this.updateBy;
    data['t_collect'] = this.tCollect;
    if (this.creator != null) {
      data['creator'] = this.creator!.toJson();
    }
    if (this.rider != null) {
      data['rider'] = this.rider!.toJson();
    }
    data['updator'] = this.updator;
    if (this.merchant != null) {
      data['merchant'] = this.merchant!.toJson();
    }
    return data;
  }
}

class Creator {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? address;
  Null? photo;
  int? role;
  Null? emailVerifiedAt;
  Null? otpCode;
  Null? otpCreatedTime;
  int? isVerified;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['photo'] = this.photo;
    data['role'] = this.role;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['otp_code'] = this.otpCode;
    data['otp_created_time'] = this.otpCreatedTime;
    data['is_verified'] = this.isVerified;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Rider {
  int? id;
  String? name;
  String? email;
  String? mobile;
  Null? address;
  Null? photo;
  int? role;
  Null? emailVerifiedAt;
  Null? otpCode;
  Null? otpCreatedTime;
  int? isVerified;
  String? createdAt;
  String? updatedAt;

  Rider(
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

  Rider.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['photo'] = this.photo;
    data['role'] = this.role;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['otp_code'] = this.otpCode;
    data['otp_created_time'] = this.otpCreatedTime;
    data['is_verified'] = this.isVerified;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
