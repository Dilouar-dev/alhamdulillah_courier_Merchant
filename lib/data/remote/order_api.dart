// import 'package:get/get.dart';
// import 'package:alhamdulillah_courier_service_merchant/data/local/storage_healper.dart';
// import 'package:alhamdulillah_courier_service_merchant/data/model/confirm_orders_response.dart';
// import 'package:alhamdulillah_courier_service_merchant/data/model/shopsresponse.dart';
// import 'package:alhamdulillah_courier_service_merchant/data/utils/base_url.dart';
// import 'package:http/http.dart' as http;
//
// class OrderApi extends GetConnect {
//   //Store New Shop By Merchant
//   Future<dynamic> getStore(Shop shop) => http
//       .post(Uri.parse('${BaseUrl.baseUrl}/shop_store'),
//           headers: <String, String>{
//             'Accept': 'application/json; charset=UTF-8',
//             'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
//           },
//           body: {
//             'shop_name': shop.shopName,
//             'shop_phone': shop.shopPhone,
//             'shop_area': shop.shopArea,
//             'zone_id': shop.zoneId.toString(),
//             'address': shop.shopAddress,
//             'link': shop.shopLink,
//           })
//       .then((value) => value.body)
//       .onError((error, stackTrace) => Future.error(error.toString()));
//
// //Get Shop List By User Id
//   Future<dynamic> getdatas() => http
//       .get(
//         Uri.parse('${BaseUrl.baseUrl}/orderDatas'),
//         headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
//       )
//       .then((value) => value.body)
//       .onError((error, stackTrace) => Future.error(error.toString()));
//
// //Get Shop List By User Id
//   Future<dynamic> getShops() => http
//       .get(
//         Uri.parse('${BaseUrl.baseUrl}/showshoplist'),
//         headers: <String, String>{
//           'Accept': 'application/json; charset=UTF-8',
//           'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
//         },
//       )
//       .then((value) => value.body)
//       .onError((error, stackTrace) => Future.error(error.toString()));
//
//       //Get Shop List By User Id
//   Future<dynamic> getDistArea({required int Id}) => http
//       .get(
//
//         // Uri.parse('${BaseUrl.baseUrl}/dist-area?id=$Id'),
//         // Uri.parse('https://system.olectraexpress.com/api/dist-area?id=$Id'),
//     Uri.parse('https://system.olectraexpress.com/api/dist-area?id=47'),
//     // Uri.parse('https://system.olectraexpress.com/api/coverage-area'),
//
//
//     headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
//       )
//       .then((value) => value.body)
//       .onError((error, stackTrace) => Future.error(error.toString()));
//
// //Get Shop List By User Id
//   Future<dynamic> getBranchs() => http
//       .get(
//         Uri.parse('${BaseUrl.baseUrl}/zone_list'),
//         headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
//       ) .then((value) {
//     return value.body;
//   })
//       // .then((value) => value.body)
//
//       .onError((error, stackTrace) => Future.error(error.toString()));
// //Get Shop List By User Id
//   Future<dynamic> getWeights() => http
//       .get(
//         Uri.parse('${BaseUrl.baseUrl}/weights'),
//         headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
//       )
//       .then((value) => value.body)
//       .onError((error, stackTrace) => Future.error(error.toString()));
// //Get Shop List By User Id
//   Future<dynamic> getAreas() => http
//       .get(
//         // Uri.parse('${BaseUrl.baseUrl}/distList'),
//     Uri.parse('http://system.olectraexpress.com/api/distList'),
//
//     headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
//       )
//       .then((value) => value.body)
//       .onError((error, stackTrace) => Future.error(error.toString()));
// //Get Shop List By User Id
//   Future<dynamic> getCategories() => http
//       .get(
//         Uri.parse('${BaseUrl.baseUrl}/category'),
//         headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
//       )
//       .then((value) => value.body)
//       .onError((error, stackTrace) => Future.error(error.toString()));
// //Get Shop List By User Id
//   Future<dynamic> getPickupTimes() => http
//       .get(
//         Uri.parse('${BaseUrl.baseUrl}/pickUpTime'),
//         headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
//       )
//       .then((value) => value.body)
//       .onError((error, stackTrace) => Future.error(error.toString()));
// //Confirms Order By Id
//   Future<dynamic> getConfirmOrders(
//           {required String formDate, required String today}) =>
//       http
//           .get(
//             Uri.parse(
//                 // '${BaseUrl.baseUrl}/confirm_orders?fromdate=$formDate&todate=$today'),
//                 '${BaseUrl.baseUrl}/confirm-orders-list?fromdate=$formDate&todate=$today'),
//
//         headers: <String, String>{
//               'Accept': 'application/json; charset=UTF-8',
//               'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
//               // 'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjQ4ZjVhYWFjN2VkMzc1NGI3MmJjMTZjYTJmMmJlY2Q2NGQ1MzhkYThhNGZhYmE4YzMwOWFiNWY4MmUzMzEwNDBkNmQ1ZGNiOTlmODgzZTI1In0.eyJhdWQiOiIxMiIsImp0aSI6IjQ4ZjVhYWFjN2VkMzc1NGI3MmJjMTZjYTJmMmJlY2Q2NGQ1MzhkYThhNGZhYmE4YzMwOWFiNWY4MmUzMzEwNDBkNmQ1ZGNiOTlmODgzZTI1IiwiaWF0IjoxNzA0MzQ5NDk5LCJuYmYiOjE3MDQzNDk0OTksImV4cCI6MTczNTk3MTg5OSwic3ViIjoiNzcwIiwic2NvcGVzIjpbXX0.HNTEVpYMooRjxIY10MIWCljG_JuhiLcGfhQghVPnfWdN6FqYOH7AIziqiewtEqg16ZQD4SQQZPXQ0A-4Cs5k6BKku2u1KQ0wL2IVq_k_gGCr2S7svx7iII--BGTw5fbxvLd3YB2-ochNqsb8uA2gd1Ocf6VhThtM8216j0Qa0kYx4ZGAvHsEYaia44gXd93H7mpyoptM7xdHOVXAiFm0kxjU0Hs-xchT0jULGtFFgTuwo2nharMPGO9KJ8plAvrQ8BHtmWVwn39nN6TEVg-fp6dmjDaJRaDyGowhjJUL6jhrfAiKUg4DnWZSCdVoIA0ksTb-t16TMqPo3YpHcOZ2CXfxBKtZvq4sbjcGmP_IwbBR0We-2xoXyVPU3vEjImiJls6cOMCnbKkVp2wcrhHNHMclWPX8cmIn0JlPkyYpKFcfkd_hBNt7rmVDBCZF1pCn8moP9u1Whor0VVyyRQzbTViPciFmjaqMVuPPQBe3uy19NI-lUKJJDqNm1YPe-lSBlrgOyP4OJ8FLR92AUSoAO3zwjfizujtIh42hcx8epvCcU3_D4J4NcunrNhYiV_V0UbuN73z4hDHeZhmWmXS3VyrA8lPj9EQWaQE7x8xLIqXAG9aIv50aeVsMTBID-akKC5IT8J3e-J1PNSgaVw92sLwhbWiB4WbfpqoaYGj8m0M',
//
//             },
//           )
//           .then((value) => value.body)
//           .onError((error, stackTrace) => Future.error(error.toString()));
//
//   Future<dynamic> getCreateOrder(Order order) => http
//       .post(Uri.parse('${BaseUrl.baseUrl}/orderstor'),
//           headers: <String, String>{
//             'Accept': 'application/json; charset=UTF-8',
//             'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
//             // 'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjdlNGY4MDNkZjhhNTY0Mzg0NDk4NjMxN2Q2ZDIyOGQ1MzFlMTJkNGEwNjc3ZDk2OWJlNjY4Y2YyMWE4NWFlZDUwYTA2YWYyZjI2ZGQyNGU2In0.eyJhdWQiOiIyNCIsImp0aSI6IjdlNGY4MDNkZjhhNTY0Mzg0NDk4NjMxN2Q2ZDIyOGQ1MzFlMTJkNGEwNjc3ZDk2OWJlNjY4Y2YyMWE4NWFlZDUwYTA2YWYyZjI2ZGQyNGU2IiwiaWF0IjoxNzA1MjE0ODE0LCJuYmYiOjE3MDUyMTQ4MTQsImV4cCI6MTczNjgzNzIxNCwic3ViIjoiNzcwIiwic2NvcGVzIjpbXX0.fvqBevgcROuZlsclyoaim4eRJeXWUyBcZZ7Jh-UQG2Wx9n8vpvBSbCiFdGeio6pFaGYjOMMh5_RrgvXah86ctpd-KHG3O-deGdEQWQYZ_ry2KvvZXbMFwsyfR-MxzePRul5tayFFs2qdLHFRvZQ6wk30yfG-WTICCkLZ-_95io2Weeb_90sytQqf50a5JKtve4aLQ1hkgGSPx67M92bQ99nfXgFjhsuZzeibYxlmSmMKBH2AtFselwf_xt684c0kx0306hLipOQC2KZS7neVNk2GEMUAwHbXIraRQZCQIEQO4FDbVG0ClWgn7zLO3ULB3vfka7btbZxHQx9X3fo1mN7ZWDZ3SAwwCYuJCyu0-iqsh2UQ44QQb0IH9iI4bZ3OOE6-gLHyacVtjpGyHuY36wzPBIvfOZmP8umc92Uht9pRchoMJJHlfAH6zTU-iSdUVai0FTLwh45VtHoD3_4ABmfdjnrGWLtVkjpx6mp_zUft0QU655ZgLyqnGJF-OUT4egMwAyjmy-ZT9aHRVX2l4o8NOeRE6fB5EuCFOJUhJUdK23U7KPoa4rdQEfcBe-028jb6QtllXwX6z2hwgS4596jMfY9PDz__l1pt5JDhCmAcZuV30rsE8UYsw5_DYCgcrgHpXn8vtZelfYYvZgnnH1Px-EC-7lHZpca9ovwo2HM'
//             // 'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjE1NzZmY2JmYmM4YWIyZGQ4NTM3YzNlMDFjZGJiYTJiNjFmNGRjMTI0OTEwN2IwYzhmYzZhNGFjZDg1OTEzZjM4NDlmMmZkODJiMjc4ZDU3In0.eyJhdWQiOiIyNCIsImp0aSI6IjE1NzZmY2JmYmM4YWIyZGQ4NTM3YzNlMDFjZGJiYTJiNjFmNGRjMTI0OTEwN2IwYzhmYzZhNGFjZDg1OTEzZjM4NDlmMmZkODJiMjc4ZDU3IiwiaWF0IjoxNzA1MjkzMzg4LCJuYmYiOjE3MDUyOTMzODgsImV4cCI6MTczNjkxNTc4OCwic3ViIjoiMTA1NSIsInNjb3BlcyI6W119.QPtO7q3WbaA42H6CVD6ZCe0OIbx9JOmFcpv07iFMHOm8t-EJuLX1nFXRxyJoE7BOxwnTqjuCNinU9iP8KetMfE6eY2_uKQZY6UQLhesbG_TOWkc8jtI14j9iBYqdmPiN7OFfF30rEay0doJpWgGlUrXmUb8nQ_DhWeMWaQpzG4sz1OiWaCAXNLOFDIfD_kSo35W4YzSLIKxlj9S42t7YLIwBRft3jyUnKA5kzIPAPnGC8-ACSRjcaai74-LN41kqDdnJLFI1hvG_7M4aQXrzpt7RCDBZ0RGSyI7nRTKNkcOfM9mmDYGFbZpMSZ6JQdVY1tXtKYsCE_cR_gsg75TXt7DZnSsNKUb7r0D1HQEZgFKYoqHgN-veS6UhTDRlVytfLHpw6RjypMH0cy5udBeEHwPVO2AoJAFFTU8dqON_IqyY0h2UU3-eGTUxBiVeaH4X4luhQZZw9REa46IAvI4HoYEwOPAt241wORFd0yLpleDe7xpy_TJazyGG_aBcDKlCbN92h4_lZ2eyowNUvNhGEXmx6Ry09glHoAhU43aRaq74uq_CtqTK4hipH9bLppODQkHJRSe3XJewLptijibm5_VBJZi5SaVjo2M8DGTFXYHacXmeK-NnqYKjKPkaf9zF70cC6ZnMY7_5y_Mv-o88OP2IYqClYLMdn-n26ZiFUZg'
//
//       },
//           body: {
//             'customer_name': order.customerName,
//             'customer_phone': order.customerPhone,
//             'customer_address': order.customerAddress,
//             'shop': order.shop,
//             'area': order.area,
//             'category': order.category,
//             'weight': order.weight,
//             'collection': order.colection.toString(),
//             'remarks': order.remarks,
//             'pickup_date': order.pickupDate,
//             'pickup_time': order.pickupTime,
//             'imp': order.type.toString(),
//             'isPartial': order.isPartial.toString(),
//           }).then((value) {
//     // Print "order created" when the HTTP request is successful
//     print('Order created');
//     return value.body;
//   })
//      // .then((value) => value.body)
//
//       .onError((error, stackTrace) => Future.error(error.toString()));
// }




