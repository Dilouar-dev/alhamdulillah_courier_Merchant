import 'package:flutter/material.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

import '../../../../data/model/details_payment_history_reponse.dart';

class DetailsCard extends StatelessWidget {
  final Order order;
  const DetailsCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Shop Name',
                  style: getSemiBoldStyle(
                      color: Colormanager.darkGrey,
                      fontSize: FontSize.s15,
                      textDecoration: TextDecoration.underline),
                ),
              ),
              Expanded(
                child: Text(
                  '${order.trackingId}',
                  textAlign: TextAlign.end,
                  style: getBoldStyle(
                      color: Colormanager.darkPrimary, fontSize: FontSize.s15),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  order.shop.toString(),
                  style: getSemiBoldStyle(
                      color: Colormanager.darkGrey, fontSize: FontSize.s15),
                ),
              ),
              Expanded(
                child: Text(
                  '',
                  style: getSemiBoldStyle(
                      color: Colormanager.darkGrey, fontSize: FontSize.s15),
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
                  color: Colormanager.primaryOpacity70,
                  size: AppSize.s10,
                ),
              ),
              Expanded(
                child: Text(
                  '${order.cod}৳ cod',
                  style: getSemiBoldStyle(
                      color: Colormanager.darkGrey, fontSize: FontSize.s14),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: AppPadding.p14),
                child: Icon(
                  Icons.circle,
                  color: Colormanager.primaryOpacity70,
                  size: AppSize.s10,
                ),
              ),
              Expanded(
                child: Text(
                  '${order.insurance}৳ insurance',
                  style: getSemiBoldStyle(
                      color: Colormanager.darkGrey, fontSize: FontSize.s14),
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
              Padding(
                padding: const EdgeInsets.only(right: AppPadding.p14),
                child: Icon(
                  Icons.circle,
                  color: Colormanager.primaryOpacity70,
                  size: AppSize.s10,
                ),
              ),
              Expanded(
                child: Text(
                  '${order.returnCharge}৳ return charge',
                  style: getSemiBoldStyle(
                      color: Colormanager.darkGrey, fontSize: FontSize.s14),
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
              Padding(
                padding: const EdgeInsets.only(right: AppPadding.p14),
                child: Icon(
                  Icons.circle,
                  color: Colormanager.primaryOpacity70,
                  size: AppSize.s10,
                ),
              ),
              Expanded(
                child: Text(
                  '${order.colection}৳ invoice value',
                  style: getSemiBoldStyle(
                      color: Colormanager.darkGrey, fontSize: FontSize.s14),
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
              Padding(
                padding: const EdgeInsets.only(right: AppPadding.p14),
                child: Icon(
                  Icons.circle,
                  color: Colormanager.primaryOpacity70,
                  size: AppSize.s10,
                ),
              ),
              Expanded(
                child: Text(
                  '${order.collect}৳ Collection',
                  style: getSemiBoldStyle(
                      color: Colormanager.darkGrey, fontSize: FontSize.s14),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s5,
          ),
        ],
      ),
    );
  }
}
