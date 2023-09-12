import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final message = ''.obs;
  void increase() {
    count.value += 1;
  }

  void giam() {
    count.value -= 1;
  }

  void changeMessage() {
    message.value = 'abc ${count.value}';
  }
}

class ScreenGetX extends GetView<HomeController> {
  @override
  final controller = Get.put(HomeController());

  ScreenGetX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() {
          return Text('So luong la ${controller.count.value}');
        }),
        Obx(() {
          return Text('So luong la ${controller.message.value}');
        }),
        TextButton(
          onPressed: controller.increase,
          child: const Row(
            children: [
              Text('Tang'),
            ],
          ),
        ),
        TextButton(
          onPressed: controller.giam,
          child: const Row(
            children: [
              Text('giam'),
            ],
          ),
        ),
        TextButton(
          onPressed: controller.changeMessage,
          child: const Row(
            children: [
              Text('chang message'),
            ],
          ),
        ),
      ],
    ));
  }
}
