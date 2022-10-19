import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puppy_challenge/controllers/homeController.dart';
import 'package:puppy_challenge/widgets/appBar.dart';
import 'package:puppy_challenge/widgets/categoryItem.dart';

import '../utils/faker.dart';
import '../utils/theme.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar("Home", canPop: false),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [Expanded(child: categories()), calculateLayout()],
          ),
        ));
  }
  Widget categories() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: categoriesData.map((category) =>
          categoryItem(
              category,
              selectCategory: controller.selectCategory,
            resetFilter: controller.resetFilter
          )
      ).toList(),
    );
  }

  Widget calculateLayout() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(cardRadius),
      ),
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              controller.isCalculating.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: controller.calculate,
                      child: const Text("Calculate", style: buttonTextStyle)),
              Text("${controller.calculatedAmount.value} \$")
            ],
          )),
    );
  }
}
