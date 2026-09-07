import 'package:flutter/material.dart';

import '../../domain/product_entity.dart';
import 'product_info/product_description.dart';
import 'product_info/product_price_rating.dart';
import 'product_info/product_title.dart';


class ProductInfo extends StatelessWidget {
  final ProductEntity product;

  const ProductInfo({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        ProductTitle(
          title: product.title,
        ),

        const SizedBox(height: 4),

        ProductDescription(
          description: product.description,
        ),

        const SizedBox(height: 8),

        ProductPriceRating(
          product: product,
        ),
      ],
    );
  }
}