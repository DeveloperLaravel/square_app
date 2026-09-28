import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({this.isActive = false,this.activeColor = const Color(0xFF22A45D),this.inActiveColor = const Color(0xFF868686),super.key});
  final bool isActive ;
  final Color activeColor, inActiveColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin:  const EdgeInsets.symmetric(horizontal: 16/2),
      height: 5,
      width: 8,
      decoration: BoxDecoration(
        color: isActive 
        ? activeColor : inActiveColor
      ),
    );
  }
}