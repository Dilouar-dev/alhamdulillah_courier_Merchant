import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/dashboard_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/dashboard_controller.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(
        DashboardController(dashboardApi: DashboardApi()),
        permanent: true);
  }
}
