import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../components/bottom_Navigation_bar.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  createState() => MinePageState();
}

class MinePageState extends State<MinePage> {
  int _selectedIndex = 2;

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('mine'.tr),
        ),
        bottomNavigationBar: BottomNavigationBarComponent(selectIndex: 2),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('mine'.tr),
          ],
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        // Get.off(HomePage());
        Get.toNamed('/home');
        break;
      case 1:
        Get.toNamed('/');
        break;
      case 2:
        Get.toNamed('/mine');
        break;
      default:
        break;
    }
  }
}
