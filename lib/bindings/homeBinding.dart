import 'package:get/get.dart';
import 'package:puppy_challenge/controllers/homeController.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}