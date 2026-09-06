import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:square_app/core/router/app_routes.dart';

import 'domain/product_entity.dart';
import 'widgets/screens/product_card.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final List<ProductEntity> products = [];

  // =========================================================
  // إضافة منتج
  // =========================================================

  void addProduct(ProductEntity product) {
    setState(() {
      products.add(product);
    });
  }

  // =========================================================
  // تحديث منتج
  // =========================================================

  void updateProduct(ProductEntity updatedProduct) {
    final index = products.indexWhere(
      (product) => product.id == updatedProduct.id,
    );

    if (index == -1) return;

    setState(() {
      products[index] = updatedProduct;
    });
  }

  // =========================================================
  // فتح تفاصيل المنتج
  // =========================================================

  Future<void> openProduct(ProductEntity product) async {
    final updatedProduct = await context.push<ProductEntity>(
      AppRoutes.productDetails,
      extra: product,
    );

    // إذا تم تعديل المنتج
    if (updatedProduct != null) {
      updateProduct(updatedProduct);
    }
  }

  // =========================================================
  // إضافة منتج جديد
  // =========================================================

  Future<void> openAddProduct() async {
    final product = await context.push<ProductEntity>(
      AppRoutes.addProduct,
    );

    if (product != null) {
      addProduct(product);
    }
  }

  // =========================================================
  // Build
  // =========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // =====================================================
      // AppBar
      // =====================================================

      appBar: AppBar(
        title: const Text('Products'),

        actions: [
          IconButton(
            onPressed: openAddProduct,
            icon: const Icon(Icons.add),
            tooltip: 'Add Product',
          ),
        ],
      ),

      // =====================================================
      // Body
      // =====================================================

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),

          child: products.isEmpty
              ? const Center(
                  child: Text(
                    'No Products',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              : GridView.builder(
                  itemCount: products.length,

                  gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 16,
                  ),

                  itemBuilder: (context, index) {
                    final product = products[index];

                    return ProductCard(
                      product: product,

                      // مهم جداً
                      onPress: () {
                        openProduct(product);
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }
}