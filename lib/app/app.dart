import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/bindings/root_bindings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../presentation/controller/user_info_controller.dart';
import '../presentation/screens/resources/routes_manager.dart';
import '../presentation/screens/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); //Private constructor
  static final MyApp instance = MyApp._internal(); //Single Instance Singleton
  factory MyApp() => instance; //Create Factory for the class instance
  int appState = 0;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // Initialize SharedPreferences
    Get.putAsync<SharedPreferences>(() async {
      return await SharedPreferences.getInstance();
    });



    Get.put(UserInfoController());
    return GetMaterialApp(
      initialBinding: RootBindings(),
      // onGenerateRoute: RouteGenerator.getRoute,
      getPages: AppPages.routes,
      initialRoute: Routes.initialRoute,
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
    );
  }
}
