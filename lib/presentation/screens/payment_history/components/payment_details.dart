import 'package:flutter/material.dart';

import 'package:alhamdulillah_courier_service_merchant/data/model/details_payment_history_reponse.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/payment_history/components/dettails_card.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

class PaymentDetailsComponent extends StatelessWidget {
  final DetailsHistoryPaymentResponse response;
  const PaymentDetailsComponent({
    super.key,
    required this.response,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p12, horizontal: AppPadding.p4),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Center(
            //   child: Image.asset(
            //     ImageAssets.splashLogo,
            //     height: AppSize.s100,
            //   ), //App Logo
            // ),
            const SizedBox(
              height: AppSize.s20,
            ),
            Text(
              'Merchant Payment Details',
              style: getBoldStyle(
                  color: Colormanager.black, fontSize: FontSize.s18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Invoice no: ',
                  style: getSemiBoldStyle(
                      color: Colormanager.black, fontSize: FontSize.s14),
                ),
                Text(
                  '${response.merchantPay!.invoiceId}',
                  style: getSemiBoldStyle(
                      color: Colormanager.darkPrimary, fontSize: FontSize.s14),
                ),
              ],
            ),
            Text(
              'Status: ${response.merchantPay!.status}',
              style: getSemiBoldStyle(
                  color: Colormanager.black, fontSize: FontSize.s14),
            ),
            const Divider(),
            const SizedBox(
              height: AppSize.s18,
            ),
            ListView.separated(
              itemBuilder: (context, index) => DetailsCard(
                order: response.orders![index],
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: response.orders!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
            const SizedBox(
              height: AppSize.s18,
            ),
            Text(
              'Total Merchant pay',
              style: getBoldStyle(
                  color: Colormanager.black,
                  fontSize: FontSize.s18,
                  textDecoration: TextDecoration.underline),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colormanager.darkGrey)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(
                      // textDirection: TextDirection.rtl,
                      // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                      border: TableBorder.all(width: 1.0),
                      children: [
                        TableRow(children: [
                          Text(
                            "Cod",
                            textAlign: TextAlign.center,
                            textScaleFactor: 1.1,
                            style: getSemiBoldStyle(
                                color: Colormanager.black,
                                fontSize: FontSize.s14),
                          ),
                          Text(
                            "Insurance",
                            textAlign: TextAlign.center,
                            textScaleFactor: 1.1,
                            style: getSemiBoldStyle(
                                color: Colormanager.black,
                                fontSize: FontSize.s14),
                          ),
                          Text(
                            "Delivery",
                            textAlign: TextAlign.center,
                            textScaleFactor: 1.1,
                            style: getSemiBoldStyle(
                                color: Colormanager.black,
                                fontSize: FontSize.s14),
                          ),
                          Text(
                            "Return",
                            textAlign: TextAlign.center,
                            textScaleFactor: 1.1,
                            style: getSemiBoldStyle(
                                color: Colormanager.black,
                                fontSize: FontSize.s14),
                          ),
                        ]),
                        TableRow(children: [
                          Text(
                            '${response.tCod}৳',
                            textAlign: TextAlign.center,
                            textScaleFactor: 1.1,
                            style: getRegularStyle(
                                color: Colormanager.black,
                                fontSize: FontSize.s14),
                          ),
                          Text(
                            '${response.tInsurance}৳',
                            textAlign: TextAlign.center,
                            textScaleFactor: 1.1,
                            style: getRegularStyle(
                                color: Colormanager.black,
                                fontSize: FontSize.s14),
                          ),
                          Text(
                            '${response.tDelivery}৳',
                            textAlign: TextAlign.center,
                            textScaleFactor: 1.1,
                            style: getRegularStyle(
                                color: Colormanager.black,
                                fontSize: FontSize.s14),
                          ),
                          Text(
                            '${response.tReturnCharge}৳',
                            textAlign: TextAlign.center,
                            textScaleFactor: 1.1,
                            style: getRegularStyle(
                                color: Colormanager.black,
                                fontSize: FontSize.s14),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  buildRow2(
                      name: ' Totlal Callection',
                      value: '${response.tCollect}৳'),
                  buildRow2(
                      name: 'Service Change(-)',
                      value:
                          '${response.tCod!.toInt() + response.tInsurance!.toInt() + response.tDelivery!.toInt() + response.tReturnCharge!.toInt()}৳'),
                  const Divider(),
                  buildRow2(name: 'Payable', value: '${response.tPayable}৳'),
                  buildRow2(
                      name: ' Previous Advanced(-)',
                      value: '${response.merchantPay!.tCurrentDue}৳'),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'MERCHANT PAY',
                          style: getSemiBoldStyle(
                              color: Colormanager.darkPrimary,
                              fontSize: FontSize.s16),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ': ${(response.tPayable!.toInt() - response.merchantPay!.tCurrentDue!.toInt()).toString()}৳',
                          style: getSemiBoldStyle(
                              color: Colormanager.darkPrimary,
                              fontSize: FontSize.s16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Text(
              'Payment Method',
              style: getBoldStyle(
                  color: Colormanager.black,
                  fontSize: FontSize.s18,
                  textDecoration: TextDecoration.underline),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colormanager.darkGrey)),
              child: paymentInfo(response.paymentInfo!),
            )
          ],
        ),
      ),
    );
  }

  Widget paymentInfo(PaymentInfo response) {
    return response == null
        ? const Center()
        : response.pType!.toLowerCase() == 'bank'
            ? Column(
                children: [
                  buildRow(
                      name: 'Account Holder Name',
                      value: response.accountHolderName),
                  buildRow(name: 'Bank Name', value: response.bankName),
                  buildRow(name: 'Branch Name', value: response.branchName),
                  buildRow(name: 'Account Type', value: response.accountType),
                  buildRow(name: 'Account No', value: response.accountNumber),
                  buildRow(name: 'Routing No', value: response.routingNumber),
                ],
              )
            : Column(
                children: [
                  buildRow(name: 'Mobile Banking', value: response.pType),
                  buildRow(name: 'Account Type', value: response.mbType),
                  buildRow(name: 'Mobile Number', value: response.mbNumber),
                ],
              );
  }

  Padding buildRow({required String? name, required String? value}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0.0,
        top: 10,
      ),
      child: Row(
        children: [
          Text(
            '$name :   ',
            style: getSemiBoldStyle(
                color: Colormanager.black, fontSize: FontSize.s14),
          ),
          Expanded(
            child: Text(
              value.toString(),
              style: getSemiBoldStyle(
                  color: Colormanager.black, fontSize: FontSize.s14),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildRow2({
    required String? name,
    required String? value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0.0,
        top: AppPadding.p4,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$name',
              style: getSemiBoldStyle(
                  color: Colormanager.black, fontSize: FontSize.s14),
            ),
          ),
          Expanded(
            child: Text(
              ': $value',
              style: getSemiBoldStyle(
                  color: Colormanager.black, fontSize: FontSize.s14),
            ),
          ),
        ],
      ),
    );
  }
}
