import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_drive/controllers/puzzle_controller.dart';

class PuzzleScreen extends StatelessWidget {
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
            Text(
              'Target: ${_controller.currentPuzzle.target}',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: _controller.currentPuzzle.numbers
                  .map((number) => ElevatedButton(
                        onPressed: () =>
                            _controller.addInput(number.toString()),
                        child: Text('$number'),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: _controller.currentPuzzle.operators
                  .map((operator) => ElevatedButton(
                        onPressed: () => _controller.addInput(operator),
                        child: Text(operator),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
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
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
