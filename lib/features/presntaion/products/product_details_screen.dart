import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:square_app/core/router/app_routes.dart';

import 'domain/product_entity.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  // =========================================================
  // تعديل المنتج
  // =========================================================

  Future<void> editProduct(BuildContext context) async {
    final updatedProduct = await context.push<ProductEntity>(
      AppRoutes.editProduct,
      extra: product,
    );

    if (updatedProduct != null && context.mounted) {
      // نرجع المنتج المعدل إلى ProductsScreen
      context.pop(updatedProduct);
    }
  }

  // =========================================================
  // Build
  // =========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),

        actions: [
          IconButton(
            onPressed: () {
              editProduct(context);
            },
            icon: const Icon(
              Icons.edit_outlined,
            ),
            tooltip: 'تعديل المنتج',
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // =================================================
            // اسم المنتج
            // =================================================

            Text(
              product.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 10),

            // =================================================
            // الوصف
            // =================================================

            Text(
              product.description,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge,
            ),

            const SizedBox(height: 20),

            // =================================================
            // السعر
            // =================================================

            Text(
              '${product.price.toStringAsFixed(2)} د.ل',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context)
                        .colorScheme
                        .primary,
                  ),
            ),

            const SizedBox(height: 20),

            // =================================================
            // المفضلة
            // =================================================

            if (product.isFavourite)
              const Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  SizedBox(width: 8),
                  Text('منتج مفضل'),
                ],
              ),

            const SizedBox(height: 10),

            // =================================================
            // شائع
            // =================================================

            if (product.isPopular)
              const Row(
                children: [
                  Icon(
                    Icons.local_fire_department,
                  ),
                  SizedBox(width: 8),
                  Text('منتج شائع'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}