import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/user_info.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/payment_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/custom_snakebar.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/routes_manager.dart';

import '../screens/gb_widgets/showloding_dialog.dart';
import '../screens/resources/string_manager.dart';

class PaymentController extends GetxController {
  PaymentApi paymentApi;
  PaymentController({
    required this.paymentApi,
  });
  RxBool isBank = false.obs;
  var selectPaymenttype = ''.obs;
  final formKey = GlobalKey<FormState>();
  TextEditingController branchNameController = TextEditingController();
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController routingNumberController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  List<String> paymentType = [
    "Select Payment Type",
    "Bank",
    "Bkash",
    "Rocket(DBBL)",
    "Nagad",
    'UCash'
  ];
  var selectBanktype = ''.obs;

  List<String> banks = [
    "Select Bank",
    "Dutch Bangla Bank Ltd.",
    "Brac Bank Ltd.",
    "One Bank Ltd.",
    "Sonali Bank Ltd.",
  ];
  var selectAccounttypeBank = ''.obs;

  List<String> banksAccountType = [
    "Select Account Type",
    "CURRENT",
    "SAVING",
    "AWCDI",
    "SND",
    "STD",
    "AWCA",
  ];
  var selectAccounttypeMobile = ''.obs;

  List<String> mobileAccountTypes = [
    "Select Account Type",
    "Agent",
    "Personal",
  ];
  @override
  void onInit() {
    selectPaymenttype.value = 'Select Payment Type';
    selectAccounttypeMobile.value = 'Select Account Type';
    selectAccounttypeBank.value = 'Select Account Type';
    selectBanktype.value = 'Select Bank';

    super.onInit();
  }

  getValid() {
    final valid = formKey.currentState!.validate();
    if (!valid) {
      return;
    }

    if (selectPaymenttype.value == 'Select Payment Type') {
      customSnakebar(
          title: AppStrings.errorTitle,
          description: 'Payment type not selected',
          color: Colormanager.red,
          icon: Icons.error);
      return;
    }

    if (selectPaymenttype.value == 'Bank') {
      if (selectBanktype.value == 'Select Bank') {
        customSnakebar(
            title: AppStrings.errorTitle,
            description: 'Bank not selected',
            color: Colormanager.red,
            icon: Icons.error);
        return;
      }
      if (selectAccounttypeBank.value == 'Select Account Type') {
        customSnakebar(
            title: AppStrings.errorTitle,
            description: 'Account type not selected',
            color: Colormanager.red,
            icon: Icons.error);
        return;
      }
    } else {
      if (selectAccounttypeMobile.value == 'Select Account Type') {
        customSnakebar(
            title: AppStrings.errorTitle,
            description: 'Account type not selected',
            color: Colormanager.red,
            icon: Icons.error);
        return;
      }
    }
    onSubMit();
  }

  onSubMit() {
    showLoaderDialog(Get.context!, 'Please Wait....');
    Payment payment = Payment(
        pType: selectPaymenttype.value.toString() == 'Bank'
            ? 'bank'
            : selectPaymenttype.value.toString(),
        mbName: selectPaymenttype.value.toString(),
        mbType: selectAccounttypeMobile.value.toString(),
        mbNumber: mobileNumberController.text,
        bankName: selectBanktype.value.toString(),
        branchName: branchNameController.text,
        accountHolderName: accountHolderNameController.text,
        accountType: selectAccounttypeBank.value.toString(),
        accountNumber: accountNumberController.text,
        routingNumber: routingNumberController.text);
    if (kDebugMode) {
      print(payment.toJson());
    }
    try {
      paymentApi.getPaymentInfoUpdateByToken(payment: payment).then((response) {
        if (response.statusCode == 200) {
          Get.back();
          customSnakebar(
              title: AppStrings.successTitle,
              description: 'Payment Add to profile',
              color: Colormanager.darkblue,
              icon: Icons.check);
          Get.offNamed(Routes.profile);
        } else {
          Get.back();
          Get.snackbar(
            'Alert !',
            'Something went to wrong .',
            colorText: Colors.white,
            backgroundColor: Colors.red[800],
          );
        }
      }).onError((error, stackTrace) {
        Get.back();
        Get.snackbar(
          'Alert !',
          error.toString(),
          colorText: Colors.white,
          backgroundColor: Colors.red[800],
        );
        if (kDebugMode) {
          print(error);
        }
      });
    } catch (err) {
      Get.back();
      Get.snackbar(
        'Alert !',
        err.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.red[800],
      );
      if (kDebugMode) {
        print(err);
      }
    }
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
}
