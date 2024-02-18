import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/details_return_history_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/internetchecker_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/no_internet/internetchecker_view.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/data_loader.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/payment_history/components/payment_details_history_header.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/assets_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/return_history/components/return_detais_card.dart';

class ReturnDetailHistoryView extends GetView<DetailsReturnHistoryController> {
  const ReturnDetailHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const PaymentDetailHistoryHeader(
              title: 'Return Details',
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Expanded(
                child: RefreshIndicator(
              onRefresh: () async {
                await controller.getPaymentHistoryDetails();
              },
              child: Obx(
                () => Get.find<InternetcheckerController>()
                            .connectionStatus
                            .value ==
                        1
                    ? controller.obx(
                        (response) => ListView.builder(
                            itemCount: response!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                ReturnDetailsCard(order: response[index])),
                        onEmpty: EmptyFailureNoInternetView(
                          image: ImageAssets.noData,
                          title: AppStrings.noData,
                          description: AppStrings.noDataMsg,
                          buttonText: AppStrings.retry,
                          onPressed: () {
                            controller.getPaymentHistoryDetails();
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
                              // controller.getDetails();
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
                            controller.getPaymentHistoryDetails();
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
