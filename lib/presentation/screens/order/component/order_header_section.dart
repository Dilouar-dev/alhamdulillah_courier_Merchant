import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

import '../../resources/fonts_manager.dart';
import '../../resources/style_manager.dart';

class OrderHeaderSection extends StatelessWidget {
  final String title;
  const OrderHeaderSection({
    Key? key,
    required this.title,
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
            onTap: () => Get.back(),
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
            'Create Order',
            style: getSemiBoldStyle(
                color: Colormanager.white, fontSize: FontSize.s18),
          ),
          const SizedBox()
        ],
      ),
    );
  }
}
