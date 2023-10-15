import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/screens/common/common.dart';
import 'package:state_management/screens/riverpod/counter_provider.dart';
import 'package:state_management/screens/riverpod/next_screen.dart';
import 'package:state_management/screens/riverpod/test/selected_quiz_provider.dart';

class RiverpodScreen extends ConsumerWidget {
  const RiverpodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final test = ref.watch(selectedQuizProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Screen'),
      ),
      body: Center(
        child: Column(children: [
          Text(
            'Counter: $count',
            style: const TextStyle(fontSize: 24),
          ),
          ElevatedButton(
            onPressed: () {
              // ref.read(selectedQuizProvider.notifier).setTile('うんこ');
              ref.read(selectedQuizProvider.notifier).incriment();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NextScreen()));
              }, 
            child: Text('id : ${test.title}'),
          ),
        ],) 
      ),
      floatingActionButton: addDelButton(
        () => ref.read(counterProvider.notifier).increment(),
        () => ref.read(counterProvider.notifier).decrement(),
      ),
    );
  }
}
