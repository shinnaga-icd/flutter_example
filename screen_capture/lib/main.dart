import 'package:flutter/material.dart';
import 'package:screen_capture_event/screen_capture_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ScreenCaptureEvent screenListener = ScreenCaptureEvent();
  var _text = 'Let\'s Cupture!';

  @override
  void initState() {
    screenListener.addScreenRecordListener((recorded) {
      setState(() {
        _text = recorded ? "Recording.." : "Recorded!";
      });
    });
    screenListener.addScreenShotListener((filePath) {
      setState(() {
        _text = "Take ScreenShot!";
      });
    });
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Center(
            child: Text(_text),
          ),
        ));
  }
}
