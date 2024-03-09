import 'dart:convert';

import 'package:alhamdulillah_courier_service_merchant/data/local/storage_healper.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/utils/base_url.dart';
import 'package:http/http.dart' as http;

// class LoginApi extends GetConnect {
//   static Future<dynamic> getlogin({String? email, String? password}) => http
//       .post(Uri.parse('${BaseUrl.baseUrl}/login'), body: {
//         'email': email,
//         'password': password,
//       })
//       .then((value) => value.body)
//       .onError((error, stackTrace) => Future.error(error.toString()));
//
// //Get Login with Phone
//   static Future<dynamic> getOtplogin({
//     String? mobile,
//   }) =>
//       http
//           .post(Uri.parse('${BaseUrl.baseUrl}/otp_login'),
//               headers: <String, String>{
//                 'Accept': 'application/json; charset=UTF-8',
//               },
//               body: {
//                 'mobile': mobile,
//                 'role': '12',
//               })
//           .then((value) => value.body)
//           .onError((error, stackTrace) => Future.error(error.toString()));
//
//   //Get Verify Otp Code
//   static Future<dynamic> getOtpVarify({
//     String? mobile,
//     String? otp_code,
//   }) =>
//       http
//           .post(Uri.parse('${BaseUrl.baseUrl}/otp_verification'), body: {
//             'mobile': mobile,
//             'otp_code': otp_code,
//           })
//           .then((value) => value.body)
//           .onError((error, stackTrace) => Future.error(error.toString()));
// }




class LoginApi extends GetConnect {
  static Future<dynamic> getlogin({String? email, String? password}) async {
    try {
      final Map<String, dynamic> requestBody = {
        'email': email,
        'password': password,
      };

      final response = await http.post(
        Uri.parse('${BaseUrl.baseUrl}/login'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
      },
        body: jsonEncode(requestBody),
      );


      if (response.statusCode == 200) {
        print("Login successful!");
        return response.body;
      } else {
        print("Login failed !! Password is wrong");

        // print("Login failed. Status code: ${response.statusCode}");

        // Check if there's an error message in the response body
        final dynamic errorBody = response.body;
        final errorMessage = errorBody is Map ? errorBody['error'] : null;

        if (errorMessage != null) {
          print("Error message from API: $errorMessage");
        }

        throw Exception("Login failed. Status code: ${response.statusCode}, Error: $errorMessage");
      }
    } catch (error) {
      print("Error during login request: $error");
      throw Exception("Login failed. Error: $error");
    }
  }

//Get Login with Phone
  static Future<dynamic> getOtplogin({
    String? mobile,
  }) =>
      http
          .post(Uri.parse('${BaseUrl.baseUrl}/otp_login'),
              headers: <String, String>{
                'Accept': 'application/json; charset=UTF-8',
              },
              body: {
                'mobile': mobile,
                'role': '12',
              })
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));

  //Get Verify Otp Code
  static Future<dynamic> getOtpVarify({
    String? mobile,
    String? otp_code,
  }) =>
      http
          .post(Uri.parse('${BaseUrl.baseUrl}/otp_verification'), body: {
            'mobile': mobile,
            'otp_code': otp_code,
          })
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));
}




