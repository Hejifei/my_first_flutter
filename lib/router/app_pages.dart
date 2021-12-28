import 'package:get/get.dart';
import 'package:myapp/views/Index/index_binding.dart';
import 'package:myapp/views/home/home.binding.dart';

import 'package:myapp/views/home/home_view.dart';
import 'package:myapp/views/mine.dart';
import 'package:myapp/views/settings.dart';
import 'package:myapp/views/Index/index_view.dart';

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
      name: '/settings',
      page: () => const SettingPage(),
    ),
    GetPage(
      name: '/mine',
      page: () => const MinePage(),
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
