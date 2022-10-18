import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(app());
}

GetMaterialApp app() {
  return GetMaterialApp(
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      locale: const Locale('en_US'),
      fallbackLocale: const Locale('en_US'),
      getPages: []);
}
