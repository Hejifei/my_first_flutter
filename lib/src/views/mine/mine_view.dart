import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/components/bottom_Navigation_bar.dart';
import 'package:myapp/src/views/mine/mine_controller.dart';
import 'package:myapp/src/views/mine/widget/menu_line_widget.dart';
import 'package:myapp/src/views/mine/widget/user_info_widget.dart';
import 'package:myapp/src/router/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/src/views/setting/setting_view.dart';

class MinePage extends GetView<MineController> {
  @override
  Widget build(context) {
    var menuList = [
      MenuLineWidget(
        name: '支付',
        logoUrl: 'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
        onTapEvent: _goToPay,
        isBottomontainerVisible: true,
      ),
      MenuLineWidget(
        name: '收藏',
        logoUrl: 'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
        onTapEvent: _goToPay,
      ),
      MenuLineWidget(
        name: '朋友圈',
        logoUrl: 'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
        onTapEvent: _goToPay,
      ),
      MenuLineWidget(
        name: '卡包',
        logoUrl: 'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
        onTapEvent: _goToPay,
      ),
      MenuLineWidget(
        name: '表情',
        logoUrl: 'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
        onTapEvent: _goToPay,
        isBottomontainerVisible: true,
      ),
      MenuLineWidget(
        name: '设置',
        logoUrl: 'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
        onTapEvent: _goToSetting,
        isLast: true,
      ),
    ];

    return Scaffold(
        // appBar: AppBar(
        //   title: Text('mine'.tr),
        // ),
        bottomNavigationBar: BottomNavigationBarComponent(selectIndex: 2),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            UserInfoWidget(),
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                // borderRadius: BorderRadius.all(const Radius.circular(8))
              ),
            ),
            ...menuList,
            // ElevatedButton(
            //   onPressed: () {
            //     Get.offAllNamed(AppRoutes.Login);
            //   },
            //   child: const Text('退出登录'),
            // ),
            // CupertinoButton(
            //     color: CupertinoColors.activeBlue,
            //     child: Text("退出登录"),
            //     onPressed: () {
            //       Get.offAllNamed(AppRoutes.Login);
            //     }),
          ],
        ));
  }

  void _goToPay() {
    print('pay');
  }

  void _goToSetting() {
    Get.toNamed(AppRoutes.Settings);
  }
}
