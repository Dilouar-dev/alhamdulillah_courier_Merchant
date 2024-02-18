import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/confirm_orders_response.dart';

import 'package:alhamdulillah_courier_service_merchant/data/remote/order_history_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';

class OrderHistoryController extends GetxController
    with StateMixin<List<Order>> {
  OrderHistoryApi orderHistoryApi;

  OrderHistoryController({
    required this.orderHistoryApi,
  });

  List<Order> orders = <Order>[].obs;

  var formDate = DateTime.now().obs;
  var todate = DateTime.now().obs;
  String fDate = '';
  String tDate = '';

  var selectStatus = 'Order Placed'.obs;

  List<String> statusList = [
    "Order Placed",
    "Assigned Pickup Rider",
    "Pickup Done",
    "PickUp Cancel",
    "Rescheduled",
    "Hold Order Received from Branch",
    "Assigned To Delivery Rider",
    "Successfully Delivered",
    "Partially Delivered",
    "Payment Processing Complete",
    "Payment Processing",
    "Payment Completed",
    "Return Confirm",
    "Return Reach To Merchant",
  ];

  List listItem = [];

  @override
  void onInit() {
    fDate = DateFormat('yyyy-MM-dd').format(formDate.value);
    tDate = DateFormat('yyyy-MM-dd').format(todate.value);
    getConfirmOrders();
    super.onInit();
  }

  //Get Dashboard Data
  getConfirmOrders() async {
    change(null, status: RxStatus.loading());

    try {
      orderHistoryApi
          .getConfirmOrders(
              fDate: fDate, tDate: tDate, status: selectStatus.value)
          .then((value) {
        var body = json.decode(value);
        //print(value);
        change(ConfirmOrdersResponse.fromJson(body).data,
            status: RxStatus.success());
        print(value);

      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error(AppStrings.somthingWentWrong));
        print(stackTrace);
      });
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));

      print(value);
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
