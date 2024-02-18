import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/shop_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

import '../../../../data/model/shopsresponse.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/style_manager.dart';

class ShopCard extends StatelessWidget {
  final Shop shop;
  const ShopCard({
    Key? key,
    required this.shop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSize.s10,
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  shop.shopName.toString(),
                  style: getBoldStyle(
                      color: Colormanager.black, fontSize: FontSize.s16),
                ),
                Text(
                  shop.shopArea.toString(),
                  style: getBoldStyle(
                      color: Colormanager.darkGrey, fontSize: FontSize.s14),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: AppSize.s18,
                  color: Colormanager.lightGrey,
                ),
                const SizedBox(
                  width: AppSize.s10,
                ),
                Expanded(
                  child: Text(
                    shop.shopAddress.toString(),
                    style: getBoldStyle(color: Colormanager.darkGrey),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: AppSize.s18,
                      color: Colormanager.lightGrey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      shop.shopPhone.toString(),
                      style: getBoldStyle(color: Colormanager.darkGrey),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    //When Click Edit Button
                    Get.find<ShopController>().onUpdateShop(shop);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colormanager.darkblue,
                        borderRadius: BorderRadius.circular(AppSize.s4)),
                    padding: const EdgeInsets.symmetric(
                        vertical: AppPadding.p4, horizontal: AppPadding.p8),
                    child: Text(
                      'Edit',
                      style: getSemiBoldStyle(color: Colormanager.white),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: AppSize.s4,
            ),
            Row(
              children: [
                Icon(
                  Icons.link_sharp,
                  size: AppSize.s18,
                  color: Colormanager.lightGrey,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  shop.shopLink ?? '-----',
                  style: getBoldStyle(color: Colormanager.darkGrey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
