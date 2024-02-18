import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/order_history_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/size_config.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

showHistoryModal(context) {
  final controller = Get.find<OrderHistoryController>();
  selectFormDate() async {
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: controller.formDate.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != controller.formDate) {
      controller.formDate.value = picked;
    }
  }

  selectToDate() async {
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: controller.formDate.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != controller.todate) {
      controller.todate.value = picked;
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
                      "Order Filter",
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
                Obx(() => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Status',
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
                            //autofocus: false,
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
                            value: controller.selectStatus.value,
                            onChanged: (newValue) {
                              controller.selectStatus.value =
                                  newValue.toString();
                              controller.update();
                            },
                            items: controller.statusList.map((valueItem) {
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
                        // const SizedBox(
                        //   height: AppSize.s10,
                        // )
                      ],
                    )),
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
                                        controller.formDate.toString()),
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
                                        controller.todate.toString()),
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
                        controller.getConfirmOrders();
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
