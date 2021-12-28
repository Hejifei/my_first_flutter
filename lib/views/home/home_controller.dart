import 'package:get/get.dart';

class HomeController extends GetxController {
  final _count = 0.obs;
  set count(value) => this._count.value = value;
  get count => this._count.value;

  final _count2 = 0.obs;
  set count2(value) => this._count2.value = value;
  get count2 => this._count2;

  String userName = 'Hejifei';

  @override
  void onInit() {
    super.onInit();
    print('onInit');
  }

  @override
  void onReady() {
    print('onReady');
  }

  @override
  void onClose() {
    print('onClose');
  }

  void increment() => _count.value++;

  void changeUserName() {
    userName = 'Hebi';
    update();
  }

  add() => _count.value++;
  add2() => _count2.value++;
}
