import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/categories.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/confirm_orders_response.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/coverage_area_response.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/pickup_time_response.dart';

import 'package:alhamdulillah_courier_service_merchant/data/remote/order_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:intl/intl.dart';

import '../../data/model/shopsresponse.dart';

class OrderController extends GetxController with StateMixin<List<Order>> {
  OrderApi orderApi;
  OrderController({
    required this.orderApi,
  });

  List<Shop> shops = <Shop>[].obs;
  List<CoverageArea> coverageAreas = <CoverageArea>[].obs;
  List<ProductType> categories = <ProductType>[].obs;
  List<PickupTime> pickuptimes = <PickupTime>[].obs;
  Shop? selectedShop;
  CoverageArea? selectedArea;
  Category? selectedCatefory;
  PickupTime? selectedPickupTime;
  var selectShop = '--- Select Shop ---'.obs;
  var selectArea = '--- Select Area ---'.obs;
  var selectCategory = '--- Select Category ---'.obs;
  var selectPickupTime = '--- Select Pickup Time ---'.obs;
  var formDate = DateTime.now().obs;
  var todate = DateTime.now().obs;
  String fDate = '';
  String tDate = '';
  @override
  void onInit() {
    fDate = //DateFormat('yyyy-MM-dd')
            DateFormat('yyyyy.MMMM.dd GGG hh:mm aaa')
        .format(formDate.value.subtract(const Duration(days: 7)));
    // tDate = DateFormat('yyyy-MM-dd').format(todate.value);
    tDate = DateFormat('yyyyy.MMMM.dd GGG hh:mm aaa').format(todate.value);

    getConfirmOrders();
    super.onInit();
  }

  //Email Validation
  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return AppStrings.provideEmail;
    }
    return null;
  }

  //Phone Validation
  String? validatePhone(String value) {
    if (value.isEmpty) {
      return AppStrings.emptyFields;
    }
    if (!GetUtils.isPhoneNumber(value)) {
      return AppStrings.providePhone;
    }
    if (value.length != 11) {
      return AppStrings.providePhone;
    }
    return null;
  }

  //Valid Empty Fields
  String? validFields(String value) {
    if (value.isEmpty) {
      return AppStrings.emptyFields;
    }
    return null;
  }

  //Get Dashboard Data
  getConfirmOrders() async {
    change(null, status: RxStatus.loading());

    try {
      orderApi.getConfirmOrders(formDate: fDate, today: tDate).then((value) {
        var body = json.decode(value);


        // Print the error if in debug mode
        if (kDebugMode) {
          print('API Response JSon: $value');
        }

        change(ConfirmOrdersResponse.fromJson(body).data ?? [],
            status: RxStatus.success());
        if (kDebugMode) {
          print('API Response confirmorders: $value');
        }
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error(AppStrings.somthingWentWrong));
        if (kDebugMode) {
          print('API Response error: $value');
        }
      });
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
      if (kDebugMode) {
        print('API Response error: $value');
      }
    }
  }


  getSearchOrders({required String? searchQuery}) async {
    change(null, status: RxStatus.loading());

    try {
      orderApi.getConfirmOrders(formDate: fDate, today: tDate).then((value) {
        var body = json.decode(value);

        List<Order> allOrders = ConfirmOrdersResponse.fromJson(body).data ?? [];

        // Check if a search query is provided
        if (searchQuery != null && searchQuery.isNotEmpty) {
          // Perform the search based on your criteria
          List<Order> filteredOrders = allOrders.where((order) {
            // Customize this condition based on your search criteria
            return order.trackingId!.toLowerCase().contains(searchQuery.toLowerCase());
          }).toList();

          // Update the status with the filtered orders
          change(filteredOrders, status: RxStatus.success());
        } else {
          // No search query, return all orders
          change(allOrders, status: RxStatus.success());
        }

        if (kDebugMode) {
          print(value);
        }
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error(AppStrings.somthingWentWrong));
        if (kDebugMode) {
          print(value);
        }
      });
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
      if (kDebugMode) {
        print(value);
      }
    }
  }



  // Future<void> getConfirmOrders() async {
  //   change(null, status: RxStatus.loading());
  //
  //   try {
  //     final value = await orderApi.getConfirmOrders(formDate: fDate, today: tDate);
  //     var body = json.decode(value);
  //
  //     change(ConfirmOrdersResponse.fromJson(body).data ?? [],
  //         status: RxStatus.success());
  //
  //     if (kDebugMode) {
  //       print(value);
  //     }
  //   } catch (error, stackTrace) {
  //     change(null, status: RxStatus.error(AppStrings.somethingWentWrong));
  //
  //     if (kDebugMode) {
  //       print(error);
  //       print(stackTrace);
  //     }
  //   }
  // }


  Future<void> selectToDate() async {
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: todate.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null) {
      tDate = DateFormat('yyyy-MM-dd').format(picked);
      todate.value = picked;
    }
  }

  Future<void> selectFromDate() async {
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: formDate.value,
        firstDate: DateTime(2018),
        lastDate: DateTime(2101));
    if (picked != null) {
      fDate = DateFormat('yyyy-MM-dd').format(picked);
      if (kDebugMode) {
        print(fDate);
      }
      formDate.value = picked;
    }
  }

  dateFormet(String date) {
    // DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    DateTime parseDate = DateFormat("yyyyy.MMMM.dd GGG hh:mm aaa").parse(date);

    var inputDate = DateTime.parse(parseDate.toString());
    // var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
     var outputFormat = DateFormat('yyyyy.MMMM.dd GGG hh:mm aaa');

    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}
