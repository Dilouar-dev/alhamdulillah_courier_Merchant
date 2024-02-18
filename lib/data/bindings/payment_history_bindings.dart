import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/payment_history_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/payment_history_controller.dart';

class PaymentHistoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<PaymentHistoryController>(
        PaymentHistoryController(paymentHistoryApi: PaymentHistoryApi()));
  }
}
