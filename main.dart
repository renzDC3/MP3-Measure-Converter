import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();

}
class MyAppState extends State<MyApp> {
  double _numberForm=0;

  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounce',
  ];

  void initState() {
    _numberForm = 0;
    super.initState();
  }
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measures Converter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                items: _measures.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
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
              Text(
                (_numberForm == null ? '' : _numberForm.toString()),
              )
            ],
          ),

        ),
      ),
    );
  }}