import 'package:flutter/material.dart';

import '../../domain/models/product.dart';

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
            (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImage = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selectedImage == index
                          ? Colors.blue
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),
        )
      
      ],
    );
  }
}