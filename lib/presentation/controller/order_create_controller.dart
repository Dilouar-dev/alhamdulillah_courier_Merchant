import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/categories.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/confirm_orders_response.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/coverage_area_response.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/pickup_time_response.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/shopsresponse.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/weight_response.dart';

import 'package:alhamdulillah_courier_service_merchant/data/remote/order_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/showloding_dialog.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/routes_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:intl/intl.dart';
import '../screens/gb_widgets/custom_snakebar.dart';

class OrderCreateController extends GetxController {
  OrderApi orderApi;
  OrderCreateController({
    required this.orderApi,
  });
  RxBool isLoad = false.obs;
  RxBool isPertial = false.obs;
  List<Shop> shops = <Shop>[].obs;
  List<CoverageArea> coverageAreas = <CoverageArea>[].obs;
  List<ProductType> categories = <ProductType>[].obs;
  List<PickupTime> pickuptimes = <PickupTime>[].obs;
  List<Weight> weights = <Weight>[].obs;

  Shop? selectedShop;
  // CoverageArea? selectedArea;
  CoverageArea? _selectedAreaController;
  // CoverageArea? _selectedAreaIdController;
  CoverageArea? selectedDistrict;
  ProductType? selectedCatefory;
  PickupTime? selectedPickupTime;
  Weight? selectedWeight;
  var selectShop = '--- Select Shop ---'.obs;
  var selectDistrict = '--- Select District ---'.obs;
  // var _selectedAreaIdController = '--- Select District ---'.obs;

  // var selectArea = '--- Select Area ---'.obs;

  var selectCategory = '--- Select Category ---'.obs;
  var selectPickupTime = '--- Select Pickup Time ---'.obs;
  var selectWeight = '--- up to 1 kg---'.obs;
  var selectType = 'Regular'.obs;
  var types = ['Regular', 'Express'];


  TextEditingController _selectedDistController = TextEditingController();


