import 'package:flutter/material.dart';
import 'package:untitled/home_page.dart';
import  'package:async/async.dart';

void main(){
  runApp(const MyApp());
  
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

// --------------------------------------------   Using get method man --------------

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Json App"),

        ),

        body: HomePage(),

      ),
    );
  }
}
