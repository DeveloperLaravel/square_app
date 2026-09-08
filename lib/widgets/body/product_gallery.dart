import 'package:flutter/material.dart';

import '../../domain/models/product.dart';
import 'small_product_image.dart';

class ProductGallery extends StatefulWidget {
  final Product product;

  const ProductGallery({
    super.key,
    required this.product,
  });

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    final images = widget.product.images;

    return Column(
      children: [
        // ==========================
        // الصورة الكبيرة
        // ==========================

        SizedBox(
          width: 238,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              images[selectedImage],
              fit: BoxFit.contain,
            ),
          ),
        ),

        const SizedBox(height: 20),

        // ==========================
        // الصور الصغيرة
        // ==========================
   Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
            (index) => SmallProductImage( image: images[index], isSelected: index == selectedImage, press: () { setState(() => selectedImage = index); }, ),
               
              ),
        ),
      
      ],
    );
  }
}