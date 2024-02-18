import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:alhamdulillah_courier_service_merchant/data/local/storage_healper.dart';
import 'package:alhamdulillah_courier_service_merchant/data/utils/base_url.dart';

class DashboardApi extends GetConnect {
  Future<dynamic> getDashboardData() => http
      .get(
        Uri.parse('${BaseUrl.baseUrl}/merchantdashboard'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
        },
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));

  Future<dynamic> getLogout() => http
      .post(
        Uri.parse('${BaseUrl.baseUrl}/logout'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
        },
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
}
