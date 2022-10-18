import 'package:get/get.dart';
import 'package:puppy_challenge/controllers/serviceController.dart';

class ServiceBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceController());
  }
}