import 'package:flutter/material.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({super.key, required this.category, required this.image, required this.numOfBrands, required this.press});
  final String category , image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsetsGeometry.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 242,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                
              ],
            ),
          ),
        ),

      ),
    );
  }
}