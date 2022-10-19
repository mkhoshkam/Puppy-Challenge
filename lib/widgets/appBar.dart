import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar appBar(String title,{bool canPop = true}){
  return AppBar(
    elevation: 0,
    title:  Text(title),
    leading: canPop ? IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () => Get.back(canPop: true),
    ):null
  );
}

