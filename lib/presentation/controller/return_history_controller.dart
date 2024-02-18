import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/return_history_reponse.dart';

import 'package:alhamdulillah_courier_service_merchant/data/remote/return_history_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';

class ReturnHistoryController extends GetxController
    with StateMixin<List<ReturnOrder>> {
  ReturnHistoryApi returnHistoryApi;

  ReturnHistoryController({
    required this.returnHistoryApi,
  });

  List<ReturnOrder> returnOrder = <ReturnOrder>[].obs;

  var formDate = DateTime.now().obs;
  var todate = DateTime.now().obs;
  String fDate = '';
  String tDate = '';

  List listItem = [];

  @override
  void onInit() {
    fDate = DateFormat('yyyy-MM-dd').format(formDate.value);
    tDate = DateFormat('yyyy-MM-dd').format(todate.value);
    getReturnHistories();
    super.onInit();
  }

  //Get Dashboard Data
  getReturnHistories() async {
    change(null, status: RxStatus.loading());

    try {
      returnHistoryApi
          .getReturnHistories(
        fDate: fDate, tDate: tDate,)
          .then((value) {
        var body = json.decode(value);
        print(value.toString());
        change(ReturnHistoryResponse.fromJson(body).data,
            status: RxStatus.success());
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error('It will be fixed soon'/*AppStrings.somthingWentWrong*/));
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
        initialDate: todate.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != todate) {
      tDate = DateFormat('yyyy-MM-dd').format(picked);
      todate.value = picked;
    }
  }

  Future<void> selectFromDate() async {
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: formDate.value,
        firstDate: DateTime(2018),
        lastDate: DateTime(2101));
    if (picked != null && picked != formDate) {
      fDate = DateFormat('yyyy-MM-dd').format(picked);
      formDate.value = picked;
    }
  }
}
