// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/showloding_dialog.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/profile/profilescreen.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../data/local/storage_healper.dart';
// import '../../data/remote/login_api.dart';
// import '../screens/gb_widgets/custom_snakebar.dart';
// import '../screens/resources/routes_manager.dart';
//
// class LoginController extends GetxController {
//   final formKey = GlobalKey<FormState>();
//   final formKeyMobile = GlobalKey<FormState>();
//   final mobileController = TextEditingController();
//   final email = TextEditingController();
//   final password = TextEditingController();
//   RxBool obscureText = true.obs;
//
//   // Initialize isLoginSuccess with false
//   final RxBool isLoginSuccess = false.obs;
//
// //Email Validation
//   String? validateEmail(String value) {
//     if (!GetUtils.isEmail(value)) {
//       return AppStrings.provideEmail;
//     }
//     return null;
//   }
//
// //Password Validation
//   String? validatePassword(String value) {
//     if (value.isEmpty) {
//       return AppStrings.provideNumber;
//     }
//     if (value.length < 5) {
//       return AppStrings.provideNumber;
//     }
//     return null;
//   }
//
//   //Phone Validation
//   String? validatePhone(String value) {
//     if (value.isEmpty) {
//       return AppStrings.emptyFields;
//     }
//     if (!GetUtils.isPhoneNumber(value)) {
//       return AppStrings.providePhone;
//     }
//     if (value.length != 11) {
//       return AppStrings.providePhone;
//     }
//     return null;
//   }
//
// //Form Validation Check
//   getValidate() {
//     var valid = formKey.currentState!.validate();
//     if (kDebugMode) {
//       print(valid);
//     }
//
//     if (!valid) {
//       if (kDebugMode) {
//         print('emapt');
//       }
//       return;
//     } else {
//       if (kDebugMode) {
//         print('Not emapt');
//       }
//       var emailV = email.text;
//       var passwordV = password.text;
//       getLogin(emailV: emailV, passwordV: passwordV);
//     }
//   }
//
//
//   //Get Login Attempt
//   getLogin({required String emailV, required String passwordV}) async {
//     showLoaderDialog(Get.context, 'Please Wait...');
//     try {
//       LoginApi.getlogin(email: emailV, password: passwordV).then((value) {
//         Get.back();
//         //Save To Db
//         final response = json.decode(value);
//         StorageHelper.setString(
//             key: 'token', value: response['token']['token']);
//         StorageHelper.setInt(key: 'role', value: response['user']['role']);
//         if (kDebugMode) {
//           print(response['user']);
//         }
//
//
//         // Pass the email to the ProfileService
//         // if (response['user']['role'] != 12 && response['user']['role'] != 14) {
//         //   ProfileScreen.to.userEmail.value = emailV;
//         // }
//         // Get.offAllNamed(Routes.inActiveRoute);
//
//         //Navigate to Home Page
//         if (response['user']['role'] == 12 || response['user']['role'] == 14) {
//           Get.offAllNamed(Routes.homeRoute);
//         } else {
//           Get.offAllNamed(Routes.inActiveRoute);
//         }
//       }).onError((error, stackTrace) {
//         Get.back();
//         customSnakebar(
//             title: AppStrings.formTitle,
//             description: error.toString(),
//             color: Colormanager.error,
//             icon: Icons.info,
//             snackPosition: SnackPosition.TOP);
//       });
//     } catch (error) {
//       if (kDebugMode) {
//         print(error);
//       }
//       Get.back();
//       customSnakebar(
//           title: AppStrings.formTitle,
//           description: error.toString(),
//           color: Colormanager.error,
//           icon: Icons.info,
//           snackPosition: SnackPosition.TOP);
//     }
//   }
//
//
//
// void onClose() {
//   email.dispose();
//   password.dispose();
//   FocusScope.of(Get.context!).requestFocus();
//   // super.onClose();
// }
// }
//
//
//


import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/local/storage_healper.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/login_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/showloding_dialog.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/custom_snakebar.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/home/home.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/routes_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  RxBool obscureText = true.obs;

  @override
  void onInit() {
    super.onInit();
    checkSavedSession();
  }

  // Check if there is a saved session
  checkSavedSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      // User is already logged in, navigate to home page
      // Get.offAllNamed('/home'); // Update with your home route
      // Get.to(HomeView());
      Get.offAllNamed(Routes.homeRoute);


    }
  }

  //Email Validation
  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return AppStrings.provideEmail;
    }
    return null;
  }

  //Password Validation
  String? validatePassword(String value) {
    if (value.isEmpty) {
      return AppStrings.provideNumber;
    }
    if (value.length < 5) {
      return AppStrings.provideNumber;
    }
    return null;
  }

  //Form Validation Check
  getValidate() {
    var valid = formKey.currentState!.validate();

    if (!valid) {
      return;
    } else {
      var emailV = email.text;
      var passwordV = password.text;
      getLogin(emailV: emailV, passwordV: passwordV);
    }
  }

  // Get Login Attempt
  getLogin({required String emailV, required String passwordV}) async {
    showLoaderDialog(Get.context, 'Please Wait...');
    try {
      LoginApi.getlogin(email: emailV, password: passwordV).then((value) {
        Get.back();
        // Save To SharedPreferences
        final response = json.decode(value);
        StorageHelper.setString(key: 'token', value: response['token']['token']);
        StorageHelper.setInt(key: 'role', value: response['user']['role']);

        // Save to SharedPreferences for session management
        SharedPreferences.getInstance().then((prefs) {
          prefs.setString('token', response['token']['token']);
        });

        // Navigate to Home Page
        // Get.offAllNamed('/home'); // Update with your home route
        Get.offAllNamed(Routes.homeRoute);
      }).onError((error, stackTrace) {
        Get.back();
        customSnakebar(
          title: AppStrings.formTitle,
          description: error.toString(),
          color: Colormanager.error,
          icon: Icons.info,
          snackPosition: SnackPosition.TOP,
        );
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
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  // Logout function
  // void logout() async {
  //   await StorageHelper.remove('token');
  //   await StorageHelper.remove('role');
  //
  //   // Clear SharedPreferences
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.remove('token');
  //
  //   // Navigate to the login page
  //   Get.offAllNamed('/login'); // Update with your login route
  // }

  void onClose() {
    email.dispose();
    password.dispose();
    FocusScope.of(Get.context!).requestFocus();
  }
}


