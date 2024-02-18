import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/local/storage_healper.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/dashboard_response.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/dashboard_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/custom_snakebar.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/showloding_dialog.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/routes_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';

class DashboardController extends GetxController
    with StateMixin<DashboardResponse> {
  DashboardApi dashboardApi;
  DashboardController({required this.dashboardApi});

  @override
  void onInit() {
    getDashboardData();
    super.onInit();
  }

  //Get Dashboard Data
  getDashboardData() async {
    change(null, status: RxStatus.loading());

    try {
      dashboardApi.getDashboardData().then((value) {
        var body = json.decode(value);

        change(DashboardResponse.fromJson(body), status: RxStatus.success());
        if (kDebugMode) {
          print(body);
        }
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error(AppStrings.somthingWentWrong));
        if (kDebugMode) {
          print(error);
          print(stackTrace);
        }
      });
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
      if (kDebugMode) {
        print(error);
      }
    }
  }

  //Get Login Attempt
  getLogout() async {
    showLoaderDialog(Get.context, 'Please Wait...');
    try {
      dashboardApi.getLogout().then((value) {
        Get.back();
        //Save To Db

        Get.offAllNamed(Routes.initialRoute);
        StorageHelper.eraseAll();
      }).onError((error, stackTrace) {
        Get.back();
        customSnakebar(
            title: AppStrings.formTitle,
            description: error.toString(),
            color: Colormanager.error,
            icon: Icons.info,
            snackPosition: SnackPosition.TOP);
      });
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      Get.back();
      customSnakebar(
          title: AppStrings.formTitle,
          description: error.toString(),
          color: Colormanager.error,
          icon: Icons.info,
          snackPosition: SnackPosition.TOP);
    }
  }
}
