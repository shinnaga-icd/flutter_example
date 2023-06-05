import 'dart:ui';

import 'package:flutter/material.dart';

late FragmentProgram fragmentProgram;

void main() async {
  fragmentProgram = await FragmentProgram.fromAsset(
    'assets/shaders/myshader.frag',
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomPaint(
        painter: MyPainter(
          const Color.fromARGB(64, 0, 255, 0),
          shader: fragmentProgram.fragmentShader(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter(this.color, {required this.shader});
  final Color color;
  final FragmentShader shader;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, color.red.toDouble() / 255);
    shader.setFloat(3, color.green.toDouble() / 255);
    shader.setFloat(4, color.blue.toDouble() / 255);
    shader.setFloat(5, color.alpha.toDouble() / 255);

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = shader,
    );
  }

  // Repaintを掛ける条件を設定
  @override
  bool shouldRepaint(covariant MyPainter oldDelegate) =>
      color != oldDelegate.color;
}
