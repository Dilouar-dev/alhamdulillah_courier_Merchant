import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/local/storage_healper.dart';
import 'package:alhamdulillah_courier_service_merchant/data/utils/base_url.dart';
import 'package:http/http.dart' as http;

class ReturnHistoryApi extends GetConnect {
//Confirms Order By Id
  Future<dynamic> getReturnHistories({
    required String? fDate,
    required String? tDate,
  }) =>
      http
          .post(
            Uri.parse(
                '${BaseUrl.baseUrl}/return-history?fromdate=$fDate&todate=$tDate'),
            headers: <String, String>{
              'Accept': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
            },
          )
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));

//Payment Details By Invoice
  Future<dynamic> getReturnHistoryDetails({
    required String? invoiceId,
  }) =>
      http
          .get(
            Uri.parse(
                '${BaseUrl.baseUrl}/rider_return_details?invoice_id=$invoiceId'),
            headers: <String, String>{
              'Accept': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
            },
          )
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));
}
