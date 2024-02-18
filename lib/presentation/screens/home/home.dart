import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/dashboard_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/dashboard_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/internetchecker_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/no_internet/internetchecker_view.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/data_loader.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/operation_card_row.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/assets_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';
import 'navigation.dart';

import '../resources/routes_manager.dart';

class HomeView extends GetView<DashboardController> {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController(dashboardApi: DashboardApi()));

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(
            //   height: 20.0,
            // ),
            TopSection(scaffoldKey: scaffoldKey),
            Expanded(
                child: RefreshIndicator(
              onRefresh: () async {
                await controller.getDashboardData();
              },
              child: Obx(
                () => Get.find<InternetcheckerController>()
                            .connectionStatus
                            .value ==
                        1
                    ? controller.obx(
                        (response) => ListView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          shrinkWrap: true,
                          children: [
                            const SizedBox(height: AppSize.s20),
                            OperationCardRow(
                              title1: AppStrings.dComplete,
                              title2: AppStrings.pCancel,
                              header: AppStrings.today,
                              icon1: ImageAssets.list,
                              press1: () {
                                Get.toNamed(Routes.historyOrder);
                              },
                              color1: Colormanager.d1,
                              color2: Colormanager.d2,
                              value1: response!.data!.tDalivery.toString(),
                              value2: response.data!.tCancel.toString(),
                              icon2: ImageAssets.list,
                              press2: () {
                                Get.toNamed(Routes.historyOrder);
                              },
                            ),
                            const SizedBox(
                              height: AppSize.s10,
                            ),
                            OperationCardRow(
                              title1: AppStrings.dreturn,
                              title2: AppStrings.holdandRescheduled,
                              header: AppStrings.today,
                              icon1: ImageAssets.list,
                              press1: () {
                                Get.toNamed(Routes.historyOrder);
                              },
                              color1: Colormanager.d3,
                              color2: Colormanager.d4,
                              value1: response.data!.tReturn.toString(),
                              value2: response.data!.tHoldReschedule.toString(),
                              icon2: ImageAssets.list,
                              press2: () {
                                Get.toNamed(Routes.historyOrder);
                              },
                            ),
                            const SizedBox(
                              height: AppSize.s24,
                            ),
                            OperationCardRow(
                              title1: AppStrings.dComplete,
                              title2: AppStrings.pCancel,
                              header: AppStrings.total,
                              icon1: ImageAssets.list,
                              press1: () {
                                Get.toNamed(Routes.historyOrder);
                              },
                              color1: Colormanager.d1,
                              color2: Colormanager.d2,
                              value1: response.data!.toDalivery.toString(),
                              value2: response.data!.toCancel.toString(),
                              icon2: ImageAssets.list,
                              press2: () {
                                Get.toNamed(Routes.historyOrder);
                              },
                            ),
                            const SizedBox(
                              height: AppSize.s10,
                            ),
                            OperationCardRow(
                              title1: AppStrings.dreturn,
                              title2: AppStrings.holdandRescheduled,
                              header: AppStrings.total,
                              icon1: ImageAssets.list,
                              press1: () {
                                Get.toNamed(Routes.historyOrder);
                              },
                              color1: Colormanager.d3,
                              color2: Colormanager.d4,
                              value1: response.data!.toReturn.toString(),
                              value2:
                                  response.data!.toHoldReschedule.toString(),
                              icon2: ImageAssets.list,
                              press2: () {
                                Get.toNamed(Routes.historyOrder);
                              },
                            ),
                            const SizedBox(
                              height: AppSize.s10,
                            ),
                            OperationCardRow(
                              title1: AppStrings.pProcessing,
                              title2: AppStrings.pComplete,
                              header: AppStrings.total,
                              icon1: ImageAssets.list,
                              press1: () {},
                              color1: Colormanager.d1,
                              color2: Colormanager.d2,
                              value1: response.data!.paymentProcessing!.toStringAsFixed(3) +" TK",
                              value2:
                              response.data!.paymentComplete!.toStringAsFixed(3) +" TK",
                              icon2: ImageAssets.list,
                              press2: () {},
                            ),
                            const SizedBox(height: AppSize.s10),
                          ],
                        ),
                        onEmpty: EmptyFailureNoInternetView(
                          image: ImageAssets.noData,
                          title: AppStrings.noData,
                          description: AppStrings.noDataMsg,
                          buttonText: AppStrings.retry,
                          onPressed: () {
                            controller.getDashboardData();
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
                              controller.getDashboardData();
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
                            controller.getDashboardData();
                          },
                        ),
                      ),
              ),
            )),
          ],
        ),
      ),
      drawer: const NavigationBarDrawer(),
    );
  }

  Future<String?> showAlertCuperutino(
    BuildContext context,
    String msg, [
    String? title,
  ]) async {
    final ok = CupertinoDialogAction(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text("OK"),
    );

    final alert = CupertinoAlertDialog(
      title: title != null ? Text(title) : null,
      content: Text(msg),
      actions: [ok],
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) => alert,
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.openEndDrawer();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
          child: Container(
            margin: const EdgeInsets.all(AppPadding.p12),
            child: Icon(
              Icons.menu,
              color: Colormanager.darkblue,
              size: AppSize.s40,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, Routes.homeRoute);
          },
          // child: Image.asset(
          //   ImageAssets.splashLogo,
          //   height: AppSize.s100,
          // ),

          child: Container(
              height: AppSize.s100,
              child: Center(child: Text('Dashboard', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))),
        ),
        InkWell(
          onTap: () {
            Get.toNamed(Routes.createOrder);
          },
          child: Container(
            margin: const EdgeInsets.all(AppPadding.p12),
            child: Icon(
              Icons.add,
              color: Colormanager.darkblue,
              size: AppSize.s40,
            ),
          ),
        )
      ],
    );
  }
}
