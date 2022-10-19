import 'package:get/get.dart';
import 'package:puppy_challenge/bindings/homeBinding.dart';
import 'package:puppy_challenge/bindings/serviceBinding.dart';
import 'package:puppy_challenge/utils/routes.dart';
import 'package:puppy_challenge/views/HomeView.dart';
import 'package:puppy_challenge/views/serviceView.dart';

class Pages{
  static final pages = <GetPage>[
    GetPage(name: Routes.home, page:()=> const HomeView(),binding: HomeBinding()),
    GetPage(name: Routes.service, page:()=> const ServiceView(),binding: ServiceBinding())
  ];
}

