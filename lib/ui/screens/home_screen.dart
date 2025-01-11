import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_drive/app/app_routes.dart';
import 'package:test_drive/ui/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home_title'.tr),
      ),
      body: Center(
          child: Column(children: [
        CustomButton(
            onPressed: () {
              Get.toNamed(AppRoutes.puzzle);
            },
            text: 'go_to_puzzle'.tr),
        CustomButton(
          onPressed: () {
            Get.toNamed(AppRoutes.settings);
          },
          text: 'go_to_settings'.tr,
        )
      ])),
    );
  }
}
