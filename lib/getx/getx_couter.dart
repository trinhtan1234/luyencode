import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {

  var count =0.obs;

   Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX'),
        centerTitle: false,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Obx(
          ()=> Text('$count', style: const TextStyle(fontSize: 40),)
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          count++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}