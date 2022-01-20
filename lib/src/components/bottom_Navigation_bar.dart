import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/router/app_pages.dart';

class BottomNavigationBarComponent extends StatelessWidget {
  const BottomNavigationBarComponent({required this.selectIndex, Key? key})
      : super(key: key);

  final int selectIndex;

  @override
  Widget build(context) {
    // return DefaultTabController(
    //     length: 4,
    //     initialIndex: selectIndex,
    //     child: Container(
    //       height: 65,
    //       child: TabBar(
    //         indicatorColor: Colors.red,
    //         indicatorWeight: 5,
    //         indicator: const BoxDecoration(),
    //         labelColor: Colors.blue,
    //         // unselectedLabelColor: Colors.grey,
    //         onTap: _onItemTapped,
    //         tabs: [
    //           Tab(
    //             text: 'home'.tr,
    //             iconMargin: EdgeInsets.all(4),
    //             icon: const Icon(Icons.home),
    //           ),
    //           Tab(
    //             text: 'hot'.tr,
    //             iconMargin: EdgeInsets.all(4),
    //             icon: const Icon(Icons.hot_tub),
    //           ),
    //           Tab(
    //             text: 'mine'.tr,
    //             iconMargin: EdgeInsets.all(4),
    //             icon: const Icon(Icons.find_in_page_rounded),
    //           ),
    //           Tab(
    //             text: 'login'.tr,
    //             iconMargin: EdgeInsets.all(4),
    //             icon: const Icon(Icons.login),
    //           )
    //         ],
    //       ),
    //     ));
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
        //     icon: const Icon(Icons.login), label: 'login'.tr),
      ],
      currentIndex: selectIndex,
      fixedColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      // selectedFontSize: 20,
      // unselectedFontSize: 18,
      // selectedItemColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.black,
      onTap: _onItemTapped,
      // backgroundColor: Colors.white.withOpacity(0.38),
    );
  }

  void _onItemTapped(int index) {
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
      // case 3:
      //   Get.offAllNamed(AppRoutes.Login);
      //   break;
      default:
        break;
    }
  }
}
