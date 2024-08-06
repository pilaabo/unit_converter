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
  final Map<String, int> _measureMap = {
    'Meters': 0,
    'Kilometers': 1,
    'Grams': 2,
    'Kilograms': 3,
    'Feet': 4,
    'Miles': 5,
    'Pounds (lbs)': 6,
    'Ounces': 7,
  };
  final dynamic formulas = {
    '0': [1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0],
    '1': [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0],
    '2': [0, 0, 1, 0.0001, 0, 0, 0.00220462, 0.035274],
    '3': [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
    '4': [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0],
    '5': [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
    '6': [0, 0, 453.592, 0.453592, 0, 0, 1, 16],
    '7': [0, 0, 28.3495, 0.0283495, 3.28084, 0, 0.0625, 1],
  };
  late String _resultMessage;

  void convert(double value, String from, String to) {
    int? nFrom = _measureMap[from];
    int? nTo = _measureMap[to];
    var multiplier = formulas[nFrom.toString()][nTo];
    var result = value * multiplier;
    if (result == 0) {
      _resultMessage = 'This conversion cannot be performed';
    } else {
      _resultMessage =
      '${_numberForm.toString()} $_startMeasure are $result $_convertedMeasure';
    }
    setState(() {
      _resultMessage = _resultMessage;
    });
  }

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
                        .map((value) =>
                        DropdownMenuItem<String>(
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
                        .map((value) =>
                        DropdownMenuItem<String>(
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
                    onPressed: () {
                      if (_numberForm == 0) {
                        return;
                      } else {
                        convert(_numberForm, _startMeasure, _convertedMeasure);
                      }
                    },
                    child: Text(
                      'Convert',
                      style: inputStyle,
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    _resultMessage,
                    style: labelStyle,
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),)
      ,
    );
  }

  @override
  void initState() {
    _numberForm = 0;
    _startMeasure = _measures[0];
    _convertedMeasure = _measures[1];
    _resultMessage = '';
    super.initState();
  }
}
