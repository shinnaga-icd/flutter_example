import 'package:flutter/material.dart';
import '../widgets.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Screen'),
      ),
      body: const Center(
        child: Text('page B'),
      ),
      floatingActionButton: AddDelButton(
        () {},
        () {},
      ),
    );
  }
}
