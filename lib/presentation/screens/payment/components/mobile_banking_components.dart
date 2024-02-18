import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/payment_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/user_input_fields.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

class MobileBankingComponents extends StatelessWidget {
  final PaymentController controller;
  const MobileBankingComponents({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Account Type',
                        style: getSemiBoldStyle(
                            color: Colormanager.darkGrey,
                            fontSize: AppSize.s16),
                      ),
                      TextSpan(
                        text: '*',
                        style: getSemiBoldStyle(
                            color: Colormanager.red, fontSize: AppSize.s16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSize.s4,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colormanager.darkGrey, width: AppSize.s1_5),
                    borderRadius: BorderRadius.circular(AppSize.s10),
                  ),
                  child: DropdownButton(
                    //autofocus: false,
                    icon: Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p14),
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
                    value: controller.selectAccounttypeMobile.value,
                    onChanged: (newValue) {
                      controller.selectAccounttypeMobile.value =
                          newValue.toString();
                      controller.update();
                    },
                    items: controller.mobileAccountTypes.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(
                          valueItem.toString(),
                          style: getSemiBoldStyle(
                              color: Colormanager.black,
                              fontSize: FontSize.s14),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s10,
                )
              ],
            )),
        UserInputFields(
          controller: controller.mobileNumberController,
          histsName: AppStrings.enterPhone,
          iconData: Icons.phone,
          lavelName: AppStrings.mobile,
          textInputType: TextInputType.phone,
          validateFunction: (value) => controller.validatePhone(value),
          press: () {},
        ),
      ],
    );
  }
}
