import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/user_info.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/internetchecker_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/profile_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/no_internet/internetchecker_view.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/data_loader.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/assets_manager.dart';

import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/routes_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/size_config.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

class ProfileView extends GetView<PofileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Info',
          style: getSemiBoldStyle(
              color: Colormanager.white, fontSize: FontSize.s18),
        ),
      ),
      body: RefreshIndicator(
          onRefresh: () async {
            controller.getUserInfos();
          },
          child: Obx(() => Get.find<InternetcheckerController>()
                      .connectionStatus
                      .value ==
                  1
              ? controller.obx(
                  (response) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: ListView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: SizeConfig.screenHight! / 3.1,
                          //color: Colors.blue,

                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  //width: size.height/2,
                                  height: SizeConfig.screenHight! / 6.2,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                    ),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.grey.withOpacity(0.1),
                                    //     spreadRadius: 2,
                                    //     //blurRadius: 7,
                                    //     offset:
                                    //     Offset(0, 0), // changes position of shadow
                                    //   ),
                                    // ]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "Merchant",
                                          style: TextStyle(fontSize: 22),
                                        ),
                                        //Text("mahmudul@gmail.com",style: TextStyle(color: Colors.red,fontSize: 18))
                                      ],
                                    ),
                                  ),
                                  //color: Colors.blue,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                left: 0,
                                top: -55,
                                child: Container(
                                  height: SizeConfig.screenWidth! / 3.4,
                                  width: SizeConfig.screenWidth! / 3.4,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      //style: BorderStyle.solid,
                                      width: AppPadding.p4,
                                    ),
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    image: const DecorationImage(
                                      image: AssetImage(ImageAssets.splashLogo),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            //width: 400,
                            alignment: Alignment.topLeft,
                            // color: Colors.black12,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.withOpacity(0.1),
                              //     spreadRadius: 2,
                              //     //blurRadius: 7,
                              //     offset: Offset(0, 0), // changes position of shadow
                              //   ),
                              // ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Personal Info",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colormanager.darkPrimary),
                                    ),
                                    buildRow(
                                        name: 'Merchant Name',
                                        value: response!.user!.name),
                                    buildRow(
                                        name: 'Business Name',
                                        value: response.user!.businessName),
                                    if (response.user!.mobile!.isNotEmpty)
                                      buildRow(
                                          name: 'Mobile',
                                          value: response.user!.mobile),
                                    if (response.user!.email!.isNotEmpty)
                                      buildRow(
                                          name: 'Email',
                                          value: response.user!.email),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0),
                                    ),
                                    Text(
                                      "Payment Info",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colormanager.darkPrimary),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Divider(
                                        thickness: 2,
                                      ),
                                    ),
                                    paymentInfo(response),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 0.0),
                                      child: Divider(
                                        thickness: 2,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        '${response.user!.area},${response.user!.address}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  onEmpty: EmptyFailureNoInternetView(
                    image: ImageAssets.noData,
                    title: AppStrings.noData,
                    description: AppStrings.noDataMsg,
                    buttonText: AppStrings.retry,
                    onPressed: () {
                      controller.getUserInfos();
                    },
                  ),
                  onLoading: const DataLoader(),
                  onError: (error) => SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: EmptyFailureNoInternetView(
                      image: ImageAssets.noData,
                      title: AppStrings.error,
                      description: error.toString(),
                      buttonText: AppStrings.retry,
                      onPressed: () {
                        controller.getUserInfos();
                      },
                    ),
                  ),
                )
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  child: EmptyFailureNoInternetView(
                    image: ImageAssets.noInternet,
                    title: AppStrings.noInternet,
                    description: AppStrings.checkConnection,
                    buttonText: AppStrings.retry,
                    onPressed: () {
                      controller.getUserInfos();
                    },
                  ),
                ))),
    );
  }

  Widget paymentInfo(UserInfoResponse response) {
    return response.payment == null
        ? ElevatedButton(
            onPressed: () {
              Get.offNamed(Routes.payment);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 248, 106, 11)),
            child: Text(
              "Add Payment Info",
              style: TextStyle(fontSize: 20, color: Colormanager.white),
            ))
        : response.payment!.pType!.toLowerCase() == 'bank'
            ? Column(
                children: [
                  buildRow(
                      name: 'Account Holder Name',
                      value: response.payment!.accountHolderName),
                  buildRow(
                      name: 'Bank Name', value: response.payment!.bankName),
                  buildRow(
                      name: 'Branch Name', value: response.payment!.branchName),
                  buildRow(
                      name: 'Account Type',
                      value: response.payment!.accountType),
                  buildRow(
                      name: 'Account No',
                      value: response.payment!.accountNumber),
                  buildRow(
                      name: 'Routing No',
                      value: response.payment!.routingNumber),
                ],
              )
            : Column(
                children: [
                  buildRow(
                      name: 'Mobile Banking', value: response.payment!.pType),
                  buildRow(
                      name: 'Account Type', value: response.payment!.mbType),
                  buildRow(
                      name: 'Mobile Number', value: response.payment!.mbNumber),
                ],
              );
  }

  Padding buildRow({required String? name, required String? value}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0.0,
        top: 20,
      ),
      child: Row(
        children: [
          Text(
            '$name :   ',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
