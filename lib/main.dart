import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp( MyApp()
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  late bool _loading;
  late double _progressValue;
@override
void initState() {
  _loading = false;
  _progressValue = 0.0;
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      backgroundColor:  Colors.indigo,
     appBar:AppBar(
       title: Text('Sample code'),
       centerTitle: true,

     ),
body: Center(
  child: Container(
    padding: EdgeInsets.all(20),
    child: _loading ?
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LinearProgressIndicator(
          value: _progressValue,
        ),
        SizedBox(height: 35),
Text(
  '${(_progressValue * 100).round()}%',
  
  style: TextStyle(
    color:Colors.white,
    fontSize:  20,
  ),
),
SizedBox(height: 35),
      ],
    )
    : 
Text(
  'Press button to downonald',
  style: TextStyle(
    color:Colors.white,
    fontSize:  20,
  ),
),
  ),
),
floatingActionButton: FloatingActionButton( // Добавили плавающую кнопку
  child : Icon(Icons.add),
  onPressed: (){
    setState(
      () {
        _loading = !_loading;
        _updateProgress();
      },
    );
  },
),
     ),

    );
  }

  void _updateProgress() {
    const oneSec = Duration(seconds: 10);
    Timer.periodic(
      oneSec,
      (Timer t) {
        setState(
          (){ 
            _progressValue += 0.2;

            if (_progressValue.toStringAsFixed(1)=='1.0'){
              _loading = false;
              t.cancel();
              _progressValue = 0.0;
              return;
            }
          }
        );
      }
    );
  }
}