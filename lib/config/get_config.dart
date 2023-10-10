import 'dart:developer';

import 'package:ql_ban_hang/config/config.dart';
import 'package:ql_ban_hang/config/config_dev.dart' as dev;
import 'package:ql_ban_hang/config/config_prod.dart' as prod;
import 'package:ql_ban_hang/flavors.dart';

Future<ModuleConfig> getConfigBase() async {
  log('moi truong: ${F.name}');
  switch (F.appFlavor) {
    case Flavor.dev:
      return dev.Environment();
    case Flavor.prod:
      return prod.Environment();
    default:
      return dev.Environment();
  }
}
