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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('تعليم الفلاثر'),
      ),
      body:  ListView(
        children: [



           Container(
                width: 200,
                height: 200,
                  color: Colors.green,
                  child: Text('Elmsry'),
                ),

                Container(
                    width: 150,
                    height: 150,
                      color: Colors.amber,
                      child: Text('Essa'),
                    ),

      
               Container(
                  width: 100,
                  height: 100,
                    color: Colors.blue,
                    child: Text('Abbes'),
                  ),


        ],
      ),
    );
  }
}
