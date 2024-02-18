import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/shopsresponse.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/branch_response.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/custom_snakebar.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/showloding_dialog.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/shop/component/add_shop.dart';

import '../../data/remote/shop_api.dart';

class ShopController extends GetxController with StateMixin<List> {
  ShopApi shopApi;
  ShopController({required this.shopApi});
  List<Branch>? branchs = <Branch>[].obs;
  Branch? selectedBranch;
  int? shopId;
  var slectedValue = AppStrings.selectBranch.obs;
  final key = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneCOntroller = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController urlController = TextEditingController();

  @override
  void onInit() {
    getShops();
    getBranchs();
    super.onInit();
  }

//Get Call Shop List And Show Shop List
  getShops() async {
    change(null, status: RxStatus.loading());

    try {
      shopApi.getShops().then((value) {
        var body = json.decode(value);
        List<Shop>? shops = ShopsResponse.fromJson(body).data;
        change(shops, status: RxStatus.success());
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error(AppStrings.somthingWentWrong));
      });
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
    }
  }

//Get Call Shop List And Show Shop List
  getBranchs() async {
    try {
      shopApi.getBranchs().then((value) {
        var body = json.decode(value);
        branchs = BranchResponse.fromJson(body).data!;
      }).onError((error, stackTrace) {
        branchs = [];
      });
    } catch (error) {
      branchs = [];
    }
  }

//Check Form Validation
  getformValidation(status) {
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
    }

    String name = nameController.text;
    String phone = phoneCOntroller.text;
    String branch = selectedBranch!.name.toString();
    int zoneId = selectedBranch!.id!;
    String address = addressController.text;
    String url = urlController.text;
    Shop shop = Shop(
        shopName: name,
        shopPhone: phone,
        shopAddress: address,
        shopArea: branch,
        shopLink: url,
        zoneId: zoneId,
        id: shopId);
    if (status) {
      getUpdate(shop);
    } else {
      getStore(shop);
    }
  }

//Store Merchant Shop Data
  getStore(Shop shop) async {
    showLoaderDialog(Get.context, AppStrings.wait);

    try {
      shopApi.getStore(shop).then((value) {
        getShops();
        Get.back();
        Get.back();
        customSnakebar(
            title: AppStrings.successTitle,
            description: AppStrings.createShop,
            color: Colormanager.darkblue,
            icon: Icons.error);
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

  //Valid Empty Fields
  String? validFields(String value) {
    if (value.isEmpty) {
      return AppStrings.emptyFields;
    }
    return null;
  }

// When Shop Updated
  onUpdateShop(Shop shop) {
    nameController.text = shop.shopName.toString();
    phoneCOntroller.text = shop.shopPhone.toString();
    addressController.text = shop.shopAddress.toString();
    urlController.text = shop.shopLink.toString();
    slectedValue.value = shop.shopArea.toString();
    shopId = shop.id;
    if (branchs!.isNotEmpty) {
      final index = branchs!.indexWhere((element) => element.id == shop.zoneId);
      selectedBranch = branchs![index];
    }
    showModal(Get.context, true);
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneCOntroller.dispose();
    addressController.dispose();
    urlController.dispose();
    selectedBranch = null;
    // super.onClose();
  }

  //Store Merchant Shop Data
  getUpdate(
     Shop shop) async {
    showLoaderDialog(Get.context, AppStrings.wait);

    try {
      shopApi
          .getEdit(
              shop)
          .then((value) {
        getShops();
        Get.back();
        Get.back();
        customSnakebar(
            title: AppStrings.successTitle,
            description: AppStrings.editShop,
            color: Colormanager.darkblue,
            icon: Icons.error);
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
}
