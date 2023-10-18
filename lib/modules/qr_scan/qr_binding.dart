import 'package:get/get.dart';
import 'package:ql_ban_hang/modules/qr_scan/qr_controller.dart';

class QrScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrController>(
      () => QrController(),
    );
  }
}
