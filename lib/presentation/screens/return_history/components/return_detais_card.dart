import 'package:flutter/material.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/return_history_details_response.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

class ReturnDetailsCard extends StatelessWidget {
  final ROrder order;
  const ReturnDetailsCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSize.s10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.trackingId.toString(),
                  style: getBoldStyle(
                      color: Colormanager.black, fontSize: FontSize.s15),
                ),
                Text(
                  'Invoice Value ${order.collection}৳',
                  style: getBoldStyle(
                      color: Colormanager.black, fontSize: FontSize.s15),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    AppStrings.customer,
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s15),
                  ),
                ),
                Expanded(
                  child: Text(
                    AppStrings.mobile,
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s15),
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
                Expanded(
                  child: Text(
                    order.customerName.toString(),
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s15),
                  ),
                ),
                Expanded(
                  child: Text(
                    order.customerPhone.toString(),
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s15),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p14),
                  child: Icon(
                    Icons.circle,
                    color: Colormanager.primary,
                    size: AppSize.s10,
                  ),
                ),
                Expanded(
                  child: Text(
                    order.customerAddress.toString(),
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s14),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p14),
                  child: Icon(
                    Icons.circle,
                    color: Colormanager.darkblue,
                    size: AppSize.s10,
                  ),
                ),
                Expanded(
                  child: Text(
                    '${order.shop}',
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s14),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s8,
            ),
            if (order.pStatus != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: AppPadding.p14),
                    child: Icon(
                      Icons.circle,
                      color: Colormanager.darkblue,
                      size: AppSize.s10,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Partially Order Delivered',
                      style: getSemiBoldStyle(
                          color: Colormanager.darkGrey, fontSize: FontSize.s14),
                    ),
                  ),
                ],
              ),
            const SizedBox(
              height: AppSize.s8,
            ),
            if (order.pStatus == null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: AppPadding.p14),
                    child: Icon(
                      Icons.circle,
                      color: Colormanager.darkblue,
                      size: AppSize.s10,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${order.status}',
                      style: getSemiBoldStyle(
                          color: Colormanager.darkGrey, fontSize: FontSize.s14),
                    ),
                  ),
                ],
              ),
            const SizedBox(
              height: AppSize.s8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p14),
                  child: Icon(
                    Icons.circle,
                    color: Colormanager.darkblue,
                    size: AppSize.s10,
                  ),
                ),
                Expanded(
                  child: Text(
                    '${order.returnCharge}৳ Return Charge',
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s14),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p14),
                  child: Icon(
                    Icons.circle,
                    color: Colormanager.darkblue,
                    size: AppSize.s10,
                  ),
                ),
                Expanded(
                  child: Text(
                    '${order.collect}৳ Collect',
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s14),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    order.createdAt.toString(),
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s14),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colormanager.primaryOpacity70,
                      borderRadius: BorderRadius.circular(AppSize.s4)),
                  padding: const EdgeInsets.all(AppPadding.p4),
                  child: Text(
                    'RETURN',
                    style: getSemiBoldStyle(
                        color: Colormanager.white, fontSize: FontSize.s14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
