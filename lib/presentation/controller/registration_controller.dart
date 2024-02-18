import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/local/storage_healper.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/registration_response.dart';

import 'package:alhamdulillah_courier_service_merchant/data/remote/registration_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/custom_snakebar.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/showloding_dialog.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/routes_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';

import '../../data/model/branch_response.dart';

class RegistrationController extends GetxController
    with StateMixin<List<Branch>> {
  RegistrationApi registrationApi;

  RegistrationController({required this.registrationApi});

  List<Branch>? branchs = <Branch>[].obs;
  Branch? selectedBranch;
  int? shopId;
  var slectedbranch = AppStrings.selectBranch.obs;
  final key = GlobalKey<FormState>();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool obscureText = true.obs;

  @override
  void onInit() {
    getBranchs();
    super.onInit();
  }

//Get Call Branch List And Show Shop List
  getBranchs() async {
    slectedbranch.value = '';
    slectedbranch.value = AppStrings.selectBranch;
    change(null, status: RxStatus.loading());

    try {
      registrationApi.getBranchs().then((value) {
        var body = json.decode(value);
        if (kDebugMode) {
          print('SUccess--------$value-------');
        }

        List<Branch>? branchs = BranchResponse.fromJson(body).data;
        change(branchs, status: RxStatus.success());
      }).onError((error, stackTrace) {
        if (kDebugMode) {
          print('OnError-----$error----------');
        }
        change(null, status: RxStatus.error(AppStrings.somthingWentWrong));
      });
    } catch (error) {
      if (kDebugMode) {
        print('Catch-----$error----------');
      }
      change(null, status: RxStatus.error(error.toString()));
    }
  }

//Check Form Validation
  getformValidation() {
    final validation = key.currentState!.validate();
    if (!validation) {
      return;
    }
    if (selectedBranch == null) {
      customSnakebar(
          title: AppStrings.errorTitle,
          description: AppStrings.branchNotSelect,
          color: Colormanager.red,
          icon: Icons.error);
      return;
    }

    String businessName = businessNameController.text;
    String name = nameController.text;
    String branch = selectedBranch!.name.toString();
    int zoneId = selectedBranch!.id!;
    String address = addressController.text;
    String email = emailController.text;
    String phone = phoneController.text;
    String password = passwordController.text;
    User user = User(
        businessName: businessName,
        name: name,
        area: branch,
        zoneId: zoneId,
        address: address,
        email: email,
        mobile: phone,
        photo: password);
    getStore(user);
  }

//Store Merchant Shop Data
  getStore(User user) async {
    showLoaderDialog(Get.context, AppStrings.wait);

    try {
      registrationApi.getStore(user).then((value) {
        Get.back();
        if (kDebugMode) {
          print(value);
        }
        final response = RegistrationResponse.fromJson(json.decode(value));

        //Navigate to Home Page
        if (response.success == true) {
          customSnakebar(
              title: AppStrings.successTitle,
              description: AppStrings.userRegister,
              color: Colormanager.darkblue,
              icon: Icons.check);
          StorageHelper.setString(
              key: 'token', value: response.token!.token.toString());
          StorageHelper.setInt(key: 'role', value: response.user!.role);

          if (response.user!.role == 12 || response.user!.role == 14) {
            Get.offAllNamed(Routes.homeRoute);
          } else {
            Get.offAllNamed(Routes.inActiveRoute);
          }
        } else {
          customSnakebar(
              title: AppStrings.errorTitle,
              description: response.message,
              color: Colormanager.red,
              icon: Icons.error);
        }
      }).onError((error, stackTrace) {
        if (kDebugMode) {
          print(error);
        }
        Get.back();
        customSnakebar(
            title: AppStrings.errorTitle,
            description: error.toString(),
            color: Colormanager.red,
            icon: Icons.error);
      });
    } catch (error) {
      Get.back();
      customSnakebar(
          title: AppStrings.errorTitle,
          description: error.toString(),
          color: Colormanager.red,
          icon: Icons.error);
    }
  }

  //Email Validation
  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return AppStrings.provideEmail;
    }
    return null;
  }

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

  //Phone Validation
  String? validPassword(String value) {
    if (value.isEmpty) {
      return AppStrings.emptyFields;
    }

    if (value.length < 5) {
      return AppStrings.provideNumber;
    }
    return null;
  }

  //Valid Empty Fields
  String? validFields(String value) {
    if (value.isEmpty) {
      return AppStrings.emptyFields;
    }
    return null;
  }



  void onClose() {
    businessNameController.dispose();
    nameController.dispose();
    addressController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();

    selectedBranch = null;
    // super.onClose();
  }
}


