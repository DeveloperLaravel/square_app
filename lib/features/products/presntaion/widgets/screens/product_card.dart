import 'package:flutter/material.dart';

import '../../../domain/product.dart';
import 'product_badges.dart';
import 'product_image.dart';
import 'product_info.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onPress;

  const ProductCard({
    super.key,
    required this.product,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: colors.surface,  
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: colors.outlineVariant,
          ),
          boxShadow: [
            BoxShadow(
              color: colors.shadow.withOpacity(.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ProductImage(product: product),
            ),

            const SizedBox(height: 10),

            ProductInfo(product: product),

            const SizedBox(height: 6),

            ProductBadges(product: product),
          ],
        ),
      ),
    );
  }
}