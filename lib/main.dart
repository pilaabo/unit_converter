import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late double _numberForm;
  late String _startMeasure;
  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];

  @override
  void initState() {
    _numberForm = 0;
    _startMeasure = _measures[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measures Convertor'),
        ),
        body: Center(
          child: Column(
            children: [
              DropdownButton<String>(
                value: _startMeasure,
                items: _measures
                    .map((value) =>
                        DropdownMenuItem<String>(value: value, child: Text(value)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _startMeasure = value ?? _measures[0];
                  });
                },
              ),
              TextField(
                onChanged: (text) {
                  var rv = double.tryParse(text);
                  if (rv != null) {
                    setState(() {
                      _numberForm = rv;
                    });
                  }
                },
              ),
              Text(_numberForm.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
