import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/local/storage_healper.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/shopsresponse.dart';
import 'package:alhamdulillah_courier_service_merchant/data/utils/base_url.dart';
import 'package:http/http.dart' as http;

class ShopApi extends GetConnect {
  //Store New Shop By Merchant
  Future<dynamic> getStore(Shop shop) => http
      .post(Uri.parse('${BaseUrl.baseUrl}/shop_store'),
          headers: <String, String>{
            'Accept': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
          },
          body: {
            'shop_name': shop.shopName,
            'shop_phone': shop.shopPhone,
            'shop_area': shop.shopArea,
            'zone_id': shop.zoneId.toString(),
            'address': shop.shopAddress,
            'link': shop.shopLink,
          })
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));

//Get Shop List By User Id
  Future<dynamic> getShops() => http
      .get(
        Uri.parse('${BaseUrl.baseUrl}/showshoplist'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
        },
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
//Get Shop List By User Id
  Future<dynamic> getBranchs() => http
      .get(
        Uri.parse('${BaseUrl.baseUrl}/zone_list'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));

//On Update Value By id
  Future<dynamic> getEdit(Shop shop) => http
      .post(Uri.parse('${BaseUrl.baseUrl}/shop_edit'),
          headers: <String, String>{
            'Accept': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
          },
          body: {
            'shop_name': shop.shopName,
            'shop_phone': shop.shopPhone,
            'shop_area': shop.shopArea,
            'zone_id': shop.zoneId.toString(),
            'address': shop.shopAddress,
            'link': shop.shopLink,
            'id': shop.id.toString(),
          })
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
}
