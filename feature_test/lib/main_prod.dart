import 'package:feature_test/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:feature_test/utils/extentions/WhenAsyncSnapshot.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Prod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Flutter 2nd Home Page',
      ),
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
  Future<void>? _splashLoader;

  @override
  void initState() {
    super.initState();
    RendererBinding.instance.deferFirstFrame();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _splashLoader ??= _loadSplash(context).whenComplete(
      () => RendererBinding.instance.allowFirstFrame(),
    );
  }

  Future<void> _loadSplash(BuildContext context) async {
    await SplashScreen.precacheAssets(context);
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Flutter 2nd Home Page'),
    //   ),
    //   body: const Center(
    //     child: Text('Flutter 2nd Home Page'),
    //   ),
    // );
    return StreamBuilder(
        stream: null,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return snapshot.when(
            empty: () => const TestWidget(),
            data: (data) {
              return const Scaffold(
                body: Scaffold(
                  body: Text('test'),
                ),
              );
            },
          );
        });
  }
}

final _items = <String, Widget>{
  'item1': const Text('item A'),
  'item2': const Text('item B'),
  'item3': const Text('item C'),
};

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 2nd Home Page'),
      ),
      body: Center(
        child: DropdownButton<String>(
          items: _items.entries
              .map((e) => DropdownMenuItem<String>(
                    value: e.key,
                    child: e.value,
                  ))
              .toList(),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
