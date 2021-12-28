import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'zh_CN.dart';
import 'en_US.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': zhCn,
        'en_US': enUs,
      };
}

class MessagesController extends GetxController {
  void changeLanguage(String languageCode, String countryCode) {
    var locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
  }
}
