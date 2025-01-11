import 'package:get/get.dart';
import 'package:test_drive/services/puzzle_service.dart';

import '../models/puzzle_model.dart';

class PuzzleController extends GetxController {
  final PuzzleService _puzzleService = PuzzleService();

  late Puzzle currentPuzzle;
  var userSolution = <String>[].obs;
  var isSolved = false.obs;

  PuzzleController() {
    generateNewPuzzle();
  }

  // 퍼즐 초기화
  void generateNewPuzzle() {
    currentPuzzle = _puzzleService.generatePuzzle();
    userSolution.clear();
    isSolved.value = false;
  }

  // 유저 입력 추가
  void addInput(String input) {
    userSolution.add(input);
  }

  // 유저 입력 제거
  void removeLastInput() {
    if (userSolution.isNotEmpty) {
      userSolution.removeLast();
    }
  }

  // 정답 확인
  void checkSolution() {
    isSolved.value = currentPuzzle.checkSolution(userSolution);
  }
}
