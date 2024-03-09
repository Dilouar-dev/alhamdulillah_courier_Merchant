import 'dart:convert';
import 'dart:ffi';

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
import 'package:http/http.dart' as http;

import '../resources/routes_manager.dart';

class HomeView extends GetView<DashboardController> {



  var dashboardData = {}.obs;
  // Future<Map<String, dynamic>> dashboardFuture; // Initialize with null
  Future<Map<String, dynamic>>? dashboardFuture = null;

  Map<String, dynamic>? responseData;
  String? errorMessage;

  bool isLoading = false;




  Future<void> fetchData() async {
    final url = 'https://system.alhamdulillahcourierservice.com/api/merchantdashboard';

    // Define your headers here
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjdkZjE3ZDgzZTYzYWE2MmE2Y2QwZGE1YzNjOGMwZGE2Zjk2NTJkMzQzMmRkMzE4MWNiYjdhNmI2YjkxZDg0MzQ5MWU5ZjdhMzBlZWE2MjcwIn0.eyJhdWQiOiIxNCIsImp0aSI6IjdkZjE3ZDgzZTYzYWE2MmE2Y2QwZGE1YzNjOGMwZGE2Zjk2NTJkMzQzMmRkMzE4MWNiYjdhNmI2YjkxZDg0MzQ5MWU5ZjdhMzBlZWE2MjcwIiwiaWF0IjoxNzA5MTAyNjU4LCJuYmYiOjE3MDkxMDI2NTgsImV4cCI6MTc0MDcyNTA1OCwic3ViIjoiMTA1OCIsInNjb3BlcyI6W119.RcXx6nhqun7lAPZoEdcvXLGdnuFgMBB23RJM4GpY0c3qoM7MGH-iAClD5geVYushfbaVFFdPtUGgQhOEWIeZ8sXqn_7egOYbn6SVlIfltCzTnNKuinN6sMpgzfGOtY_ulwgreVyzSMerqlEtejb-xD5syl8cjFglG5zbPLFQ_faHHpKKsRhNDGiqQMBiMQ_der78KoMDvA5lumhm3oWYVMhM3P9if9KycTdh2ZP-q8Nu3UDvcLQsQWg-bQl6HyNyqj1jcN7YMgy3obrs1cqcpkGVcwSJ8yuWrz46xK-FaRXDK4B7H0ZR-VdyWqSWvNSdoufv9WUdcg0wNfd6huceAIEtgboOHl13jn17dMmd7MGGUYKku8mTvejtWLvwQ45Wh40nyQ2-RjpXY5U3d0Vssa5DYITxJ4YTg34p7dX41LWXwsBVunn1eaAhtYpqh75G7V6h0gGTEY8nkijoc9S5hh1YxWnzACyayeSZ7yz2AwhQdG9FhyEJdY7hMfIlinh611uoiXdlZ8JvhHJZdgPywQs0eOYGdKWApKXd95eTmyMsVDCX3uk3Z5jqOM1eG0xuU20HH8aZhCsicM2yBN1G7L0b8pFe8FZ2FHnbJYAErI5YE-rXCQE25FEzs3MdJCP42kqwe52oF5-M9y2r2MdAkjUCtxs0anrIObCuiEWS7J8'
    };
    isLoading = true;

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final contentType = response.headers['content-type'];
      print('Content-Type: $contentType'); // Print content type in console
      if (contentType != null && contentType.contains('application/json')) {
        responseData = jsonDecode(response.body); // Update responseData value
        errorMessage = 'Unexpected'; // Clear errorMessage by assigning an empty string
        print(response.body); // Print response body in console
      } else {
        errorMessage = 'Unexpected response format'; // Update errorMessage
        print('Unexpected response format');
        print(response.body); // Print error response body in console
      }
    } else {
      errorMessage= 'Failed to load data: ${response.statusCode}'; // Update errorMessage
      print('Failed to load data: ${response.statusCode}');
      print(response.body); // Print error response body in console
    }
  }







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

                        // if (responseData != null) {
                        (response) => ListView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          shrinkWrap: true,
                          children: [
                            const SizedBox(height: AppSize.s20),
                            OperationCardRow(
                              title1: AppStrings.dComplete,
                              title2: AppStrings.transit,
                              header: AppStrings.today,
                              icon1: ImageAssets.list,
                              press1: () {
                                Get.toNamed(Routes.historyOrder);
                              },
                              color1: Colormanager.d1,
                              color2: Colormanager.d2,
                              value1: response!.data!.tDalivery.toString(),
                              value2: response.data!.tCancel.toString(),
                              value3: '3',
                              value4: '4',
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
                              title2: AppStrings.dComplete,
                              header: AppStrings.today,
                              icon1: ImageAssets.list,
                              press1: () {
                                Get.toNamed(Routes.historyOrder);
                              },
                              color1: Colormanager.d3,
                              color2: Colormanager.d4,
                              value1: response.data!.tReturn.toString(),
                              value2: response.data!.tHoldReschedule.toString(),
                              value3: dashboardData['today_order'].toString(),//'3',
                              value4: dashboardData['total_order'].toString(),//'4',
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
                              title2: AppStrings.dComplete,
                              header: AppStrings.total,
                              icon1: ImageAssets.list,
                              press1: () {
                                Get.toNamed(Routes.historyOrder);
                              },
                              color1: Colormanager.d1,
                              color2: Colormanager.d2,
                              value1: response.data!.toDalivery.toString(),
                              value2: response.data!.toCancel.toString(),
                              value3: '3',
                              value4: '4',
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
                              title2: AppStrings.dComplete,
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
                              value3: '3',
                              value4: '4',
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
                              value3: dashboardData['paymentProcessing'].toString(),//'3',
                              value4: '',//dashboardData['paymentComplete'].toString(),//'4',
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
