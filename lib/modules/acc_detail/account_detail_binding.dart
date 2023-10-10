import 'package:get/get.dart';
import 'package:ql_ban_hang/modules/acc_detail/account_detail_controller.dart';

class AccountDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountDetailController>(() => AccountDetailController());
  }
}
