import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/branch_response.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/incomplete_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/user_input_fields.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

class IncompleteView extends GetView<IncompleteController> {
  const IncompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () => Get.back(),
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p14),
                child: Row(
                  children: [
                    const SizedBox(
                      width: AppSize.s10,
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colormanager.black,
                      semanticLabel: AppStrings.back,
                      size: AppSize.s22,
                    ),
                    Text(
                      AppStrings.back,
                      style: getSemiBoldStyle(
                          color: Colormanager.black, fontSize: FontSize.s18),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: controller.obx(
                (branchList) => RefreshIndicator(
                  onRefresh: () async {
                    controller.getBranchs();
                  },
                  child: Form(
                    key: controller.key,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            height: 50,
                          ),
                          Column(
                            children: <Widget>[
                              UserInputFields(
                                controller: controller.businessNameController,
                                histsName: AppStrings.enterBusinessName,
                                iconData: Icons.business,
                                lavelName: AppStrings.businessName,
                                validateFunction: (value) =>
                                    controller.validFields(value),
                                press: () {},
                              ),
                              UserInputFields(
                                controller: controller.nameController,
                                histsName: AppStrings.enterOwnerName,
                                iconData: Icons.person,
                                lavelName: AppStrings.ownerNme,
                                validateFunction: (value) =>
                                    controller.validFields(value),
                                press: () {},
                              ),
                              buildTypes(controller, branchList),
                              UserInputFields(
                                controller: controller.addressController,
                                histsName: AppStrings.enterAddres,
                                iconData: Icons.location_on,
                                lavelName: AppStrings.address,
                                textInputType: TextInputType.streetAddress,
                                maxLines: AppIntValue.i3,
                                validateFunction: (value) =>
                                    controller.validFields(value),
                                press: () {},
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: AppSize.s20,
                          ),
                          InkWell(
                            onTap: () {
                              controller.getformValidation();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(
                                vertical: AppSize.s16,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    AppSize.s14,
                                  ),
                                ),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colormanager.white,
                                    offset: const Offset(
                                      AppSize.s2,
                                      AppSize.s4,
                                    ),
                                    blurRadius: AppSize.s5,
                                    spreadRadius: AppSize.s2,
                                  )
                                ],
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colormanager.darkPrimary,
                                    Colormanager.primary,
                                  ],
                                ),
                              ),
                              child: Text(
                                'COMPLETE',
                                style: getBoldStyle(
                                    color: Colormanager.white,
                                    fontSize: FontSize.s17),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildTypes(IncompleteController controller, List<Branch>? branchList) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: AppStrings.branch,
                style: getSemiBoldStyle(
                    color: Colormanager.darkGrey, fontSize: AppSize.s14),
              ),
              TextSpan(
                text: AppStrings.star,
                style: getSemiBoldStyle(
                    color: Colormanager.red, fontSize: AppSize.s14),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: AppSize.s4,
        ),
        // Selecttor in Branch
        Container(
          padding: const EdgeInsets.all(AppPadding.p4),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(width: AppSize.s1_5, color: Colormanager.grey),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.s8),
            ),
          ),
          child: Obx(
            () => DropdownButton<Branch>(
              //isDense: true,
              hint: controller.slectedbranch.value.isNotEmpty
                  ? Text(
                      controller.slectedbranch.value,
                      style: getSemiBoldStyle(
                        color: Colormanager.black,
                      ),
                    )
                  : Text(
                      AppStrings.selectBranch,
                      style: getSemiBoldStyle(
                        color: Colormanager.black,
                      ),
                    ),
              value: controller.selectedBranch,

              icon: Padding(
                padding: const EdgeInsets.only(left: AppPadding.p14),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colormanager.darkGrey,
                ),
              ),
              iconSize: AppSize.s28,
              elevation: AppIntValue.i16,
              isExpanded: true,
              style: const TextStyle(
                color: Colors.black,
              ),
              underline: Container(
                height: 0,
              ),
              onChanged: (Branch? newValue) {
                controller.selectedBranch = newValue;
                controller.slectedbranch.value = newValue!.name.toString();
              },
              items: branchList!.map<DropdownMenuItem<Branch>>((Branch? value) {
                return DropdownMenuItem<Branch>(
                  value: value,
                  child: Text(
                    '${value!.name}',
                    style: getSemiBoldStyle(
                        color: Colormanager.black, fontSize: FontSize.s14),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
