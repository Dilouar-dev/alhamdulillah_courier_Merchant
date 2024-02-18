import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/payment_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/payment/components/bank_components.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/payment/components/mobile_banking_components.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(),
        title: Text(
          "Add Payment Info",
          style: getSemiBoldStyle(
              color: Colormanager.white, fontSize: FontSize.s18),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration:
              BoxDecoration(color: Colormanager.darkGrey.withOpacity(0.1)),
          child: Obx(
            () => Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Payment Method',
                              style: getSemiBoldStyle(
                                  color: Colormanager.darkGrey,
                                  fontSize: AppSize.s16),
                            ),
                            TextSpan(
                              text: '*',
                              style: getSemiBoldStyle(
                                  color: Colormanager.red,
                                  fontSize: AppSize.s16),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s4,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p12),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colormanager.darkGrey,
                              width: AppSize.s1_5),
                          borderRadius: BorderRadius.circular(AppSize.s10),
                        ),
                        child: DropdownButton(
                          // Initial Value
                          value: controller.selectPaymenttype.value,

                          // Down Arrow Icon
                          icon: Padding(
                            padding:
                                const EdgeInsets.only(left: AppPadding.p14),
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: Colormanager.lightGrey,
                            ),
                          ),
                          iconSize: AppSize.s35,
                          elevation: 16,
                          isExpanded: true,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          underline: Container(
                            height: 1,
                          ),
                          // Array list of items
                          items: controller.paymentType.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items.toString(),
                                style: getSemiBoldStyle(
                                    color: Colormanager.black,
                                    fontSize: FontSize.s14),
                              ),
                            );
                          }).toList(),

                          onChanged: (String? newValue) {
                            controller.selectPaymenttype.value = newValue!;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      )
                    ],
                  ),
                  if (controller.selectPaymenttype.value == 'Bank')
                    BankComponents(controller: controller),
                  if (controller.selectPaymenttype.value != 'Bank')
                    MobileBankingComponents(controller: controller),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.getValid();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colormanager.primary),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colormanager.primary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text("Submit",
                          style: getSemiBoldStyle(color: Colormanager.white)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
