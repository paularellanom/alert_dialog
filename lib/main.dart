import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Alert Dialog!',
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage();

  @override
  State<_HomePage> createState() => __HomePageState();
}

class __HomePageState extends State<_HomePage> {
  bool _readyState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                _showAlert(context);
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)),
              child: const Text(
                'Show Alert',
                style: TextStyle(fontSize: 20, color: Colors.black),
              )),
          const SizedBox(
            height: 50,
          ),
          Text(
            _readyState ? "I am ready" : "I am not ready",
            style: const TextStyle(fontSize: 20, color: Colors.black),
          )
        ]),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          // ignore: prefer_const_constructors
          return AlertDialog(
            title: Text(_readyState ? "Yes, Alert!" : "No, Alert!"),
            content: Text(_readyState ? "Be Careful!" : "Danger!"),
            actions: [
              TextButton(
                  onPressed: () {
                    print("YES!");
                    /* setState(() {
                      _readyState = !_readyState;
                    }); */
                    Navigator.of(context).pop();
                  },
                  child: const Text('YES')),
              TextButton(
                onPressed: () {
                  print("NO!");
                  setState(() {
                    _readyState = !_readyState;
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('NO'),
              )
            ],
          );
        });
  }
}
