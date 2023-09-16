import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Counter extends GetxController {
  RxInt count = 0.obs;
  void add() {
    count++;
  }
}

class HomePage extends StatelessWidget {
  final counter = Get.put(Counter());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter app'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
