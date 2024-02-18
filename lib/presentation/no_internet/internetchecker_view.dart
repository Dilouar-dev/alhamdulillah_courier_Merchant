import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

class EmptyFailureNoInternetView extends StatelessWidget {
  final String title, description, buttonText, image;
  final VoidCallback onPressed;
  final bool? ishome;
  const EmptyFailureNoInternetView(
      {Key? key,
      required this.title,
      required this.description,
      required this.buttonText,
        required this.image,
      required this.onPressed,
      this.ishome = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: AppSize.s18),
              Lottie.asset(
                image,
                height: AppSize.s200,
                width: AppSize.s200,
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
              Text(
                title,
                style: getSemiBoldStyle(
                    fontSize: FontSize.s16, color: Colormanager.darkGrey),
              ),
              const SizedBox(
                height: AppSize.s22,
              ),
              Text(
                description,
                style: getSemiBoldStyle(
                    fontSize: FontSize.s14, color: Colormanager.darkGrey),
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
              ElevatedButton.icon(
                  onPressed: onPressed,
                  icon: const Icon(Icons.replay_outlined),
                  label: Text(
                    buttonText,
                    style: getSemiBoldStyle(
                        color: Colormanager.white, fontSize: FontSize.s16),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
