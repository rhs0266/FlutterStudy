import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_drive/app/app_routes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home_title'.tr),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.updateLocale(Locale('ko', 'KR'));
            Get.toNamed(AppRoutes.settings);
          },
          child: Text('go_to_settings'.tr),
        ),
      ),
    );
  }
}
