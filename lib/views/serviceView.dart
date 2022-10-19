import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puppy_challenge/controllers/serviceController.dart';
import 'package:puppy_challenge/widgets/appBar.dart';
import 'package:puppy_challenge/widgets/categoryItem.dart';

import '../utils/theme.dart';

class ServiceView extends GetView<ServiceController>{
  const ServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar("Services"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              categoryItem(controller.categoryModel),
              Expanded(child: serviceLayout()),
              submitButton()
            ],
          ),
        ));
  }

  Widget serviceLayout() {
    return Obx(() => Column(
      children: [
        CheckboxListTile(title:const Text("Grooming"),value: controller.hasGrooming.value, onChanged: (state){controller.hasGrooming.value = state!;}),
        CheckboxListTile(title:const Text("Hotel"),value: controller.hasHotel.value, onChanged: (state){controller.hasHotel.value = state!;}),
        Obx(() => controller.hasHotel.value ? ListTile(title:const Text("Nights"),trailing:nightOfHotelLayout()):Container())
      ],
    ));
  }

  Widget nightOfHotelLayout() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(onPressed: controller.minusHotelNight, icon: const Icon(Icons.remove_circle,color: Colors.red)),
        Obx(() => Text("${controller.nightOfHotel}")),
        IconButton(onPressed: controller.addHotelNight, icon: const Icon(Icons.add_circle,color: Colors.green,))
      ],
    );
  }

  ElevatedButton submitButton() {
    return ElevatedButton(
        onPressed: controller.submit,
        child:  Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
          Icon(Icons.check,color: Colors.orange,),
          Text("Submit", style: buttonTextStyle)
        ],));
  }

}