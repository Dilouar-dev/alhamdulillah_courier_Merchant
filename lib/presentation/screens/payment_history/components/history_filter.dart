import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/payment_history_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/size_config.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

showPaymentHistoryModal(context) {
  final controller = Get.find<PaymentHistoryController>();
  selectFormDate() async {
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: controller.fromdate.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != controller.fromdate) {
      controller.fromdate.value = picked;
    }
  }

  selectToDate() async {
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: controller.fromdate.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != controller.today) {
      controller.today.value = picked;
    }
  }

  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colormanager.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
    ),
    builder: (BuildContext context) {
      return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: AppSize.s18,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Text(
                      "Payment Filter",
                      style: getBoldStyle(
                          color: Colors.black, fontSize: FontSize.s18),
                    ),
                    InkWell(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.clear,
                        size: AppSize.s28,
                        color: Colormanager.darkPrimary,
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: AppSize.s18,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'From Date',
                            style: getSemiBoldStyle(
                                color: Colormanager.lightGrey,
                                fontSize: AppSize.s16),
                          ),
                          TextSpan(
                            text: AppStrings.star,
                            style: getSemiBoldStyle(
                                color: Colormanager.red, fontSize: AppSize.s14),
                          ),
                        ],
                      ),
                    ),
                    // Selecttor in Shop
                    const SizedBox(
                      height: AppSize.s4,
                    ),
                    Container(
                      padding: const EdgeInsets.all(AppPadding.p4),
                      height: AppSize.s45,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                            width: AppSize.s1_5, color: Colormanager.grey),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(AppSize.s8),
                        ),
                      ),
                      child: Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  DateFormat('dd-MM-yyyy').format(
                                    DateTime.parse(
                                        controller.fromdate.toString()),
                                  ),
                                  style: getBoldStyle(
                                      color: Colormanager.black,
                                      fontSize: FontSize.s14)),
                              InkWell(
                                  onTap: () {
                                    //  selectFormDate();
                                    controller.selectFromDate();
                                  },
                                  child: const Icon(Icons.date_range))
                            ],
                          )),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'To Date',
                            style: getSemiBoldStyle(
                                color: Colormanager.lightGrey,
                                fontSize: AppSize.s16),
                          ),
                          TextSpan(
                            text: AppStrings.star,
                            style: getSemiBoldStyle(
                                color: Colormanager.red, fontSize: AppSize.s14),
                          ),
                        ],
                      ),
                    ),
                    // Selecttor in Shop
                    const SizedBox(
                      height: AppSize.s4,
                    ),
                    Container(
                      padding: const EdgeInsets.all(AppPadding.p4),
                      height: AppSize.s45,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                            width: AppSize.s1_5, color: Colormanager.grey),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(AppSize.s8),
                        ),
                      ),
                      child: Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  DateFormat('dd-MM-yyyy').format(
                                    DateTime.parse(
                                        controller.today.toString()),
                                  ),
                                  style: getBoldStyle(
                                      color: Colormanager.black,
                                      fontSize: FontSize.s14)),
                              InkWell(
                                  onTap: () {
                                    //  selectFormDate();
                                    controller.selectToDate();
                                  },
                                  child: const Icon(Icons.date_range))
                            ],
                          )),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: AppMargin.m16),
                  width: SizeConfig.screenWidth,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        controller.getPaymentHistories();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p14),
                        child: Text(
                          'Load Data',
                          style: getSemiBoldStyle(color: Colormanager.white),
                        ),
                      )),
                ),
              ],
            ),
          ));
    },
  );
}
