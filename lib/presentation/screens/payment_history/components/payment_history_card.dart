import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/payment_history_response.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/payment_history_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/details_payment_history_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/payment_history/payment_history.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/routes_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

import '../../resources/fonts_manager.dart';

class PaymentCard extends StatefulWidget {
  final Payment payment;

  const PaymentCard({super.key, required this.payment});

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'INVOICE NO',
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s15),
                  ),
                ),
                Expanded(
                  child: Text(
                    ': ${widget.payment.invoiceId}',
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s15),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'PREVIOUS DUE',
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s15),
                  ),
                ),
                Expanded(
                  child: Text(
                    ': ${widget.payment.tCurrentDue}',
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s15),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'TOTAL PAY',
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s15),
                  ),
                ),
                Expanded(
                  child: Text(
                    ': ${widget.payment.tPayable}',
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s15),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'STATUS',
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s15),
                  ),
                ),
                Expanded(
                  child: Text(
                    ': ${widget.payment.status}',
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s15),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  // child: Text(
                  //   widget.payment.createdAt.toString(),
                  //   style: getSemiBoldStyle(
                  //       color: Colormanager.darkGrey, fontSize: FontSize.s15),
                  // ),
                  child: Text(
                    DateFormat.yMd().add_jm().format(
                      DateTime.parse(widget.payment.createdAt ?? DateTime.now().toString()),
                    ),
                    style: getSemiBoldStyle(
                      color: Colormanager.darkGrey,
                      fontSize: FontSize.s15,
                    ),
                  ),
                ),
                // Expanded(
                //   child: InkWell(
                //     onTap: () {
                //        Get.putAsync<DetailsPaymentHistoryController>(() async=>
                //           DetailsPaymentHistoryController(
                //               paymentHistoryApi: PaymentHistoryApi(),
                //               invoiceId: widget.payment.invoiceId.toString()));
                //       Get.toNamed(Routes.detailsHistoryPayment);
                //     },
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.end,
                //       children: [
                //         Text(
                //           'More Details',
                //           style: getSemiBoldStyle(
                //               color: Colormanager.primary,
                //               fontSize: FontSize.s15),
                //         ),
                //         const SizedBox(
                //           width: AppSize.s4,
                //         ),
                //         Icon(
                //           Icons.read_more,
                //           color: Colormanager.darkPrimary,
                //         )
                //       ],
                //     ),
                //   ),
                // ),
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
}
