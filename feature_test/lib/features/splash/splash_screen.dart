import 'package:flutter/material.dart';

@immutable
class SplashScreen extends StatelessWidget {
  const SplashScreen._();

  static const imagePath = 'assets/sample.png';

  static Future<void> precacheAssets(BuildContext context) async {
    await Future.wait<void>([
      precacheImage(
        const AssetImage(imagePath),
        context,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final modalRoute = ModalRoute.of(context);
    return Material(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              width: 288.0,
            ),
            Align(
              alignment: Alignment.topCenter,
              heightFactor: 0.0,
              child: FadeTransition(
                opacity: modalRoute!.animation!,
                child: const CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
