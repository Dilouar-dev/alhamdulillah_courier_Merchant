import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/return_history_details_response.dart';

import 'package:alhamdulillah_courier_service_merchant/data/remote/return_history_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';

class DetailsReturnHistoryController extends GetxController
    with StateMixin<List<ROrder>> {
  ReturnHistoryApi returnHistoryApi;
  String invoiceId;
  DetailsReturnHistoryController({
    required this.returnHistoryApi,
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
      returnHistoryApi
          .getReturnHistoryDetails(invoiceId: invoiceId)
          .then((value) {
        var body = json.decode(value);

        change(ReturnHistoryDetailsResponse.fromJson(body).orders,
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
