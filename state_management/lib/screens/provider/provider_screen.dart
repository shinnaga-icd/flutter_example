import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/screens/common/common.dart';
import 'package:state_management/screens/provider/counter_provider.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const ProviderScreenPage(),
    );
  }
}

class ProviderScreenPage extends StatelessWidget {
  const ProviderScreenPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Consumer<CounterProvider>(
        builder: (_, counter, __) => Center(
            child: Text(
          'Counter: ${counter.count}',
          style: const TextStyle(fontSize: 24),
        )),
      ),
      floatingActionButton: addDelButton(
        () => context.read<CounterProvider>().increment(),
        () => context.read<CounterProvider>().decrement(),
      ),
    );
  }
}
