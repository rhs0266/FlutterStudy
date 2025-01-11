import 'package:math_expressions/math_expressions.dart';

class Puzzle {
  final List<int> numbers; // 숫자 리스트
  final List<String> operators; // 연산자 리스트
  final int target; // 목표값

  Puzzle({
    required this.numbers,
    required this.operators,
    required this.target,
  });

  // 정답 확인 함수
  bool checkSolution(List<String> userSolution) {
    try {
      // 유저가 입력한 식을 계산
      final result = _evaluateExpression(userSolution);

      // console에 로그 추력
      print('User Solution: $userSolution');

      return result == target;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  // 식 계산 함수 (유저 입력 기반)
  double _evaluateExpression(List<String> expression) {
    final exp = expression.join();
    Parser parser = Parser(); // 수식 파서
    Expression parsedExp = parser.parse(exp); // 수식을 파싱
    return parsedExp.evaluate(EvaluationType.REAL, ContextModel()); // 계산 결과 반환
  }
}
