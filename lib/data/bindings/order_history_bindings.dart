import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/order_history_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/order_history_controller.dart';

class OrderHistoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<OrderHistoryController>(
        OrderHistoryController(orderHistoryApi: OrderHistoryApi()));
  }
}
