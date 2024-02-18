import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:alhamdulillah_courier_service_merchant/data/model/return_history_reponse.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/return_history_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/details_return_history_controller.dart';
//import 'package:alhamdulillah_courier_service_merchant/presentation/controller/details_return_history_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/routes_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

import '../../resources/fonts_manager.dart';

class ReturnHistoryCard extends StatelessWidget {
  final ReturnOrder order;
  const ReturnHistoryCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSize.s10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: Column(
          children: [
            const SizedBox(
              height: AppSize.s10,
            ),
            buildRow(name: 'Invoice No', value: order.invoiceId.toString()),
            const SizedBox(
              height: AppSize.s10,
            ),
            buildRow(name: 'Businness Name', value: order.merchant!.name.toString()),
            const SizedBox(
              height: AppSize.s10,
            ),
            buildRow(name: 'Shop Name', value: order.businessName.toString()),
            const SizedBox(
              height: AppSize.s10,
            ),
            buildRow(name: 'Rider Name', value: order.rider!.name.toString()),
            const SizedBox(
              height: AppSize.s10,
            ),
            buildRow(name: 'Status', value: order.status.toString()),
            const SizedBox(
              height: AppSize.s10,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    order.createdAt.toString(),
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s15),
                  ),
                ),
               /* Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.put<DetailsReturnHistoryController>(
                          DetailsReturnHistoryController(
                              returnHistoryApi: ReturnHistoryApi(),
                              invoiceId: order.invoiceId!.toString()));
                      Get.toNamed(Routes.historyReturnDetails);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'More Details',
                          style: getSemiBoldStyle(
                              color: Colormanager.primary,
                              fontSize: FontSize.s15),
                        ),
                        const SizedBox(
                          width: AppSize.s4,
                        ),
                        Icon(
                          Icons.read_more,
                          color: Colormanager.darkPrimary,
                        )
                      ],
                    ),
                  ),
                ),*/
              ],
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
          ],
        ),
      ),
    );
  }

  Row buildRow({required String? name, required String? value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            name.toString(),
            style: getSemiBoldStyle(
                color: Colormanager.darkGrey, fontSize: FontSize.s15),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            ': $value'.toString(),
            style: getSemiBoldStyle(
                color: Colormanager.darkGrey, fontSize: FontSize.s15),
          ),
        ),
      ],
    );
  }
}
