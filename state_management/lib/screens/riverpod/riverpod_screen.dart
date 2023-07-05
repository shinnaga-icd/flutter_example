import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/screens/common/common.dart';
import 'package:state_management/screens/riverpod/counter_provider.dart';

class RiverpodScreen extends ConsumerWidget {
  const RiverpodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Screen'),
      ),
      body: Center(
        child: Text(
          'Counter: $count',
          style: const TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: addDelButton(
        () => ref.read(counterProvider.notifier).increment(),
        () => ref.read(counterProvider.notifier).decrement(),
      ),
    );
  }
}
