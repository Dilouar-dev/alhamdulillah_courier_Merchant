import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/order_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/size_config.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

searchOrderModal(context) {
  final controller = Get.find<OrderController>();
  TextEditingController searchController = TextEditingController();

  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colormanager.white,
    builder: (BuildContext context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: AppSize.s18,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Text(
                    "Search Orders",
                    style: getBoldStyle(
                      color: Colors.black,
                      fontSize: FontSize.s18,
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.clear,
                      size: AppSize.s28,
                      color: Colormanager.darkPrimary,
                    ),
                  )
                ],
              ),
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search by Tracking ID',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.s8),
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s4),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: AppMargin.m16,
                ),
                width: SizeConfig.screenWidth,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    controller.getSearchOrders(searchQuery: searchController.text);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p14,
                    ),
                    child: Text(
                      'Search',
                      style: getSemiBoldStyle(color: Colormanager.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
