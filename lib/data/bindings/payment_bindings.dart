import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/payment_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/payment_controller.dart';

class PaymentBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<PaymentController>(PaymentController(paymentApi: PaymentApi()));
  }
}