import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/local/storage_healper.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/confirm_orders_response.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/shopsresponse.dart';
import 'package:alhamdulillah_courier_service_merchant/data/utils/base_url.dart';
import 'package:http/http.dart' as http;

class OrderApi extends GetConnect {
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
  Future<dynamic> getdatas() => http
      .get(
    Uri.parse('${BaseUrl.baseUrl}/orderDatas'),
    headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
  )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));

//Get Shop List By User Id
  Future<dynamic> getShops() => http
      .get(
    Uri.parse('${BaseUrl.baseUrl}/showshoplist'),
    headers: <String, String>{
      'Accept': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
    },
  )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));

  //Get Shop List By User Id
  Future<dynamic> getDistArea({required int Id}) => http
      .get(
    // Uri.parse('${BaseUrl.baseUrl}/dist-area?id=$Id'),
    Uri.parse('https://system.alhamdulillahcourierservice.com/api/coverage-area'),

    // Uri.parse('${BaseUrl.baseUrl}/coverage-area'),

    headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
  )
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
//Get Shop List By User Id
  Future<dynamic> getWeights() => http
      .get(
    Uri.parse('${BaseUrl.baseUrl}/weights'),
    headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
  )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
//Get Shop List By User Id
  Future<dynamic> getAreas() => http
      .get(
    // Uri.parse('${BaseUrl.baseUrl}/coverage-area'),
    Uri.parse('${BaseUrl.baseUrl}/distList'),

    headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
  )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
