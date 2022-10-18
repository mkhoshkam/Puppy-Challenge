import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puppy_challenge/utils/pages.dart';
import 'package:puppy_challenge/utils/routes.dart';

void main() {
  runApp(app());
}

GetMaterialApp app() {
  return GetMaterialApp(
      initialRoute: Routes.home,
      debugShowCheckedModeBanner: false,
      locale:const Locale('en_US'),
      getPages: Pages.pages);
}
