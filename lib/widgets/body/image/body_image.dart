import 'package:flutter/material.dart';

import '../../../domain/product.dart';
import 'small_image.dart';

class BodyImage extends StatefulWidget {
  const BodyImage({super.key , required this.product});
  final Product product;

  @override
  State<BodyImage> createState() => _BodyImageState();
}

class _BodyImageState extends State<BodyImage> {
  int selectedImage = 0;
  

  @override
  Widget build(BuildContext context) {
    final images = widget.product.images;
    if (images.isEmpty) { return const Center( child: Icon( Icons.image_not_supported_outlined, size: 60, ), ); }
    return  Column(
      children: [
        SizedBox(       
        width: 238,
        child: AspectRatio(aspectRatio: 1,
        child: Image.asset(images[selectedImage],fit: BoxFit.contain,),),

      ),
      const SizedBox(height: 20,),

      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length, (index){
       return   SmallImage(
           
            image:  images[index],
             isSelected: index == selectedImage,
             press: () { 
            setState(() =>
              selectedImage = index
            );
           }, 
            );
            },
            ),
            
        ),
      )
      ],
 
    );
  }
}
