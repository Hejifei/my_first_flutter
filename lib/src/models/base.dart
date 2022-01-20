import 'package:get/get.dart';

class BaseModel {
  // BaseModel({
  //   int bottomTabActiveIndex,
  // }) {
  //   this.bottomTabActiveIndex = bottomTabActiveIndex;
  // }

  RxInt _bottomTabActiveIndex = RxInt(0);
  set bottomTabActiveIndex(int value) => _bottomTabActiveIndex.value = value;
  int get bottomTabActiveIndex => _bottomTabActiveIndex.value;
}
