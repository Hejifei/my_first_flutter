import 'package:get/get.dart';
import 'package:myapp/src/views/Index/index_binding.dart';
import 'package:myapp/src/views/home/home_binding.dart';

import 'package:myapp/src/views/home/home_view.dart';
import 'package:myapp/src/views/home/scanner/scanner_binding.dart';
import 'package:myapp/src/views/home/scanner/scanner_view.dart';
import 'package:myapp/src/views/login/login_binding.dart';
import 'package:myapp/src/views/mine/mine_binding.dart';
import 'package:myapp/src/views/mine/mine_view.dart';
import 'package:myapp/src/views/setting/setting_binding.dart';
import 'package:myapp/src/views/setting/setting_view.dart';
import 'package:myapp/src/views/Index/index_view.dart';
import 'package:myapp/src/views/login/login_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Index;

  static final routes = [
    GetPage(
      name: AppRoutes.Index,
      page: () => IndexPage(),
      binding: IndexBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.Home,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.Scanner,
      page: () => const ScannerPage(),
      binding: ScannerBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.Settings,
      page: () => SettingPage(),
      binding: SettingBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: '/mine',
      page: () => MinePage(),
      binding: MineBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.noTransition,
    ),
  ];

  // static final unknownRoute = GetPage(
  //   name: AppRoutes.NotFound,
  //   page: () => NotfoundPage(),
  // );

  // static final proxyRoute = GetPage(
  //   name: AppRoutes.Proxy,
  //   page: () => ProxyPage(),
  // );
}
