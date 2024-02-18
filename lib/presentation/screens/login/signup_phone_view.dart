import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/otpController.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/user_input_fields.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/submit_button.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/assets_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

class SignupPhoneView extends StatelessWidget {
  const SignupPhoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final controller = Get.put(OtpController(), permanent: false);
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
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child:
                                Image.asset(ImageAssets.splashLogo), //App Logo
                          ),
                          UserInputFields(
                            lavelName: AppStrings.mMobile,
                            histsName: AppStrings.enterMobile,
                            controller: controller.mobileController,
                            iconData: Icons.mobile_friendly,
                            validateFunction: (value) =>
                                controller.validatePhone(value),
                            textInputType: TextInputType.number,
                            press: () {},
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SubmitButton(
                            title: 'Get otp code',
                            press: () {
                              // Get.toNamed(Routes.OTPVERIFY);
                              controller.getValidate();
                            },
                          ),
                          SizedBox(height: height * .07),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: AppMargin.m14,
                              ),
                              padding: const EdgeInsets.all(AppPadding.p14),
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    AppStrings.alreadyHaveAccount,
                                    style: getBoldStyle(
                                        color: Colormanager.black,
                                        fontSize: FontSize.s16),
                                  ),
                                  const SizedBox(
                                    width: AppSize.s10,
                                  ),
                                  Text(
                                    AppStrings.login,
                                    style: getBoldStyle(
                                        color: Colormanager.darkPrimary,
                                        fontSize: FontSize.s16),
                                  ),
                                ],
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
}
