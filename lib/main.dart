import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:alhamdulillah_courier_service_merchant/app/app.dart';
import 'package:alhamdulillah_courier_service_merchant/data/local/storage_healper.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences _prefs = await SharedPreferences.getInstance();

  StorageHelper.init(await SharedPreferences.getInstance());
  runApp(MyApp());
}
//com.edak.merchant