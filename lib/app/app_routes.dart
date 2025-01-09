// app/app_routes.dart
import 'package:get/get.dart';
import 'package:test_drive/ui/screens/home_screen.dart';
// import 'package:your_app/ui/screens/puzzle_screen.dart';
import 'package:test_drive/ui/screens/settings_screen.dart';

class AppRoutes {
  static const home = '/';
  static const puzzle = '/puzzle';
  static const settings = '/settings';

  static final pages = [
    GetPage(name: home, page: () => HomeScreen()),
    // GetPage(name: puzzle, page: () => const PuzzleScreen()),
    GetPage(name: settings, page: () => SettingsScreen()),
  ];
}
