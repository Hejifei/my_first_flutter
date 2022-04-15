import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myapp/src/locales/index.dart';
import 'package:myapp/src/router/app_pages.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

SystemUiOverlayStyle uiStyle = SystemUiOverlayStyle.light.copyWith(
  statusBarColor: Colors.transparent,
);

void main() {
  runApp(MyApp());

  // if (Platform.isAndroid) {
  //   SystemChrome.setSystemUIOverlayStyle(uiStyle);
  // }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "myApp",
      translations: Messages(), // 你的翻译
      locale: const Locale('zh', 'CN'), // 设置默认语言
      fallbackLocale: const Locale('en', 'US'), //  在配置错误的情况下,使用的语言
      // home: IndexPage(),
      // initialBinding: IndexBinding(),
      enableLog: true,
      getPages: AppPages.routes,
      initialRoute: AppRoutes.Login,
      // unknownRoute: ,
      routingCallback: (route) {
        //  路由拦截
        print((route as Routing).current);
      },
      builder: EasyLoading.init(),
    );
  }
}
