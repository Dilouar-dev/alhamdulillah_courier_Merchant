import 'dart:convert';

import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/local/storage_healper.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/user_info.dart';
import 'package:alhamdulillah_courier_service_merchant/data/utils/base_url.dart';
import 'package:http/http.dart' as http;

class PaymentApi extends GetConnect {
  ///Update User Info
  Future<dynamic> getPaymentInfoUpdateByToken({required Payment payment}) =>
      http
          .post(
            Uri.parse('${BaseUrl.baseUrl}/user-bank-update'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
            },
            body: jsonEncode(<String, String>{
              'acType': payment.pType.toString(),
              'mb_name': payment.mbName.toString(),
              'mb_type': payment.mbType.toString(),
              'mb_number': payment.mbNumber.toString(),
              'bank_name': payment.bankName.toString(),
              'branch_name': payment.branchName.toString(),
              'account_holder_name': payment.accountHolderName.toString(),
              'account_type': payment.accountType.toString(),
              'account_number': payment.accountNumber.toString(),
              'routing_number': payment.routingNumber.toString(),
            }),
          )
          .then((value) => value)
          .onError((error, stackTrace) => Future.error(error.toString()));

//Get Shop List By User Id
  Future<dynamic> getBranchs() => http
      .get(
        Uri.parse('${BaseUrl.baseUrl}/zone_list'),
        headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
}
