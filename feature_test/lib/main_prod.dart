import 'package:feature_test/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 2nd Home Page'),
      ),
      body: const Center(
        child: Text('Flutter 2nd Home Page'),
      ),
    );
  }
}
