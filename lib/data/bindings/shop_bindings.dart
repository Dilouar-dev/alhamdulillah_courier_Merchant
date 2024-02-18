import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/shop_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/shop_controller.dart';

class ShopBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ShopController>(ShopController(shopApi: ShopApi()));
  }
}
