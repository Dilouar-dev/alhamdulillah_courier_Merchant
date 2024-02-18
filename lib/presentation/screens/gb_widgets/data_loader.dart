import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/assets_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

class DataLoader extends StatelessWidget {
  const DataLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        ImageAssets.loader,
        height: AppSize.s250,
        width: AppSize.s250,
      ),
    );
  }
}
