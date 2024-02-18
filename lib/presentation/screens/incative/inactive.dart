import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/assets_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/size_config.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

import '../resources/routes_manager.dart';

class InActiveView extends StatelessWidget {
  const InActiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              ImageAssets.inactiveAccount,
              width: SizeConfig.screenWidth! * 0.25,
              height: SizeConfig.screenWidth! * 0.25,
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            Text('Your Account is InActive .\nPlease Contact our Admin',
                style: getBoldStyle(
                  color: Colormanager.darkPrimary,
                )),
            const SizedBox(
              height: AppSize.s16,
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(Routes.loginRoute);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colormanager.primary),
              child: Text(
                'Back To Login',
                style: getMediumStyle(color: Colormanager.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
