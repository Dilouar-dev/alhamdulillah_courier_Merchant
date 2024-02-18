import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:alhamdulillah_courier_service_merchant/presentation/controller/shop_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/no_internet/internetchecker_view.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/data_loader.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/assets_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/shop/component/shop_card.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/shop/component/shop_header_section.dart';

import '../../controller/internetchecker_controller.dart';

class CreateShopView extends GetView<ShopController> {
  const CreateShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colormanager.white,
        body: SafeArea(
          child: Column(
            children: [
              const ShopHeaderSection(),
              const SizedBox(
                height: AppSize.s16,
              ),
              Expanded(
                child: Obx(
                  () => Get.find<InternetcheckerController>()
                              .connectionStatus
                              .value ==
                          1
                      ? RefreshIndicator(
                          onRefresh: () async {
                            await controller.getShops();
                          },
                          child: controller.obx(
                            (shops) => ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return ShopCard(
                                    shop: shops[index],
                                  );
                                },
                                separatorBuilder: ((context, index) =>
                                    const Divider()),
                                itemCount: shops!.length),
                            onEmpty: EmptyFailureNoInternetView(
                              image: ImageAssets.noData,
                              title: AppStrings.noData,
                              description: AppStrings.noDataMsg,
                              buttonText: AppStrings.retry,
                              onPressed: () {
                                controller.getShops();
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
                                  controller.getShops();
                                },
                              ),
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
                              controller.getShops();
                            },
                          ),
                        ),
                ),
              )
            ],
          ),
        ));
  }
}
