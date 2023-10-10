import 'package:get/get.dart';
import 'package:ql_ban_hang/modules/list/list_warehouse_receipt/list_warehouse_receipt_controller.dart';

class ListWarehouseReceiptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListWarehouseReceiptController>(
        () => ListWarehouseReceiptController());
  }
}
