import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:test_drive/app/app_routes.dart'; // 상태 관리 및 라우팅에 GetX 사용
import 'package:test_drive/app/app_theme.dart';
import 'package:test_drive/localization/localization_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App', // TODO: Change

      // Theme
      theme: AppTheme.darkTheme, // 테마 설정
      darkTheme: AppTheme.darkTheme, // 다크 모드 테마 설정
      themeMode: ThemeMode.system, // 시스템 테마에 따라 변경

      // Route
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.pages,

      // Localization
      supportedLocales: LocalizationService.supportedLocales, // 지원 언어
      locale: LocalizationService.locale, // 기본 언어
      translations: LocalizationService(), // 다국어 지원
      fallbackLocale: LocalizationService.fallbackLocale, // 언어 설정 실패 시 기본 언어
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
