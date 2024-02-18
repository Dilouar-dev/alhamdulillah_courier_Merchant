import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/showloding_dialog.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';

import '../../data/local/storage_healper.dart';
import '../../data/remote/login_api.dart';
import '../screens/gb_widgets/custom_snakebar.dart';
import '../screens/resources/routes_manager.dart';

class OtpVerifyController extends GetxController {
  String mobile;
  OtpVerifyController({
    required this.mobile,
  });
  late GlobalKey<FormState> keyFromVery = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController =
      StreamController<ErrorAnimationType>();

  final codeController = TextEditingController();
  RxBool hasError = false.obs;
  var code = ''.obs;

  getvalidation() {
    final isValid = keyFromVery.currentState!.validate();
    if (!isValid) {
      return;
    }
    // conditions for validating
    if (code.value.length != 4) {
      errorController!
          .add(ErrorAnimationType.shake); // Triggering error shake animation
      hasError.value = true;
      return;
    }
    getVerify();
  }

  getVerify() async {
    showLoaderDialog(Get.context, 'Please Wait...');
    try {
      LoginApi.getOtpVarify(otp_code: codeController.text, mobile: mobile)
          .then((value) {
        Get.back();
        //Save To Db
        final response = json.decode(value);
        print(response.toString());
        StorageHelper.setString(
            key: 'token', value: response['token']['token']);
        StorageHelper.setInt(key: 'role', value: response['user']['role']);
        //Navigate to Home Page
        if (response['user']['role'] == 12 || response['user']['role'] == 14) {
          if (response['status'] == true) {
            Get.offAllNamed(Routes.incomplete);
          } else {
            Get.offAllNamed(Routes.incomplete);
          }
        } else {
          Get.offAllNamed(Routes.inActiveRoute);
        }
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

  @override
  void onClose() {
    //codeController.dispose();

    FocusScope.of(Get.context!).requestFocus();
    // super.onClose();
  }
}
