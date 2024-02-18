import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

import '../../resources/fonts_manager.dart';
import '../../resources/style_manager.dart';

class ExecutiveHeaderSection extends StatelessWidget {
  const ExecutiveHeaderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p8),
        color: Colormanager.darkPrimary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
            Text(
              AppStrings.shopTitle,
              style: getSemiBoldStyle(
                  color: Colormanager.white, fontSize: FontSize.s18),
            ),
            const SizedBox(),
            // InkWell(
            //   onTap: () {
            //     // final controller = Get.find<ShopController>();
            //     // controller.slectedValue.value = AppStrings.selectBranch;
            //     // controller.selectedBranch = null;
            //     // controller.nameController.clear();
            //     // controller.phoneCOntroller.clear();
            //     // controller.addressController.clear();
            //     // controller.urlController.clear();
            //     // showModal(context, false);
            //   },
            //   child: Container(
            //     margin: const EdgeInsets.only(right: AppMargin.m8),
            //     decoration: BoxDecoration(
            //         color: Colormanager.darkblue, shape: BoxShape.circle),
            //     child: Icon(
            //       Icons.add,
            //       color: Colormanager.white,
            //       size: AppSize.s35,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
