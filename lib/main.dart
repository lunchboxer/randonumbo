import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RandoNumbo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _randomInt = 0;
  int _min = 1;
  int _max = 40;

  void _generateRandom() {
    setState(() {
      var rng = Random();
      _randomInt = rng.nextInt(_max - _min) + _min;
    });
  }

  void _setMax(String number) {
    setState(() => _max = int.parse(number));
  }

  void _setMin(String number) => setState(() => _min = int.parse(number));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RandoNumbo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Random number',
            ),
            Text(
              '$_randomInt',
              style: const TextStyle(fontSize: 72.0),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                onChanged: _setMin,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Minimum',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                onChanged: _setMax,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Maximum',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FilledButton.tonal(
        onPressed: _generateRandom,
        child: const Icon(Icons.autorenew),
      ),
    );
  }
}
