import 'dart:math';

import 'package:test_drive/models/puzzle_model.dart';

class PuzzleService {
  final Random _random = Random();

  Puzzle generatePuzzle() {
    List<int> numbers = List.generate(4, (_) => _random.nextInt(10));
    List<String> operators = ['+', '-', '*', '/', '(', ')'];
    int target = _random.nextInt(20) + 1; // 1~20 사이 목표값
    return Puzzle(numbers: numbers, operators: operators, target: target);
  }
}
