import 'package:flutter/material.dart';

Widget addDelButton(void Function() action1, void Function() action2) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      FloatingActionButton(
        heroTag: 'add',
        onPressed: action1,
        child: const Icon(Icons.add),
      ),
      const SizedBox(height: 16),
      FloatingActionButton(
        heroTag: 'del',
        onPressed: action2,
        child: const Icon(Icons.remove),
      ),
    ],
  );
}
