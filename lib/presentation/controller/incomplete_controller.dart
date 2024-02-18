import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/branch_response.dart';

import 'package:alhamdulillah_courier_service_merchant/data/model/user_info.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/user_info_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/custom_snakebar.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';

import '../screens/resources/string_manager.dart';

class IncompleteController extends GetxController
    with StateMixin<List<Branch>> {
  UserInfoApi userInfoApi;

  IncompleteController({
    required this.userInfoApi,
  });

  List<Branch>? branchs = <Branch>[].obs;
  Branch? selectedBranch;
  int? shopId;
  var slectedbranch = AppStrings.selectBranch.obs;
  final key = GlobalKey<FormState>();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

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
      userInfoApi.getBranchs().then((value) {
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
    User user = User(
      businessName: businessName,
      name: name,
      area: branch,
      zoneId: zoneId,
      address: address,
    );
    // getStore(user);
  }


  //Valid Empty Fields
  String? validFields(String value) {
    if (value.isEmpty) {
      return AppStrings.emptyFields;
    }
    return null;
  }

}
