import 'package:get/get.dart';
import 'package:ql_ban_hang/modules/list/list_supplier/list_supplier_controller.dart';

class ListSupplierBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListSupplierController>(() => ListSupplierController());
  }
}
