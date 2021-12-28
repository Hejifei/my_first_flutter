import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class IndexController extends GetxController {
  // static IndexController get to => Get.find();

  final box = GetStorage();

  var count = 0.obs;

  // RxInt _id = RxInt();
  // set id(int value) => _id.value = value;
  // int get id => _id.value;

  RxInt _bottomTabActiveIndex = RxInt(0);
  set bottomTabActiveIndex(int value) => {
        if (value is int)
          {
            _bottomTabActiveIndex.value = value,
            box.write('bottomTabActiveIndex', value),
          }
        else
          {_bottomTabActiveIndex.value = 0}
      };
  int get bottomTabActiveIndex => _bottomTabActiveIndex.value;

  increment() => count++;
  // changeBottomTabActiveIndex(index) => _bottomTabActiveIndex.value = index;

  @override
  void onInit() {
    bottomTabActiveIndex = box.read('bottomTabActiveIndex');
    super.onInit();
  }
}
