class DashboardResponse {
  bool? status;
  String? message;
  Data? data;

  DashboardResponse({this.status, this.message, this.data});

  DashboardResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? tDalivery;
  int? toDalivery;
  int? tCancel;
  int? toCancel;
  int? tReturn;
  int? toReturn;
  int? tHoldReschedule;
  int? toHoldReschedule;
  num? paymentProcessing;
  num? paymentComplete;

  Data(
      {this.tDalivery,
      this.toDalivery,
      this.tCancel,
      this.toCancel,
      this.tReturn,
      this.toReturn,
      this.tHoldReschedule,
      this.toHoldReschedule,
      this.paymentProcessing,
      this.paymentComplete});

  Data.fromJson(Map<String, dynamic> json) {
    tDalivery = json['t_dalivery'];
    toDalivery = json['to_dalivery'];
    tCancel = json['t_cancel'];
    toCancel = json['to_cancel'];
    tReturn = json['t_return'];
    toReturn = json['to_return'];
    tHoldReschedule = json['t_hold_reschedule'];
    toHoldReschedule = json['to_hold_reschedule'];
    paymentProcessing = json["paymentProcessing"];
    paymentComplete = json["paymentComplete"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['t_dalivery'] = tDalivery;
    data['to_dalivery'] = toDalivery;
    data['t_cancel'] = tCancel;
    data['to_cancel'] = toCancel;
    data['t_return'] = tReturn;
    data['to_return'] = toReturn;
    data['t_hold_reschedule'] = tHoldReschedule;
    data['to_hold_reschedule'] = toHoldReschedule;
    data["paymentProcessing"] = paymentProcessing;
    data["paymentComplete"] = paymentComplete;
    return data;
  }
}
