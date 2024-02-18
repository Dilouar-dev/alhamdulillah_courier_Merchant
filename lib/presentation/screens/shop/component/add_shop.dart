import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/branch_response.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/shop_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

showModal(context, status) {
  final controller = Get.find<ShopController>();
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
            child: Form(
              key: controller.key,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: AppSize.s18,
                children: <Widget>[
                  Text(
                    AppStrings.addShop,
                    style: getSemiBoldStyle(
                        color: Colormanager.black, fontSize: AppSize.s18),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: AppSize.s18,
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: AppStrings.name,
                                  style: getSemiBoldStyle(
                                      color: Colormanager.darkGrey,
                                      fontSize: AppSize.s14),
                                ),
                                TextSpan(
                                  text: AppStrings.star,
                                  style: getSemiBoldStyle(
                                      color: Colormanager.red,
                                      fontSize: AppSize.s14),
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                            controller: controller.nameController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            style: getSemiBoldStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              hintText: AppStrings.enterShopName,
                            ),
                            validator: (value) {
                              return controller.validFields(value!);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: AppStrings.phone,
                                  style: getSemiBoldStyle(
                                      color: Colormanager.darkGrey,
                                      fontSize: AppSize.s14),
                                ),
                                TextSpan(
                                  text: AppStrings.star,
                                  style: getSemiBoldStyle(
                                      color: Colormanager.red,
                                      fontSize: AppSize.s14),
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                            controller: controller.phoneCOntroller,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            style: getSemiBoldStyle(color: Colormanager.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: AppStrings.enterPhone,
                            ),
                            validator: (value) {
                              return controller.validatePhone(value!);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: AppStrings.branch,
                                  style: getSemiBoldStyle(
                                      color: Colormanager.darkGrey,
                                      fontSize: AppSize.s14),
                                ),
                                TextSpan(
                                  text: AppStrings.star,
                                  style: getSemiBoldStyle(
                                      color: Colormanager.red,
                                      fontSize: AppSize.s14),
                                ),
                              ],
                            ),
                          ),
                          //Selecttor in Branch
                          Container(
                            padding: const EdgeInsets.all(AppPadding.p4),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                  width: AppSize.s1_5,
                                  color: Colormanager.grey),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(AppSize.s8),
                              ),
                            ),
                            child: Obx(() => DropdownButton<Branch>(
                                  //isDense: true,
                                  hint: Text(
                                    controller.slectedValue.value,
                                    style: getSemiBoldStyle(
                                      color: Colormanager.black,
                                    ),
                                  ),
                                  value: controller.selectedBranch,

                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  iconSize: 30,
                                  elevation: 16,
                                  isExpanded: true,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  underline: Container(
                                    height: 0,
                                  ),
                                  onChanged: (Branch? newValue) {
                                    controller.selectedBranch = newValue;
                                    controller.slectedValue.value =
                                        newValue!.name.toString();
                                  },
                                  items: controller.branchs!
                                      .map<DropdownMenuItem<Branch>>(
                                          (Branch? value) {
                                    return DropdownMenuItem<Branch>(
                                      value: value,
                                      child: Text(
                                        '${value!.name}',
                                        style: getSemiBoldStyle(
                                            color: Colormanager.black),
                                      ),
                                    );
                                  }).toList(),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: AppStrings.address,
                                  style: getSemiBoldStyle(
                                      color: Colormanager.darkGrey,
                                      fontSize: AppSize.s14),
                                ),
                                TextSpan(
                                  text: AppStrings.star,
                                  style: getSemiBoldStyle(
                                      color: Colormanager.red,
                                      fontSize: AppSize.s14),
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                            controller: controller.addressController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.streetAddress,
                            style: getSemiBoldStyle(color: Colormanager.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: AppStrings.enterAddress,
                            ),
                            validator: (value) {
                              return controller.validFields(value!);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: AppStrings.url,
                                  style: getSemiBoldStyle(
                                      color: Colormanager.darkGrey,
                                      fontSize: AppSize.s14),
                                ),
                                TextSpan(
                                  text: AppStrings.star,
                                  style: getSemiBoldStyle(
                                      color: Colormanager.red,
                                      fontSize: AppSize.s14),
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                            controller: controller.urlController,
                            textInputAction: TextInputAction.done,
                            style: getSemiBoldStyle(color: Colormanager.black),
                            keyboardType: TextInputType.url,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: AppStrings.enteUrl),
                            validator: (value) {
                              return controller.validFields(value!);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                controller.getformValidation(status);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppPadding.p14),
                                child: Text(
                                  status
                                      ? AppStrings.update
                                      : AppStrings.submit,
                                  style: getSemiBoldStyle(
                                      color: Colormanager.white),
                                ),
                              )),
                          ElevatedButton(
                              onPressed: () => Get.back(),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colormanager.red),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppPadding.p14),
                                child: Text(
                                  AppStrings.close,
                                  style: getSemiBoldStyle(
                                      color: Colormanager.white),
                                ),
                              ))
                        ],
                      )
                    ],
                  )
               
                ],
              ),
            ),
          ));
    },
  );
}