//Get Shop List By User Id
  Future<dynamic> getCategories() => http
      .get(
    Uri.parse('${BaseUrl.baseUrl}/category'),
    headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
  )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
//Get Shop List By User Id
  Future<dynamic> getPickupTimes() => http
      .get(
    Uri.parse('${BaseUrl.baseUrl}/pickUpTime'),
    headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
  )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
//Confirms Order By Id
  Future<dynamic> getConfirmOrders(
      {required String formDate, required String today}) =>
      http
          .get(
        Uri.parse(
            '${BaseUrl.baseUrl}/confirm_orders?fromdate=$formDate&todate=$today'),
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
        },
      )
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));

  // Future<dynamic> getCreateOrder(Order order) => http
  //     .post(Uri.parse('${BaseUrl.baseUrl}/orderstor'),
  //     headers: <String, String>{
  //       'Accept': 'application/json; charset=UTF-8',
  //       'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
  //     },
  //     body: {
  //       'customer_name': order.customerName,
  //       'customer_phone': order.customerPhone,
  //       'customer_address': order.customerAddress,
  //       'shop': order.shop,
  //       'district':order.district,
  //       'area': order.area,
  //       'category': order.category,
  //       'weight': order.weight,
  //       'collection': order.colection.toString(),
  //       'remarks': order.remarks,
  //       'pickup_date': order.pickupDate,
  //       'pickup_time': order.pickupTime,
  //       'imp': order.type.toString(),
  //       'isPartial': order.isPartial.toString(),
  //     })
  //     // .then((value) => value.body)
  //     .then((response) {
  //   // Print response in console
  //   print(response.body);
  //   return response.body;
  // })
  //     .onError((error, stackTrace) => Future.error(error.toString()));



  Future<dynamic> getCreateOrder(Order order) async {
    try {
      final response = await http.post(
        Uri.parse('${BaseUrl.baseUrl}/orderstor'),
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
        },
        body: {
          'customer_name': order.customerName,
          'customer_phone': order.customerPhone,
          'customer_address': order.customerAddress,
          'shop': order.shop,
          'district':order.district,
          'area': order.area,
          'category': order.category,
          'weight': order.weight,
          'collection': order.colection.toString(),
          'remarks': order.remarks,
          'pickup_date': order.pickupDate,
          'pickup_time': order.pickupTime,
          'imp': order.type.toString(),
          'isPartial': order.isPartial.toString(),
        },
      );

      if (response.statusCode != 200) {
        print('API request failed with status code: ${response.statusCode}');
        return null;
      }

      // Print response in console
      print(response.body);
      return response.body;
    } catch (error) {
      print('Error: $error');
      return null;
    }
  }

}

