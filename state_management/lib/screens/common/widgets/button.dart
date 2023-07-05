import 'package:flutter/material.dart';

Widget AddDelButton(Function() action1, Function() action2) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      FloatingActionButton(
        onPressed: action1,
        child: const Icon(Icons.add),
      ),
      const SizedBox(height: 16),
      FloatingActionButton(
        onPressed: action2,
        child: const Icon(Icons.remove),
      ),
    ],
  );
}
