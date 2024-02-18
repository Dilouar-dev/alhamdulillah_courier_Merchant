// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/controller/login_controller.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/assets_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/routes_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';
//
// import '../resources/size_config.dart';
//
// class LoginView extends StatefulWidget {
//   const LoginView({Key? key}) : super(key: key);
//
//   @override
//   State<LoginView> createState() => _LoginViewState();
// }
//
// class _LoginViewState extends State<LoginView> {
//   final SharedPreferences _prefs = Get.find();
//   final controller = Get.put(LoginController(), permanent: false);
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     // Check if the user is already logged in
//     final bool isLoggedIn = _prefs.getBool('isLoggedIn') ?? false;
//
//     // If the user is already logged in, navigate to the home page or any other page
//     if (isLoggedIn) {
//       // Replace 'Home' with the route you want to navigate to after login
//       Get.offNamed(Routes.homeRoute);
//     }
//
//     return Scaffold(
//       backgroundColor: Colormanager.darkPrimary,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(
//               horizontal: AppPadding.p20, vertical: AppPadding.p30),
//           child: Column(
//             children: <Widget>[
//               Container(
//                 height: MediaQuery
//                     .of(context)
//                     .size
//                     .height / 5,
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .width / 1.5,
//                 child: Center(
//                   child: Image.asset(ImageAssets.splashLogo), //App Logo
//                 ),
//               ),
//               Column(
//                 children: <Widget>[
//                   Container(
//                     margin: const EdgeInsets.only(
//                       bottom: AppSize.s16,
//                     ),
//                     child: Form(
//                       key: controller.formKey,
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 58.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               AppStrings.email,
//                               style: getBoldStyle(
//                                   color: Colors.black, fontSize: FontSize.s14),
//                             ),
//                             const SizedBox(
//                               height: AppSize.s16,
//                             ),
//                             TextFormField(
//                               // Email FormField
//                               controller: controller.email,
//                               textInputAction: TextInputAction.next,
//                               style: getBoldStyle(
//                                   color: Colors.black, fontSize: FontSize.s14),
//                               textAlign: TextAlign.start,
//                               obscureText: false,
//                               decoration: InputDecoration(
//                                 hintText: AppStrings.hEmail,
//                                 suffixIcon: Icon(
//                                   Icons.email,
//                                   color: Colormanager.black54,
//                                 ),
//                                 border: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colormanager.red,
//                                   ),
//                                   borderRadius: BorderRadius.circular(
//                                     AppPadding.p14,
//                                   ),
//                                 ),
//                                 fillColor: Colormanager.fillcolor,
//                                 filled: true,
//                               ),
//                               validator: (value) {
//                                 return controller.validateEmail(value!);
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(bottom: AppSize.s10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           AppStrings.password,
//                           style: getBoldStyle(color: Colors.black,
//                               fontSize: FontSize.s14),
//                         ),
//                         const SizedBox(
//                           height: AppPadding.p8,
//                         ),
//                         Obx(() =>
//                             TextFormField(
//                               obscureText: controller.obscureText.value,
//                               controller: controller.password,
//                               textInputAction: TextInputAction.done,
//                               style: getBoldStyle(
//                                   color: Colors.black, fontSize: FontSize.s14),
//                               decoration: InputDecoration(
//                                 hintText: AppStrings.hPassword,
//                                 suffixIcon: InkWell(
//                                   onTap: () {
//                                     controller.obscureText.value =
//                                     !controller.obscureText.value;
//                                   },
//                                   child: controller.obscureText.value
//                                       ? Icon(
//                                     Icons.visibility,
//                                     color: Colormanager.black54,
//                                   )
//                                       : Icon(
//                                     Icons.visibility_off,
//                                     color: Colormanager.black54,
//                                   ),
//                                 ),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(
//                                     AppPadding.p14,
//                                   ),
//                                 ),
//                                 fillColor: Colormanager.fillcolor,
//                                 filled: true,
//                               ),
//                               validator: (value) {
//                                 return controller.validatePassword(value!);
//                               },
//                             )),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: AppPadding.p30,
//               ),
//               InkWell(
//                 onTap: () async {
//                   // Call your login method in the controller
//                   await controller.getValidate();
//
//                   // If login is successful, save the session information
//                 },
//                 child: Container(
//                   width: MediaQuery
//                       .of(context)
//                       .size
//                       .width / 2.5,
//                   padding: const EdgeInsets.symmetric(
//                     vertical: AppPadding.p12,
//                   ),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     color: Colormanager.white,
//                   ),
//                   child: Text(
//                     AppStrings.login,
//                     style: getBoldStyle(color: Colormanager.darkPrimary,
//                         fontSize: FontSize.s20),
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: AppPadding.p8,
//                 ),
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   AppStrings.forgetLink,
//                   style: getRegularStyle(
//                       color: Colors.white, fontSize: FontSize.s12),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(
//                   vertical: AppPadding.p4,
//                 ),
//                 child: Row(
//                   children: <Widget>[
//                     const Expanded(
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: AppPadding.p0,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   Get.toNamed(Routes.registerRoute);
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.symmetric(
//                     vertical: AppMargin.m4,
//                   ),
//                   padding: const EdgeInsets.all(
//                     AppPadding.p8,
//                   ),
//                   alignment: Alignment.bottomCenter,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text(AppStrings.donhaveAccount,
//                           style: getBoldStyle(
//                               color: Colors.white, fontSize: FontSize.s12)),
//                       const SizedBox(
//                         width: AppSize.s2,
//                       ),
//                       Text(
//                         AppStrings.register,
//                         style: getBoldStyle(
//                             color: Colors.black, fontSize: FontSize.s14),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],),
//         ),
//       ),
//     );
//   }
// }


//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/controller/login_controller.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/assets_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/routes_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';
//
// import '../resources/size_config.dart';
//
// class LoginView extends StatefulWidget {
//   const LoginView({Key? key}) : super(key: key);
//
//   @override
//   State<LoginView> createState() => _LoginViewState();
// }
//
// class _LoginViewState extends State<LoginView> {
//   final SharedPreferences _prefs = Get.find();
//   final controller = Get.put(LoginController(), permanent: false);
//
//   void initState() {
//     super.initState();
//
//     // Check if the user is already logged in
//     final bool isLoggedIn = _prefs.getBool('isLoggedIn') ?? false;
//
//     // If the user is already logged in, navigate to the home page or any other page
//     if (isLoggedIn) {
//       // Replace 'Home' with the route you want to navigate to after login
//       Get.offNamed(Routes.homeRoute);
//     }else{
//       print("Not logged in");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Check if the user is already logged in
//     final bool isLoggedIn = _prefs.getBool('isLoggedIn') ?? false;
//
//     // If the user is already logged in, navigate to the home page or any other page
//     if (isLoggedIn) {
//       // Replace 'Home' with the route you want to navigate to after login
//       Get.offNamed(Routes.homeRoute);
//     }
//
//     return Scaffold(
//       backgroundColor: Colormanager.darkPrimary,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(
//               horizontal: AppPadding.p20, vertical: AppPadding.p30),
//           child: Column(
//             children: <Widget>[
//               Container(
//                 height: MediaQuery.of(context).size.height / 5,
//                 width: MediaQuery.of(context).size.width / 1.5,
//                 child: Center(
//                   child: Image.asset(ImageAssets.splashLogo),
//                 ),
//               ),
//               Column(
//                 children: <Widget>[
//                   Container(
//                     margin: const EdgeInsets.only(
//                       bottom: AppSize.s16,
//                     ),
//                     child: Form(
//                       key: controller.formKey,
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 58.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               AppStrings.email,
//                               style: getBoldStyle(
//                                   color: Colors.black, fontSize: FontSize.s14),
//                             ),
//                             const SizedBox(
//                               height: AppSize.s16,
//                             ),
//                             TextFormField(
//                               controller: controller.email,
//                               textInputAction: TextInputAction.next,
//                               style: getBoldStyle(
//                                   color: Colors.black, fontSize: FontSize.s14),
//                               textAlign: TextAlign.start,
//                               obscureText: false,
//                               decoration: InputDecoration(
//                                 hintText: AppStrings.hEmail,
//                                 suffixIcon: Icon(
//                                   Icons.email,
//                                   color: Colormanager.black54,
//                                 ),
//                                 border: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colormanager.red,
//                                   ),
//                                   borderRadius: BorderRadius.circular(
//                                     AppPadding.p14,
//                                   ),
//                                 ),
//                                 fillColor: Colormanager.fillcolor,
//                                 filled: true,
//                               ),
//                               validator: (value) {
//                                 return controller.validateEmail(value!);
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(bottom: AppSize.s10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           AppStrings.password,
//                           style: getBoldStyle(
//                               color: Colors.black, fontSize: FontSize.s14),
//                         ),
//                         const SizedBox(
//                           height: AppPadding.p8,
//                         ),
//                         Obx(() => TextFormField(
//                           obscureText: controller.obscureText.value,
//                           controller: controller.password,
//                           textInputAction: TextInputAction.done,
//                           style: getBoldStyle(
//                               color: Colors.black, fontSize: FontSize.s14),
//                           decoration: InputDecoration(
//                             hintText: AppStrings.hPassword,
//                             suffixIcon: InkWell(
//                               onTap: () {
//                                 controller.obscureText.value =
//                                 !controller.obscureText.value;
//                               },
//                               child: controller.obscureText.value
//                                   ? Icon(
//                                 Icons.visibility,
//                                 color: Colormanager.black54,
//                               )
//                                   : Icon(
//                                 Icons.visibility_off,
//                                 color: Colormanager.black54,
//                               ),
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(
//                                 AppPadding.p14,
//                               ),
//                             ),
//                             fillColor: Colormanager.fillcolor,
//                             filled: true,
//                           ),
//                           validator: (value) {
//                             return controller.validatePassword(value!);
//                           },
//                         )),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: AppPadding.p30,
//               ),
//               InkWell(
//                 onTap: () async {
//                   // Call your login method in the controller
//                   await controller.getValidate();
//
//                   // If login is successful, save the session information
//                   if (controller.isLoginSuccess.value) {
//                     // Save the login status to SharedPreferences
//                     _prefs.setBool('isLoggedIn', true);
//
//                     // Navigate to the home page
//                     Get.offNamed(Routes.homeRoute);
//                   }
//                 },
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 2.5,
//                   padding: const EdgeInsets.symmetric(
//                     vertical: AppPadding.p12,
//                   ),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     color: Colormanager.white,
//                   ),
//                   child: Text(
//                     AppStrings.login,
//                     style: getBoldStyle(
//                         color: Colormanager.darkPrimary, fontSize: FontSize.s20),
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: AppPadding.p8,
//                 ),
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   AppStrings.forgetLink,
//                   style: getRegularStyle(
//                       color: Colors.white, fontSize: FontSize.s12),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(
//                   vertical: AppPadding.p4,
//                 ),
//                 child: Row(
//                   children: <Widget>[
//                     const Expanded(
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: AppPadding.p0,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   Get.toNamed(Routes.registerRoute);
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.symmetric(
//                     vertical: AppMargin.m4,
//                   ),
//                   padding: const EdgeInsets.all(
//                     AppPadding.p8,
//                   ),
//                   alignment: Alignment.bottomCenter,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text(AppStrings.donhaveAccount,
//                           style: getBoldStyle(
//                               color: Colors.white, fontSize: FontSize.s12)),
//                       const SizedBox(
//                         width: AppSize.s2,
//                       ),
//                       Text(
//                         AppStrings.register,
//                         style: getBoldStyle(
//                             color: Colors.black, fontSize: FontSize.s14),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//




import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/login_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/assets_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/routes_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

import '../resources/size_config.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController(), permanent: false);
    return Scaffold(
      backgroundColor: Colormanager.darkPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20, vertical:AppPadding.p30),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/1.5,
                  child: Center(
                    child: Image.asset(ImageAssets.splashLogo), //App Logo
                  ),
                ),
              ),
              // const SizedBox(
              //   height:1,//AppSize.s2,
              // ),
              Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: AppSize.s16,
                    ),
                    child: Form(
                      key: controller.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Padding(
                        padding: const EdgeInsets.only(top:58.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppStrings.email,
                              style: getBoldStyle(
                                  color: Colors.black,//Colormanager.darkGrey,
                                  fontSize: FontSize.s14),
                            ),
                            const SizedBox(
                              height: AppSize.s16,
                            ),
                            TextFormField(
                              //Email FormField
                              controller: controller.email,

                              textInputAction: TextInputAction.next,

                              style: getBoldStyle(
                                  color: Colors.black,//Colormanager.darkGrey,
                                  fontSize: FontSize.s14),
                              textAlign: TextAlign.start,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: AppStrings.hEmail,
                                suffixIcon: Icon(
                                  Icons.email,
                                  color: Colormanager.black54,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colormanager.red,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    AppPadding.p14,
                                  ),
                                ),
                                fillColor: Colormanager.fillcolor,
                                filled: true,
                              ),
                              validator: (value) {
                                return controller.validateEmail(value!);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: AppSize.s10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          AppStrings.password,
                          style: getBoldStyle(
                              color: Colors.black,//Colormanager.darkGrey,
                              fontSize: FontSize.s14),
                        ),
                        const SizedBox(
                          height: AppPadding.p8,
                        ),
                        Obx(() => TextFormField(
                          obscureText: controller.obscureText.value,
                          controller: controller.password,
                          textInputAction: TextInputAction.done,
                          style: getBoldStyle(
                              color: Colors.black,//Colormanager.darkGrey,
                              fontSize: FontSize.s14),
                          decoration: InputDecoration(
                            hintText: AppStrings.hPassword,
                            suffixIcon: InkWell(
                              onTap: () {
                                controller.obscureText.value =
                                !controller.obscureText.value;
                              },
                              child: controller.obscureText.value
                                  ? Icon(
                                Icons.visibility,
                                color: Colormanager.black54,
                              )
                                  : Icon(
                                Icons.visibility_off,
                                color: Colormanager.black54,
                              ),
                            ),
                            // icon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                AppPadding.p14,
                              ),
                            ),
                            fillColor: Colormanager.fillcolor,
                            filled: true,
                          ),
                          validator: (value) {
                            return controller.validatePassword(value!);
                          },
                        )),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppPadding.p30,
              ),
              InkWell(
                onTap: () {
                  controller.getValidate();
                },
                child: Container(
                  width: MediaQuery.of(
                    context,
                  ).size.width/2.5,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p12,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),                    // boxShadow: <BoxShadow>[
                    //   BoxShadow(
                    //       color: Colors.grey.shade200,
                    //       offset: const Offset(2, 4),
                    //       blurRadius:10,
                    //       spreadRadius:1),
                    // ],
                    // gradient: LinearGradient(
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    //   colors: [Colors.black, Colormanager.primary],
                    // ),
                    color: Colormanager.white,
                  ),
                  child: Text(
                    AppStrings.login,
                    style: getBoldStyle(
                        color: Colormanager.darkPrimary, fontSize: FontSize.s20),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p8,
                ),
                alignment: Alignment.centerRight,
                child: Text(
                  AppStrings.forgetLink,
                  style: getRegularStyle(
                      color: Colors.white, fontSize: FontSize.s12),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: AppPadding.p4,
                ),
                child: Row(
                  children: <Widget>[
                    // const SizedBox(
                    //   width: AppSize.s16,
                    // ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.p0,
                        ),
                        // child: Divider(
                        //   thickness: AppSize.s1_5,
                        // ),
                      ),
                    ),
                    // Text(
                    //   AppStrings.or,
                    //   style: getBoldStyle(
                    //       color: Colormanager.darkGrey, fontSize: FontSize.s18),
                    // ),
                    // const Expanded(
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(
                    //       horizontal: AppPadding.p4,
                    //     ),
                    //     child: Divider(
                    //       thickness: 2,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     Get.toNamed(Routes.loginPhoneRoute);
              //   },
              //   child: Container(
              //     height: AppSize.s45,
              //     margin: const EdgeInsets.symmetric(
              //       vertical: AppSize.s16,
              //     ),
              //     decoration: const BoxDecoration(
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(
              //           AppSize.s10,
              //         ),
              //       ),
              //     ),
              //     child: Row(
              //       children: <Widget>[
              //         Expanded(
              //           flex: 1,
              //           child: Container(
              //             decoration: BoxDecoration(
              //               color: Colormanager.primary,
              //               borderRadius: const BorderRadius.only(
              //                 bottomLeft: Radius.circular(AppPadding.p4),
              //                 topLeft: Radius.circular(AppPadding.p4),
              //               ),
              //             ),
              //             alignment: Alignment.center,
              //             child: Icon(
              //               Icons.phone,
              //               color: Colormanager.white,
              //             ),
              //           ),
              //         ),
              //         Expanded(
              //           flex: 5,
              //           child: Container(
              //             decoration: BoxDecoration(
              //               color: Colormanager.darkPrimary,
              //               borderRadius: const BorderRadius.only(
              //                 bottomRight: Radius.circular(AppPadding.p4),
              //                 topRight: Radius.circular(AppPadding.p4),
              //               ),
              //             ),
              //             alignment: Alignment.center,
              //             child: Text(
              //               AppStrings.loginWithPhone,
              //               style: getBoldStyle(
              //                   color: Colormanager.white,
              //                   fontSize: FontSize.s14),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.registerRoute);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: AppMargin.m4,
                  ),
                  padding: const EdgeInsets.all(
                    AppPadding.p8,
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(AppStrings.donhaveAccount,
                          style: getBoldStyle(
                            color: Colors.white,
                            fontSize: FontSize.s12,
                          )),
                      const SizedBox(
                        width: AppSize.s2,
                      ),
                      Text(
                        AppStrings.register,
                        style: getBoldStyle(
                          color: Colors.black,//Colormanager.primary,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.transparent,//Colormanager.lightGrey.withOpacity(0.5),
        height: AppSize.s50,
        padding: const EdgeInsets.all(AppPadding.p4),
        width: SizeConfig.screenWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Develop by Creative Software',
              style: getMediumStyle(
                  color: Colormanager.black, fontSize: FontSize.s12),
            ),
            Text(
              'version: 24.0.0.1',
              //Platform.operatingSystemVersion,
              style: getMediumStyle(
                  color: Colormanager.darkGrey, fontSize: FontSize.s14),
            ),
          ],
        ),
      ),
    );
  }
}

