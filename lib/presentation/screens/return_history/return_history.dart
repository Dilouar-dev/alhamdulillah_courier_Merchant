import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/internetchecker_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/return_history_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/no_internet/internetchecker_view.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/data_loader.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/assets_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/return_history/components/return_history_card.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/return_history/components/return_history_header.dart';

class ReturnHistoryView extends GetView<ReturnHistoryController> {
  const ReturnHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const ReturntHistoryHeader(),
            const SizedBox(
              height: AppSize.s10,
            ),
            Expanded(
                child: RefreshIndicator(
              onRefresh: () async {
                await controller.getReturnHistories();
              },
              child: Obx(
                () => Get.find<InternetcheckerController>()
                            .connectionStatus
                            .value ==
                        1
                    ? controller.obx(
                        (response) => response == null
                            ? EmptyFailureNoInternetView(
                                image: ImageAssets.noData,
                                title: AppStrings.noData,
                                description: AppStrings.noDataMsg,
                                buttonText: AppStrings.retry,
                                onPressed: () {
                                  controller.getReturnHistories();
                                },
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    ReturnHistoryCard(
                                  order: response[index],
                                ),
                                itemCount: response.length,
                              ),
                        onEmpty: EmptyFailureNoInternetView(
                          image: ImageAssets.noData,
                          title: AppStrings.noData,
                          description: AppStrings.noDataMsg,
                          buttonText: AppStrings.retry,
                          onPressed: () {
                            controller.getReturnHistories();
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
                              controller.getReturnHistories();
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
                            controller.getReturnHistories();
                          },
                        ),
                      ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
