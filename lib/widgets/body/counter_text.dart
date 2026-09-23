import 'package:flutter/material.dart';

class CounterText extends StatelessWidget {
  const CounterText({
    super.key,
   required this.value, required this.play,
  });
  final String value;
  final VoidCallback play;

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
GestureDetector(
onTap:play ,
child: Container(
  width: 90,
  height: 90,
  decoration: BoxDecoration(
    border: Border.all()
  ),
  child: Center(
    child: Text(value,
    style: const TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold
    ),),
  ),
),
),


      ],

    );
  }
}
