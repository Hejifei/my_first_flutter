import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../locales/index.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  MessagesController messagesController = Get.put(MessagesController());

  bool isEnglish = !(ui.window.locale.toString() == 'zh_CN');
  bool isDarkTheme = Get.isDarkMode;

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('language_selected'.tr),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('language_selected'.tr),
                  flex: 7,
                ),
                Expanded(
                  child: Switch(
                    value: isEnglish,
                    onChanged: (value) {
                      setState(() {
                        isEnglish = value;
                      });
                      if (value) {
                        messagesController.changeLanguage('en', "US");
                      } else {
                        messagesController.changeLanguage('zh', "CN");
                      }
                    },
                  ),
                  // flex: 3,
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Text('theme'.tr),
                  flex: 7,
                ),
                Expanded(
                  child: Switch(
                    value: isDarkTheme,
                    onChanged: (value) {
                      setState(() {
                        isDarkTheme = value;
                      });
                      Get.changeTheme(
                          value ? ThemeData.dark() : ThemeData.light());
                    },
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
