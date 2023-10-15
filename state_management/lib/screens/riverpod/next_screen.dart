import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/screens/riverpod/counter_provider.dart';
import 'package:state_management/screens/riverpod/test/selected_quiz_provider.dart';

class NextScreen extends ConsumerWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(selectedQuizProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Screen'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'count : ${count.id}',
              style: const TextStyle(fontSize: 24),
            ),
          ),
          ElevatedButton(onPressed: () => ref.read(selectedQuizProvider.notifier).incriment(), child: const Text('test')),
          ElevatedButton(onPressed: () => ref.read(selectedQuizProvider.notifier).setTile('うんこ ${count.id}'), child: const Text('うんこぼたん'))
        ],
      ),
    );
  }
}