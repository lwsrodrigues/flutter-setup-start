import 'package:flutter/material.dart';
import 'package:flutter_starter/views/neumorphic/controller.dart';
import 'package:get/get.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class HomeNeutrophil extends GetView<HomeNeutrophilController> {
  const HomeNeutrophil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: NeumorphicButton(
              onPressed: () {
                print("onClick");
              },
              style: const NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
              ),
              padding: const EdgeInsets.all(12.0),
              child: const Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
