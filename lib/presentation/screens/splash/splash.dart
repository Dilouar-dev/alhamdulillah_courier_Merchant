import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:alhamdulillah_courier_service_merchant/data/local/storage_healper.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/user_info.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/user_info_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/assets_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/routes_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/size_config.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    if (StorageHelper.getString(key: 'token') != null) {
      await UserInfoApi.getUserInfo(
              token: StorageHelper.getString(key: 'token'))
          .then((value) {
        final body = json.decode(value);
        final info = UserInfoResponse.fromJson(body);
        if (info.user!.role == 12 || info.user!.role == 14) {
          Navigator.pushReplacementNamed(context, Routes.homeRoute);
        } else {
          Navigator.pushReplacementNamed(context, Routes.inActiveRoute);
        }
      }).onError((error, stackTrace) {
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      });
    } else {
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: Colors.white,//Colormanager.darkPrimary,//Color(0xffB7050A),//Colormanager.red,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height/3,
            child: Image.asset(ImageAssets.splashLogo)),
      ),
    );
  }
}
