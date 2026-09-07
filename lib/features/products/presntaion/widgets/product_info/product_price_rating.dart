import 'package:flutter/material.dart';

import '../../../domain/product.dart';

class ProductPriceRating extends StatelessWidget {
  final Product product;

  const ProductPriceRating({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            '${product.price.toStringAsFixed(2)} د.ل',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colors.primary,
            ),
          ),
        ),

        if (product.rating > 0)
          Row(
            children: [
              Icon(
                Icons.star,
                size: 18,
                color: colors.primary,
              ),
              const SizedBox(width: 3),
              Text(
                product.rating.toStringAsFixed(1),
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
      ],
    );
  }
}