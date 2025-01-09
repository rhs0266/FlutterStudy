import 'dart:ui';

import 'package:get/get.dart';

class LocalizationService extends Translations {
  static final locale = const Locale('en', 'US'); // 기본 언어
  static final fallbackLocale = const Locale('en', 'US'); // 실패 시 기본 언어
  static final List<Locale> supportedLocales = [
    const Locale('en', 'US'),
    const Locale('ko', 'KR'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'home_title': '4=10 Puzzle Game',
          'settings_title': 'Settings Screen',
          'go_to_settings': 'Go to Settings',
        },
        'ko_KR': {
          'home_title': '4=10 퍼즐 게임',
          'settings_title': '설정 화면',
          'go_to_settings': '설정 화면으로 이동',
        },
      };
}
