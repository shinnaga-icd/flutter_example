import 'package:flutter/material.dart';

class RiverpodScreen extends StatelessWidget {
  const RiverpodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Screen'),
      ),
      body: const Center(
        child: Text('page A'),
      ),
    );
  }
}
