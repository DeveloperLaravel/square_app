import 'package:flutter/material.dart';

import '../../bmi/bmi_screen.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    super.key, required this.title, required this.xScore, required this.oScore,
  });
final String title;
final int xScore;
final int oScore;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF4A3298),
              borderRadius: BorderRadius.circular(20)
            ),
            child:  Text.rich(
              TextSpan(
                style: TextStyle(
                  color: Colors.white
                ),
                children: [
           
                  TextSpan(text: 'X : $xScore    0 : $oScore\n'),
                  TextSpan(text:title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
          
                ],
              )
            ),
          ),
        ),
  IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BmiScreen(),
          ),
        );
      },
      icon: const Icon(
        Icons.arrow_forward,
        color:  Color(0xFF4A3298),
        
      ),
    ),

      ],
    );
  }
}