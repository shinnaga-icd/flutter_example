import 'package:pigeon_exam/pigeon/param_api.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static setParam(Param param) {
    if (param.num != null) {
      _customPrimarySwatch = Color(param.num!);
    }
  }

  static Color? _customPrimarySwatch = const Color(0xFF33FF00);

  static Color? get customPrimarySwatch => _customPrimarySwatch;
}

class MyWidget extends StatelessWidget {
  int val;
  MyWidget({
    super.key,
    required this.val,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
