import 'package:flutter/material.dart';

class SmallImage extends StatelessWidget {
 const SmallImage({
    super.key,
    required this.isSelected,
    required this.press,
    required this.image,
  });

  final bool isSelected;
  final VoidCallback press;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: AnimatedContainer(duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(8),
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          // ignore: deprecated_member_use
          color:  const Color(0xFFFF7643).withOpacity(isSelected ? 1 : 0 )
        )
      ),
      child:  Image.asset(image , fit: BoxFit.contain,),
      ),
    );
  }
}