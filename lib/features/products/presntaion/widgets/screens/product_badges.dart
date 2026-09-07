import 'package:flutter/material.dart';

import '../../../domain/product.dart';

class ProductBadges extends StatelessWidget {
  final Product product;

  const ProductBadges({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Row(
      children: [
        if (product.isFavourite)
          Icon(
            Icons.favorite,
            size: 18,
            color: colors.error,
          ),

        if (product.isFavourite && product.isPopular)
          const SizedBox(width: 6),

        if (product.isPopular)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 3,
            ),
            decoration: BoxDecoration(
              color: colors.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'شائع',
              style: theme.textTheme.labelSmall?.copyWith(
                color: colors.onPrimaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}