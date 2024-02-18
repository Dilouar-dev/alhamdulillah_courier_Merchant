import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/local/storage_healper.dart';
import 'package:alhamdulillah_courier_service_merchant/data/utils/base_url.dart';
import 'package:http/http.dart' as http;

class UserInfoApi extends GetConnect {
  static Future<dynamic> getUserInfo({String? token}) => http
      .get(
        Uri.parse('${BaseUrl.baseUrl}/merchant-info'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
  Future<dynamic> getUserInfos({String? token}) => http
      .get(
        Uri.parse('${BaseUrl.baseUrl}/merchant-info'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
        },
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
  Future<dynamic> getBranchs() => http
      .get(
    Uri.parse('${BaseUrl.baseUrl}/zone_list'),
    headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
  )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
}
