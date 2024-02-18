import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/user_info_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/profile_controller.dart';

class UserInfoBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<PofileController>(PofileController(userInfoApi: UserInfoApi()));
  }
}
