import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/registration_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/registration_controller.dart';

class RegistrationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<RegistrationController>(
        RegistrationController(registrationApi: RegistrationApi()));
  }
}
