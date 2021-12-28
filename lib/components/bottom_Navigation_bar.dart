import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:myapp/views/Index/index_controller.dart';
import 'package:myapp/views/home/home_controller.dart';
import '../router/app_pages.dart';
import 'dart:ui' as ui;

import '../locales/index.dart';

class BottomTabController extends GetxController {
  var bottomTabActiveIndex = 0.obs;
  changeBottomTabActiveIndex(index) => bottomTabActiveIndex = index;
}

class BottomNavigationBarComponent extends StatefulWidget {
  const BottomNavigationBarComponent({required int selectIndex, Key? key})
      : super(key: key);

  @override
  createState() => BottomNavigationBarComponentState();
}

class BottomNavigationBarComponentState
    extends State<BottomNavigationBarComponent> {
  final IndexController controller = Get.put(IndexController());

  @override
  Widget build(context) {
    return BottomNavigationBar(
      // 底部导航
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'home'.tr),
        BottomNavigationBarItem(
            icon: const Icon(Icons.hot_tub), label: 'hot'.tr),
        // BottomNavigationBarItem(
        //     icon: const Icon(Icons.find_in_page_rounded), label: 'find'.tr),
        BottomNavigationBarItem(
            icon: const Icon(Icons.find_in_page_rounded), label: 'mine'.tr),
        // BottomNavigationBarItem(
        //     icon: const Icon(Icons.find_in_page_rounded),
        //     label: Obx(() => Text('Clicks: ${homeController.count}'))),
      ],
      currentIndex: controller.bottomTabActiveIndex,
      fixedColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    // setState(() {
    //   _selectedIndex = index;
    // });
    controller.bottomTabActiveIndex = index;
    switch (index) {
      case 0:
        // Get.off(HomePage());
        Get.offAllNamed(AppRoutes.Home);
        break;
      case 1:
        Get.offAllNamed(AppRoutes.Index);
        break;
      case 2:
        Get.offAllNamed(AppRoutes.Mine);
        break;
      default:
        break;
    }
  }
}

// class BottomNavigationBarComponent extends StatelessWidget {
//   BottomNavigationBarComponent({
//     required this.selectIndex,
//     Key? key,
//   }) : super(key: key);

//   final int selectIndex;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       // 底部导航
//       items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'home'.tr),
//         BottomNavigationBarItem(
//             icon: const Icon(Icons.hot_tub), label: 'hot'.tr),
//         // BottomNavigationBarItem(
//         //     icon: const Icon(Icons.find_in_page_rounded), label: 'find'.tr),
//         BottomNavigationBarItem(
//             icon: const Icon(Icons.find_in_page_rounded), label: 'mine'.tr),
//       ],
//       currentIndex: selectIndex,
//       fixedColor: Colors.blue,
//       onTap: _onItemTapped,
//     );
//   }

//   void _onItemTapped(int index) {
//     switch (index) {
//       case 0:
//         // Get.off(HomePage());
//         Get.offAllNamed('/home');
//         break;
//       case 1:
//         Get.offAllNamed('/other');
//         break;
//       case 2:
//         Get.offAllNamed('/mine');
//         break;
//       default:
//         break;
//     }
//   }
// }

