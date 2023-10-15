import 'package:dialog/second.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showAnnouncementDialog();
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: Center(
          child: Center(
            child: Checkbox(
              value: _isChecked,
              onChanged: (_) {
                setState(() {
                  _isChecked = !_isChecked;
                });
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const SecondPage();
                },
              ),
            );
          },
          child: const Icon(Icons.polymer_sharp),
        ));
  }

  Future<void> showAnnouncementDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: const Text('アナウンス'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('注意やで！'),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (_) {
                        setState(() {
                          _isChecked = !_isChecked;
                        });
                      },
                    ),
                    const Text('次回から表示しない'),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('閉じる'),
              ),
            ],
          );
        });
      },
    );
  }
}
