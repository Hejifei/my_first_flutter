import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../components/bottom_Navigation_bar.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

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
          ],
        ));
  }
}
