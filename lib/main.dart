import 'package:flutter/material.dart';
import 'package:myapp/views/Index/index_binding.dart';
import 'package:get/get.dart';
import 'package:myapp/views/Index/index_view.dart';
import 'package:myapp/locales/index.dart';
import 'package:myapp/router/app_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "myApp",
        translations: Messages(), // 你的翻译
        locale: const Locale('zh', 'CN'), // 设置默认语言
        fallbackLocale: const Locale('en', 'US'), //  在配置错误的情况下,使用的语言
        home: IndexPage(),
        initialBinding: IndexBinding(),
        enableLog: true,
        getPages: AppPages.routes,
        initialRoute: AppPages.INITIAL,
        // unknownRoute: ,
        routingCallback: (route) {
          //  路由拦截
          print((route as Routing).current);
        });
  }
}
