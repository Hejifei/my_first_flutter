import 'package:get/get.dart';
import 'package:myapp/src/views/home/scanner/scanner_controller.dart';

class ScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScannerController>(() => ScannerController());
  }
}
