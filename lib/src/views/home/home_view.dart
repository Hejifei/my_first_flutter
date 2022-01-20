import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../components/bottom_Navigation_bar.dart';
import './home_controller.dart';
import '../stateless_demo.dart';

class Other extends StatelessWidget {
  // 你可以让Get找到一个正在被其他页面使用的Controller，并将它返回给你。
  final HomeController c = Get.find();

  @override
  Widget build(context) {
    // 访问更新后的计数变量
    return Obx(() => Text("${c.count}"));
  }
}

class HomePage extends GetView<HomeController> {
  // final controller = HomeController();

  @override
  Widget build(context) {
    // final controller = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          title: Text('home'.tr),
        ),
        bottomNavigationBar: const BottomNavigationBarComponent(selectIndex: 0),
        drawer: const Drawer(),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('home'.tr),
            GetX<HomeController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print("GetX - 1");
                return Text('value 1 -> ${_.count}');
              },
            ),
            GetX<HomeController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print("GetX - 2");
                return Text('value 2 -> ${_.count}');
              },
            ),
            const Divider(),

            GetX<HomeController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print("GetX - 3");
                return Column(
                  children: [
                    Text('value 3 -> ${_.count}'),
                    ElevatedButton(
                      onPressed: () {
                        _.add();
                      },
                      child: const Text('count1'),
                    )
                  ],
                );
              },
            ),
            const Divider(),

            // count2
            GetX<HomeController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print("GetX - 4");
                return Text('value 4 -> ${_.count2}');
              },
            ),
            const Divider(),

            // 按钮
            ElevatedButton(
              onPressed: () {
                controller.add();
              },
              child: const Text('count1'),
            ),

            ElevatedButton(
              onPressed: () {
                controller.add2();
              },
              child: const Text('count2'),
            ),

            Other(),

            const Divider(),

            const CounterWidget(
              initValue: 0,
            ),
          ],
        ));
  }
}
