import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String paramA = 'empty..';
  int paramB = 0;
  ParamColor paramC = ParamColor(a: 0, r: 0, g: 0, b: 0);
  String paramI = '';
  Color inputColor = Colors.black;

  Future<String> getImageData() async {
    if (paramI.isNotEmpty) return paramI;
    final bytes = await rootBundle
        .load('assets/images/pa.png')
        .then((value) => value.buffer.asUint8List());
    return base64Encode(bytes);
  }

  @override
  void initState() {
    super.initState();
    FlutterParamApi.setup(
      FlutterParamApiHandler(
        (param) {
          setState(() {
            paramA = param.str ?? 'not input!';
            paramB = param.num ?? -1;
            paramC = param.color ?? ParamColor(a: 0, r: 0, g: 0, b: 0);
            paramI = param.image ?? '';
            inputColor =
                Color.fromARGB(paramC.a!, paramC.r!, paramC.g!, paramC.b!);
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
              paramA,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              paramB.toString(),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(color: inputColor),
              height: 50,
              width: 50,
            ),
            const SizedBox(height: 10),
            Text('input Image ${paramI.substring(0, 100)}'),
            FutureBuilder(
                future: getImageData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  return Image.memory(
                    const Base64Decoder().convert(snapshot.data as String),
                    fit: BoxFit.cover,
                    height: 120,
                    width: 120,
                  );
                }),
          ],
        ),
      )),
    );
  }
}