  var selectedDate = DateTime.now().obs;
  Future<void> selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate.value = picked;
    }
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController collectionController = TextEditingController();
  TextEditingController deliveryNoteController = TextEditingController();
  TextEditingController _selectedAreaIdController = TextEditingController();

  String id ='';
  // int id;


  @override
  void onInit() {
    getLoadData();

    super.onInit();
  }

  //Email Validation
  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return AppStrings.provideEmail;
    }
    return null;
  }

  void setSelectedAreaId(String areaId) {
    _selectedAreaIdController.text = areaId;
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

  getLoadData() async {
    isLoad.value = true;

    try {
      /*await orderApi.getShops().then((value) {
        var body = json.decode(value);
        shops = ShopsResponse.fromJson(body).data ?? [];
        if (kDebugMode) {
          print(body);
        }
      });*/

      await orderApi.getCategories().then((value) {
        var body = json.decode(value);
        categories = CategoryResponse.fromJson(body).data ?? [];
        if (kDebugMode) {
          print(body);
        }
      });
      await orderApi.getPickupTimes().then((value) {
        var body = json.decode(value);
        pickuptimes = PickupTimeResponse.fromJson(body).data ?? [];
      });
      await orderApi.getWeights().then((value) {
        var body = json.decode(value);
        weights = WeightResponse.fromJson(body).data ?? [];
      });
      await orderApi.getAreas().then((value) {
        var body = json.decode(value);
        coverageAreas = CoverageAreaResponse.fromJson(body).data ?? [];
        if (kDebugMode) {
          print(body);
        }
      });
      await orderApi.getDistArea(Id: id as int).then((value) {
        var body = json.decode(value);
        coverageAreas = CoverageAreaResponse.fromJson(body).data ?? [];
        if (kDebugMode) {
          print(body);
        }
      });
      isLoad.value = false;
    } catch (error) {
      isLoad.value = false;
    }
  }

  dateFormet(String date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

//   void getVlidation() {
//     final validation = formKey.currentState!.validate();
//     if (!validation) {
//       return;
//     }
//
//     print('selectedDistrict: $selectedDistrict');
//     print('selectedCatefory: $selectedCatefory');
//     print('selectedWeight: $selectedWeight');
//     print('selectedPickupTime: $selectedPickupTime');
//     print('_selectedAreaIdController.text: ${_selectedAreaIdController.text}');
//
//     if (selectedDistrict == null) {
//       customSnakebar(
//           title: AppStrings.errorTitle,
//           description: 'District Not Selected',
//           color: Colormanager.red,
//           icon: Icons.error);}
//     // else if (selectedArea == null) {
//     //   customSnakebar(
//     //       title: AppStrings.errorTitle,
//     //       description: 'Area Not Selected',
//     //       color: Colormanager.red,
//     //       icon: Icons.error);
//     // }
//       else if (selectedCatefory == null) {
//       customSnakebar(
//           title: AppStrings.errorTitle,
//           description: 'Category Not Selected',
//           color: Colormanager.red,
//           icon: Icons.error);
//     } else if (selectedWeight == null) {
//       customSnakebar(
//           title: AppStrings.errorTitle,
//           description: 'Weight Not Selected',
//           color: Colormanager.red,
//           icon: Icons.error);
//     }
//     else if (selectedPickupTime == null) {
//       customSnakebar(
//           title: AppStrings.errorTitle,
//           description: 'Pickup Time Not Selected',
//           color: Colormanager.red,
//           icon: Icons.error);
//     }
//     else {
//       String name = nameController.text;
//       String phone = phoneController.text;
//       String address = addressController.text;
//       String collection = collectionController.text;
//       String note = deliveryNoteController.text ?? '-';
//       String type = selectType.toString() == 'Express' ? 'Urgent' : 'Regular';
//       int isPartial = isPertial.value == true ? 1 : 0;
//       int? selectedArea = int.tryParse(_selectedAreaIdController.text);
//
//       Order order = Order(
//           shop: 'jj',//selectShop.toString(),
//           customerName: name,
//           customerPhone: phone,
//           customerAddress: address,
//           type: type,
//           district: selectDistrict.toString(),
//           // districtId: parsedDistrictId,
//           area:_selectedAreaController.toString(),
//           areaId: int.tryParse(_selectedAreaIdController.text) ?? 0,//213,//selectArea,//_selectedAreaIdController.toString(),
//           category: selectCategory.toString(),
//           weight: selectWeight.toString(),
//           pickupTime: selectPickupTime.toString(),
//           pickupDate: selectedDate.toString(),
//           colection: int.parse(collection.toString()),
//           isPartial: isPartial,
//           remarks: note
//       );
//
//       print(order != null ? order.toJson() : 'Order object is null');
//
//
//
//       print("Created");
//       print("Order Details:");
//       print("Shop: ${order.shop}");
//       print("Customer Name: ${order.customerName}");
//       print("Customer Phone: ${order.customerPhone}");
//       print("Customer Address: ${order.customerAddress}");
//       print("Type: ${order.type}");
//       print("District: ${order.district}");
//       print("District Id: ${order.districtId}");
//
//       print("Area: ${order.areaId}");
//       print("Category: ${order.category}");
//       print("Weight: ${order.weight}");
//       print("Pickup Time: ${order.pickupTime}");
//       print("Pickup Date: ${order.pickupDate}");
//       print("Collection: ${order.colection}");
//       print("Is Partial: ${order.isPartial}");
//       print("Remarks: ${order.remarks}");
//       getCreateOrder(order);
//
//       void getVlidation() {
//         final validation = formKey.currentState!.validate();
//         if (!validation) {
//           return;
//         }
//
//         print('selectedDistrict: $selectedDistrict');
//         print('selectedCatefory: $selectedCatefory');
//         print('selectedWeight: $selectedWeight');
//         print('selectedPickupTime: $selectedPickupTime');
//         print('_selectedAreaIdController.text: ${_selectedAreaIdController.text}');
//
//         if (selectedDistrict == null) {
//           customSnakebar(
//               title: AppStrings.errorTitle,
//               description: 'District Not Selected',
//               color: Colormanager.red,
//               icon: Icons.error);}
//         // else if (selectedArea == null) {
//         //   customSnakebar(
//         //       title: AppStrings.errorTitle,
//         //       description: 'Area Not Selected',
//         //       color: Colormanager.red,
//         //       icon: Icons.error);
//         // }
//         else if (selectedCatefory == null) {
//           customSnakebar(
//               title: AppStrings.errorTitle,
//               description: 'Category Not Selected',
//               color: Colormanager.red,
//               icon: Icons.error);
//         } else if (selectedWeight == null) {
//           customSnakebar(
//               title: AppStrings.errorTitle,
//               description: 'Weight Not Selected',
//               color: Colormanager.red,
//               icon: Icons.error);
//         }
//         else if (selectedPickupTime == null) {
//           customSnakebar(
//               title: AppStrings.errorTitle,
//               description: 'Pickup Time Not Selected',
//               color: Colormanager.red,
//               icon: Icons.error);
//         }
//         else {
//           String name = nameController.text;
//           String phone = phoneController.text;
//           String address = addressController.text;
//           String collection = collectionController.text;
//           String note = deliveryNoteController.text ?? '-';
//           String type = selectType.toString() == 'Express' ? 'Urgent' : 'Regular';
//           int isPartial = isPertial.value == true ? 1 : 0;
//           int? selectedArea = int.tryParse(_selectedAreaIdController.text);
//
//           Order order = Order(
//               shop: 'jj',//selectShop.toString(),
//               customerName: name,
//               customerPhone: phone,
//               customerAddress: address,
//               type: type,
//               district: selectDistrict.toString(),
//               // districtId: parsedDistrictId,
//               area:_selectedAreaController.toString(),
//               areaId: int.tryParse(_selectedAreaIdController.text) ?? 0,//213,//selectArea,//_selectedAreaIdController.toString(),
//               category: selectCategory.toString(),
//               weight: selectWeight.toString(),
//               pickupTime: selectPickupTime.toString(),
//               pickupDate: selectedDate.toString(),
//               colection: int.parse(collection.toString()),
//               isPartial: isPartial,
//               remarks: note
//           );
//
//           print(order != null ? order.toJson() : 'Order object is null');
//
//
//
//           print("Created");
//           print("Order Details:");
//           print("Shop: ${order.shop}");
//           print("Customer Name: ${order.customerName}");
//           print("Customer Phone: ${order.customerPhone}");
//           print("Customer Address: ${order.customerAddress}");
//           print("Type: ${order.type}");
//           print("District: ${order.district}");
//           print("District Id: ${order.districtId}");
//
//           print("Area: ${order.areaId}");
//           print("Category: ${order.category}");
//           print("Weight: ${order.weight}");
//           print("Pickup Time: ${order.pickupTime}");
//           print("Pickup Date: ${order.pickupDate}");
//           print("Collection: ${order.colection}");
//           print("Is Partial: ${order.isPartial}");
//           print("Remarks: ${order.remarks}");
//           getCreateOrder(order);
//
//           nameController.clear();
//           phoneController.clear();
//           addressController.clear();
//           collectionController.clear();
//           deliveryNoteController.clear();
//
//         }
//       }
//
//
//     }
//   }
//
// //Create Order
//   getCreateOrder(Order order) async {
//     showLoaderDialog(Get.context!, AppStrings.wait);
//     print(order.toJson());
//     try {
//       await orderApi.getCreateOrder(order).then((value) {
//         print(value);
//         Get.back();
//         customSnakebar(
//             title: AppStrings.successTitle,
//             description: 'Successfully Created Order',
//             color: Colormanager.darkblue,
//             icon: Icons.check);
//
//         Get.offNamed(Routes.order);
//         // Get.offNamed(Routes.order);
//       }).onError((error, stackTrace) {
//         Get.back();
//         customSnakebar(
//             title: AppStrings.errorTitle,
//             description: error.toString(),
//             color: Colormanager.red,
//             icon: Icons.error);
//         print("Error occurred: $error");
//       });
//     } catch (error) {
//       Get.back();
//       customSnakebar(
//           title: AppStrings.errorTitle,
//           description: error.toString(),
//           color: Colormanager.red,
//           icon: Icons.error);
//     }
//
//     nameController.clear();
//     phoneController.clear();
//     addressController.clear();
//     collectionController.clear();
//     deliveryNoteController.clear();
//   }




  void getVlidation() {
    final validation = formKey.currentState!.validate();
    if (!validation) {
      return;
    }
    // if (selectedDistrict == null) {
    //   customSnakebar(
    //       title: AppStrings.errorTitle,
    //       description: 'District Not Selected',
    //       color: Colormanager.red,
    //       icon: Icons.error);}
    // else if (selectedArea == null) {
    //   customSnakebar(
    //       title: AppStrings.errorTitle,
    //       description: 'Area Not Selected',
    //       color: Colormanager.red,
    //       icon: Icons.error);
    // }
    else if (selectedCatefory == null) {
      customSnakebar(
          title: AppStrings.errorTitle,
          description: 'Category Not Selected',
          color: Colormanager.red,
          icon: Icons.error);
    } else if (selectedWeight == null) {
      customSnakebar(
          title: AppStrings.errorTitle,
          description: 'Weight Not Selected',
          color: Colormanager.red,
          icon: Icons.error);
    }
    // else if (selectedPickupTime == null) {
    //   customSnakebar(
    //       title: AppStrings.errorTitle,
    //       description: 'Pickup Time Not Selected',
    //       color: Colormanager.red,
    //       icon: Icons.error);
    // }
    else {
      String name = nameController.text;
      String phone = phoneController.text;
      String address = addressController.text;
      String orderid = addressController.text;
      String sellingprice = addressController.text;
      String collection = collectionController.text;
      String note = deliveryNoteController.text ?? '-';
      String type = selectType.toString() == 'Express' ? 'Urgent' : 'Regular';
      // int isPartial = isPertial.value == true ? 1 : 0;
      int isPartial = 1;//isPertial.value == true ? 1 : 0;


      Order order = Order(
          shop: 'jj',//selectShop.toString(),
          customerName: name,
          customerPhone: phone,
          customerAddress: address,
          type: type,
          district: _selectedDistController.text,//selectDistrict.toString(),
          // districtId: parsedDistrictId,
          area:_selectedAreaController.toString(),
          areaId: int.tryParse(_selectedAreaIdController.text) ?? 0,//213,//selectArea,//_selectedAreaIdController.toString(),
          category: selectCategory.toString(),
          weight: selectWeight.toString(),
          pickupTime: selectPickupTime.toString(),
          pickupDate: selectedDate.toString(),
          colection: int.parse(collection.toString()),
          isPartial: isPartial,
          remarks: note
      );



      print("Created");
      print("Order Details:");
      print("Shop: ${order.shop}");
      print("Customer Name: ${order.customerName}");
      print("Customer Phone: ${order.customerPhone}");
      print("Customer Address: ${order.customerAddress}");
      print("Type: ${order.type}");
      print("District: ${order.district}");
      print("District Id: ${order.districtId}");

      print("Area: ${order.area}");
      print("Category: ${order.category}");
      print("Weight: ${order.weight}");
      print("Pickup Time: ${order.pickupTime}");
      print("Pickup Date: ${order.pickupDate}");
      print("Collection: ${order.colection}");
      print("Is Partial: ${order.isPartial}");
      print("Remarks: ${order.remarks}");
      getCreateOrder(order);


      nameController.clear();
      phoneController.clear();
      addressController.clear();
      // orderidController.clear();
      collectionController.clear();


    }
  }

//Create Order
  getCreateOrder(Order order) async {
    showLoaderDialog(Get.context!, AppStrings.wait);
    print(order.toJson());
    try {
      await orderApi.getCreateOrder(order).then((value) {

        print(value);
        Get.back();
        customSnakebar(
            title: AppStrings.successTitle,
            description: 'Successfully Created Order',
            color: Colormanager.darkblue,
            icon: Icons.check);

        Get.offNamed(Routes.order);
        // Get.offNamed(Routes.order);
      }).onError((error, stackTrace) {
        Get.back();
        customSnakebar(
            title: AppStrings.errorTitle,
            description: error.toString(),
            color: Colormanager.red,
            icon: Icons.error);
      });
    } catch (error) {
      Get.back();
      customSnakebar(
          title: AppStrings.errorTitle,
          description: error.toString(),
          color: Colormanager.red,
          icon: Icons.error);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    collectionController.dispose();
    deliveryNoteController.dispose();

    isPertial.value = false;

    selectedShop = null;
    selectedDistrict = null;
    _selectedAreaController = null;
    _selectedAreaIdController.dispose() ;
    selectedCatefory = null;
    // selectedPickupTime = null;
    selectedWeight = null;
    selectShop.value = '--- Select Shop ---';
    selectDistrict.value = '-- Select District---';
    // selectArea = '--- Select Area ---';
    // selectArea;

    selectCategory.value = '--- Select Category ---';
    selectPickupTime.value = '--- Select Pickup Time ---';
    selectWeight.value = '--- Select Weight ---';
    selectType.value = 'Regular';

    selectedDate = DateTime.now().obs;

    // super.onClose();
  }
}
