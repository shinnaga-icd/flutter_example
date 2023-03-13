import 'package:flutter/material.dart';
import 'package:pigeon_exam/pigeon/param_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

typedef ParamReceived = void Function(Param param);

class FlutterParamApiHandler extends FlutterParamApi {
  FlutterParamApiHandler(this.callback);

  final ParamReceived callback;

  @override
  void setParams(Param param) {
    callback(param);
  }
}

class _MyAppState extends State<MyApp> {
  String? paramA = 'empty..';
  int? paramB = 0;

  @override
  void initState() {
    super.initState();
    FlutterParamApi.setup(
      FlutterParamApiHandler(
        (param) {
          setState(() {
            paramA = param.a;
            paramB = param.b;
          });
        },
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              paramA ?? 'A is not set',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              paramB?.toString() ?? 'B is not set',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      )),
    );
  }
}
