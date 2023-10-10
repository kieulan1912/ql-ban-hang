import 'package:get/get.dart';
import 'package:ql_ban_hang/modules/list/list_tools/list_tools_controller.dart';

class ListToolsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListToolsController>(() => ListToolsController());
  }
}
