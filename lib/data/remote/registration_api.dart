import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/registration_response.dart';
import 'package:alhamdulillah_courier_service_merchant/data/utils/base_url.dart';
import 'package:http/http.dart' as http;

class RegistrationApi extends GetConnect {
  //Store New Shop By Merchant
  Future<dynamic> getStore(User user) => http
      .post(Uri.parse('${BaseUrl.baseUrl}/register-merchant'),
          headers: <String, String>{
            'Accept': 'application/json; charset=UTF-8',
          },
          body: {
            'business_name': user.businessName,
            'name': user.name,
            'email': user.email,
            'area': user.area,
            'zone_id': user.zoneId.toString(),
            'address': user.address,
            'mobile': user.mobile,
            'password': user.photo,
          })
      .then((value) => value.body)
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
