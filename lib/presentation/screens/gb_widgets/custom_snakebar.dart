import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

void customSnakebar(
    {required String? title,
    required String? description,
    required Color? color,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
    required IconData? icon}) {
  Get.snackbar(
    title.toString(),
    description.toString(),
    icon: Icon(icon, color: Colormanager.white),
    snackPosition: snackPosition,
    backgroundColor: color,
    borderRadius: AppMargin.m20,
    margin: const EdgeInsets.all(AppPadding.p14),
    colorText: Colormanager.white,
    duration: const Duration(seconds: 2),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
