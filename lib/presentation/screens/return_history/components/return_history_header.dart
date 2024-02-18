import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/return_history/components/history_filter.dart';

import '../../resources/fonts_manager.dart';
import '../../resources/style_manager.dart';

class ReturntHistoryHeader extends StatelessWidget {
  const ReturntHistoryHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      color: Colormanager.darkPrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){Get.back();},
            //onTap: () => Get.back(),
            child: Row(
              children: [
                const SizedBox(
                  width: AppSize.s10,
                ),
                Icon(
                  Icons.arrow_back_ios,
                  color: Colormanager.white,
                  semanticLabel: 'Back',
                  size: AppSize.s22,
                ),
                Text(
                  AppStrings.back,
                  style: getSemiBoldStyle(
                      color: Colormanager.white, fontSize: FontSize.s18),
                )
              ],
            ),
          ),
          Text(
            AppStrings.historyReturn,
            style: getSemiBoldStyle(
                color: Colormanager.white, fontSize: FontSize.s18),
          ),
          InkWell(
            onTap: () {
              showReturnHistoryModel(context);
            },
            child: Container(
              margin: const EdgeInsets.only(right: AppMargin.m8),
              decoration: BoxDecoration(
                  color: Colormanager.darkblue, shape: BoxShape.circle),
              child: Icon(
                Icons.filter_list_sharp,
                color: Colormanager.white,
                size: AppSize.s35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
