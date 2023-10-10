import 'package:get/get.dart';
import 'package:ql_ban_hang/modules/list/list_sales_order/list_sales_order_controller.dart';

class ListSalesOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListSalesOrderController>(() => ListSalesOrderController());
  }
}
