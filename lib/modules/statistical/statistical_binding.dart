import 'package:get/get.dart';
import 'package:ql_ban_hang/modules/statistical/statistical_controller.dart';

class StatisticalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatisticalController>(() => StatisticalController());
  }
}
