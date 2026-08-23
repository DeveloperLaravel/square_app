import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

double width = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('تعليم الفلاثر'),
      ),
      body:  Row(
        children: [


SizedBox(width:20),

            Container(
              width: width,
              height: 100,
                color: Colors.black,
              ),


SizedBox(width: 20,),

            Container(
              width: width,
              height: 100,
                color: Colors.amber,
              ),

SizedBox(width: 20,),
          Container(
              width: width,
              height: 100,
                color: Colors.blue,
              ),


        ],
      ),
    );
  }
}
