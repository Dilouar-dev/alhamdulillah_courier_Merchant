import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/details_payment_history_reponse.dart';

import 'package:alhamdulillah_courier_service_merchant/data/remote/payment_history_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';

class DetailsPaymentHistoryController extends GetxController
    with StateMixin<DetailsHistoryPaymentResponse> {
  PaymentHistoryApi paymentHistoryApi;
  String invoiceId;
  DetailsPaymentHistoryController({
    required this.paymentHistoryApi,
    required this.invoiceId,
  });

  @override
  void onInit() {
    if (kDebugMode) {
      print('--------------------------');
      print(invoiceId);
    }
    getPaymentHistoryDetails();
    super.onInit();
  }

  //Get Dashboard Data
  getPaymentHistoryDetails() async {
    change(null, status: RxStatus.loading());

    try {
      paymentHistoryApi
          .getPaymentHistoryDetails(invoiceId: invoiceId)
          .then((value) {
        var body = json.decode(value);
        print('new invoiceid: ' + invoiceId);

        change(DetailsHistoryPaymentResponse.fromJson(body),
            status: RxStatus.success());
        if (kDebugMode) {
          print(value);
        }
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error(AppStrings.somthingWentWrong));
        if (kDebugMode) {
          print(value);
        }
      });
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
      if (kDebugMode) {
        print(value);
      }
    }
  }
}
