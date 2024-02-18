import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/user_info_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/incomplete_controller.dart';

class IncompleteBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IncompleteController>(
        IncompleteController(userInfoApi: UserInfoApi()));
  }
}
