import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_drive/controllers/puzzle_controller.dart';

class PuzzleScreen extends StatefulWidget {
  @override
  _PuzzleScreenState createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  List<String> equation = []; // 드롭된 요소를 저장할 리스트
  final PuzzleController _controller = Get.put(
    PuzzleController(),
    tag: 'puzzle_controller',
  );
  var renderResult = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puzzle Game'),
      ),
      body: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 목표값 표시
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Target: ${_controller.currentPuzzle.target}',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            // 식 드롭존
            DragTarget<String>(
              builder: (context, candidateData, rejectedData) {
                return Container(
                  height: 50,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      equation.isNotEmpty ? equation.join(' ') : 'Drop Here',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              },
              onAcceptWithDetails: (data) {
                _controller.addInput(data.data.toString());
                setState(() {
                  equation.add(data.data.toString());
                });
              },
            ),
            const SizedBox(height: 24),
            // 초기 숫자 및 연산자 배열
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _controller.currentPuzzle.numbers
                  .map((number) => Draggable<String>(
                        data: number.toString(),
                        feedback: _buildDraggableItem(number.toString()),
                        child: _buildDraggableItem(number.toString()),
                      ))
                  .toList(),
            ),
            // 연산자 배열
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _controller.currentPuzzle.operators
                  .map((operator) => Draggable<String>(
                        data: operator,
                        feedback: _buildDraggableItem(operator),
                        child: _buildDraggableItem(operator),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 24),
            Text(
              'Your Solution: ${_controller.userSolution.join()}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                renderResult.value = true;
                _controller.checkSolution();
              },
              child: const Text('Check Solution'),
            ),
            if (renderResult.value && _controller.isSolved.value)
              const Text(
                '🎉 Correct! 🎉',
                style: TextStyle(color: Colors.green, fontSize: 24),
              ),
            if (renderResult.value && !_controller.isSolved.value)
              const Text(
                '❌ Incorrect! ❌',
                style: TextStyle(color: Colors.red, fontSize: 24),
              ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          renderResult.value = false;
          _controller.generateNewPuzzle();
          setState(() {
            equation.clear();
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildDraggableItem(String text) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
