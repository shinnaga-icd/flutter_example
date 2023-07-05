import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/screens/bloc/counter_cubit.dart';
import '../common/common.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const BlocScreenPage(),
    );
  }
}

class BlocScreenPage extends StatelessWidget {
  const BlocScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Screen'),
      ),
      body: Center(
          child: BlocBuilder<CounterCubit, int>(builder: (context, state) {
        return Text(
          'Counter: $state',
          style: const TextStyle(fontSize: 24),
        );
      })),
      floatingActionButton: addDelButton(
        () => context.read<CounterCubit>().increment(),
        () => context.read<CounterCubit>().decrement(),
      ),
    );
  }
}
