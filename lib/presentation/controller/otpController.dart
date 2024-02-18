import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/otpVerifyController%20.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/showloding_dialog.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';

import '../../data/remote/login_api.dart';
import '../screens/gb_widgets/custom_snakebar.dart';
import '../screens/resources/routes_manager.dart';

class OtpController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final mobileController = TextEditingController();

  //Phone Validation
  String? validatePhone(String value) {
    if (value.isEmpty) {
      return AppStrings.emptyFields;
    }
    if (!GetUtils.isPhoneNumber(value)) {
      return AppStrings.providePhone;
    }
    if (value.length != 11) {
      return AppStrings.providePhone;
    }
    return null;
  }

//Form Validation Check
  getValidate() {
    var valid = formKey.currentState!.validate();
    if (kDebugMode) {
      print(valid);
    }

    if (!valid) {
      if (kDebugMode) {
        print('emapt');
      }
      return;
    } else {
      if (kDebugMode) {
        print('Not emapt');
      }
      var mobile = mobileController.text.toString();
      print(mobile);

      getLogin(mobile: mobile);
    }
  }

  //Get Login Attempt
  getLogin({required String mobile}) async {
    showLoaderDialog(Get.context, 'Please Wait...');
    try {
      LoginApi.getOtplogin(mobile: mobile).then((value) {
        final response = json.decode(value);
        print(value);
        Get.back();
        if (response['status'] == true) {
          Get.put<OtpVerifyController>(OtpVerifyController(mobile: mobile));
          Get.toNamed(Routes.loginPhoneVerifyRoute);
        } else {
          customSnakebar(
              title: AppStrings.formTitle,
              description: AppStrings.somthingWentWrong,
              color: Colormanager.error,
              icon: Icons.info,
              snackPosition: SnackPosition.TOP);
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
    // mobileController.dispose();
    FocusScope.of(Get.context!).requestFocus();
    // super.onClose();
  }
}
