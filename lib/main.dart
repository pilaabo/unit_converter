import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late double _numberForm;
  late String _startMeasure;
  late String _convertedMeasure;
  final List<String> _measures = [
    'Meters',
    'Kilometers',
    'Grams',
    'Kilograms',
    'Feet',
    'Miles',
    'Pounds (lbs)',
    'Ounces',
  ];

  @override
  Widget build(BuildContext context) {
    final TextStyle inputStyle = TextStyle(
      fontSize: 15,
      color: Colors.blue[900],
    );
    final TextStyle labelStyle = TextStyle(
      fontSize: 20,
      color: Colors.grey[700],
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measures Convertor'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Value',
                    style: labelStyle,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    style: inputStyle,
                    decoration: InputDecoration(
                        hintText: 'Please insert the measure to be converted'),
                    onChanged: (text) {
                      var rv = double.tryParse(text);
                      if (rv != null) {
                        setState(() {
                          _numberForm = rv;
                        });
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'From',
                    style: labelStyle,
                  ),
                  SizedBox(height: 20),
                  DropdownButton<String>(
                    isExpanded: true,
                    style: inputStyle,
                    value: _startMeasure,
                    items: _measures
                        .map((value) => DropdownMenuItem<String>(
                            value: value, child: Text(value)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _startMeasure = value ?? _measures[0];
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'To',
                    style: labelStyle,
                  ),
                  SizedBox(height: 20),
                  DropdownButton<String>(
                    isExpanded: true,
                    style: inputStyle,
                    value: _convertedMeasure,
                    items: _measures
                        .map((value) => DropdownMenuItem<String>(
                            value: value, child: Text(value)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _convertedMeasure = value ?? _measures[1];
                      });
                    },
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () => true,
                    child: Text(
                      'Convert',
                      style: inputStyle,
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    _numberForm == 0 ? '' : _numberForm.toString(),
                    style: labelStyle,
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _numberForm = 0;
    _startMeasure = _measures[0];
    _convertedMeasure = _measures[1];
    super.initState();
  }
}
