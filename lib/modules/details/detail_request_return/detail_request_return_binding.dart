import 'package:get/get.dart';
import 'package:ql_ban_hang/modules/details/detail_request_return/detail_request_return_controller.dart';

class DetailRequestReturnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRequestReturnController>(
        () => DetailRequestReturnController());
  }
}
