import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/src/locales/index.dart';

class SettingController extends GetxController {
  MessagesController messagesController = Get.put(MessagesController());
  final _isEnglish = false.obs;
  set isEnglish(value) {
    if (value) {
      messagesController.changeLanguage('en', "US");
    } else {
      messagesController.changeLanguage('zh', "CN");
    }
    _isEnglish.value = value;
  }

  get isEnglish => _isEnglish.value;

  final _isDarkTheme = false.obs;
  set isDarkTheme(value) {
    _isDarkTheme.value = value;
  }

  get isDarkTheme => _isDarkTheme.value;

  void changeDartTheme(value) {
    isDarkTheme = value;
    Get.changeTheme(value ? ThemeData.dark() : ThemeData.light());
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    isEnglish = !(ui.window.locale.toString() == 'zh_CN');
    isDarkTheme = Get.isDarkMode;
  }
}
