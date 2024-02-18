import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:alhamdulillah_courier_service_merchant/data/model/user_info.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/user_info_api.dart';

import '../screens/resources/string_manager.dart';

class PofileController extends GetxController
    with StateMixin<UserInfoResponse> {
  UserInfoApi userInfoApi;

  PofileController({
    required this.userInfoApi,
  });

  bool isLoading = false;

  @override
  void onInit() {
    getUserInfos();

    super.onInit();
  }

  //Get Dashboard Data
  getUserInfos() async {
    change(null, status: RxStatus.loading());

    try {
      userInfoApi.getUserInfos().then((value) {
        var body = json.decode(value);

        change(UserInfoResponse.fromJson(body), status: RxStatus.success());
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
