import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _result = 'empty';
  final String _accessPath =
      'https://a26b82ea-0a40-43ce-a0f8-1ad0b9a72d0f.mock.pstmn.io/hello';
  final String _accessPathDummy = 'http://shinnaga_dummy.com/test';
  final List<bool> _isSelected = <bool>[false, true];

  final _dio = Dio();

  Future<void> _pushButton(String path) async {
    final res = await _dio.get(path);
    setState(() {
      _result = res.toString();
    });
  }

  @override
  void initState() {
    final dioAdapter =
        DioAdapter(dio: _dio, matcher: const UrlRequestMatcher());

    final path = _accessPathDummy;

    dioAdapter.onGet(
      path,
      (server) => server.reply(
        200,
        {"dummy": "unko"},
        delay: const Duration(seconds: 1),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ToggleButtons(
              isSelected: _isSelected,
              onPressed: (index) {
                setState(
                  () {
                    for (var i = 0; i < _isSelected.length; i++) {
                      _isSelected[i] = i == index;
                    }
                  },
                );
              },
              children: const <Widget>[
                Icon(Icons.accessibility_new),
                Icon(Icons.tungsten_outlined),
              ],
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              _result,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            _pushButton(_isSelected[0] ? _accessPath : _accessPathDummy),
        tooltip: 'Increment',
        child: const Icon(Icons.thumb_up_off_alt_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
