import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/common/index.dart';
import 'package:myapp/src/router/app_pages.dart';
import 'package:myapp/src/utils/index.dart';
import 'package:myapp/src/views/setting/setting_controller.dart';

class SettingPage extends GetView<SettingController> {
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
                  flex: 1,
                ),
                Expanded(
                  child: Switch(
                    value: controller.isEnglish,
                    onChanged: (value) {
                      controller.isEnglish = value;
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
                  flex: 1,
                ),
                Expanded(
                  child: Obx(() => Switch(
                        value: controller.isDarkTheme,
                        // value: controller.isDarkTheme,
                        onChanged: (value) {
                          controller.changeDartTheme(value);
                        },
                      )),
                ),
              ],
            ),

            Divider(),

            ElevatedButton(
              onPressed: () {
                LocalStorage().remove(LOCAL_STORAGE_USER_TOKEN_KEY);
                Get.offAllNamed(AppRoutes.Login);
              },
              child: const Text('退出登录'),
            ),

            Divider(),

            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(AppRoutes.Device_List);
              },
              child: const Text('设备列表'),
            ),
            // CupertinoButton(
            //     color: CupertinoColors.activeBlue,
            //     child: Text("退出登录"),
            //     onPressed: () {
            //       Get.offAllNamed(AppRoutes.Login);
            //     }),
          ],
        ));
  }
}
