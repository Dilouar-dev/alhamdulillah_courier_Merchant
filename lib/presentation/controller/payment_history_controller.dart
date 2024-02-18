import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/payment_history_response.dart';

import 'package:alhamdulillah_courier_service_merchant/data/remote/payment_history_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';

class PaymentHistoryController extends GetxController
    with StateMixin<List<Payment>> {
  PaymentHistoryApi paymentHistoryApi;

  PaymentHistoryController({
    required this.paymentHistoryApi,
  });

  List<Payment> payment = <Payment>[].obs;

  var fromdate = DateTime.now().obs;
  var today = DateTime.now().obs;
  String fDate = '';
  String tDate = '';

  List listItem = [];

  @override
  void onInit() {
    fDate = DateFormat('yyyy-MM-dd').format(fromdate.value);
    tDate = DateFormat('yyyy-MM-dd').format(today.value);
    getPaymentHistories();
    super.onInit();
  }

  //Get Dashboard Data
  getPaymentHistories() async {
    change(null, status: RxStatus.loading());

    try {
      paymentHistoryApi
          .getPaymentHistories(
        fDate: fDate, tDate: tDate)
          .then((value) {
        var body = json.decode(value);
        print(value);

        change(PaymentHistoryResponse.fromJson(body).data,
            status: RxStatus.success());

      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error(AppStrings.somthingWentWrong));
        if (kDebugMode) {
          print(error.toString());
        }
      });
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
      if (kDebugMode) {
        print(value);
      }
    }
  }

  Future<void> selectToDate() async {
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: today.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != today) {
      tDate = DateFormat('yyyy-MM-dd').format(picked);
      today.value = picked;
    }
  }

  Future<void> selectFromDate() async {
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: fromdate.value,
        firstDate: DateTime(2018),
        lastDate: DateTime(2101));
    if (picked != null && picked != fromdate) {
      fDate = DateFormat('yyyy-MM-dd').format(picked);
      fromdate.value = picked;
    }
  }
}
