import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:square_app/core/router/app_routes.dart';

import '../domain/product.dart';
import 'bloc/products_bloc.dart';
import 'bloc/products_event.dart';
import 'bloc/products_state.dart';
import 'widgets/screens/product_card.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  // ============================================================
  // إضافة منتج
  // ============================================================

  Future<void> _addProduct(BuildContext context) async {
    final product = await context.push<Product>(
      AppRoutes.addProduct,
    );

    if (product == null || !context.mounted) return;

    context.read<ProductsBloc>().add(
      ProductsEvent.add(product),
    );
  }

  // ============================================================
  // فتح تفاصيل المنتج
  // ============================================================

  Future<void> _openProduct(
    BuildContext context,
    Product product,
  ) async {
    final updatedProduct = await context.push<Product>(
      AppRoutes.productDetails,
      extra: product,
    );

    if (updatedProduct == null || !context.mounted) return;

    context.read<ProductsBloc>().add(
      ProductsEvent.update(updatedProduct),
    );
  }

  // ============================================================
  // UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ========================================================
      // AppBar
      // ========================================================

      appBar: AppBar(
        title: const Text('Products'),

        actions: [
          IconButton(
            onPressed: () => _addProduct(context),
            icon: const Icon(Icons.add),
            tooltip: 'Add Product',
          ),
        ],
      ),

      // ========================================================
      // Body
      // ========================================================

      body: SafeArea(
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            return state.when(
              initial: _buildInitial,

              loading: _buildLoading,

              loaded: (products) {
                return _buildProducts(
                  context,
                  products,
                );
              },

              error: (message) {
                return _buildError(message);
              },
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // Initial
  // ============================================================

  Widget _buildInitial() {
    return const Center(
      child: Text(
        'No Products',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  // ============================================================
  // Loading
  // ============================================================

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  // ============================================================
  // Products
  // ============================================================

  Widget _buildProducts(
    BuildContext context,
    List<Product> products,
  ) {
    if (products.isEmpty) {
      return const Center(
        child: Text(
          'No Products',
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: GridView.builder(
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

            onPress: () {
              _openProduct(
                context,
                product,
              );
            },
          );
        },
      ),
    );
  }

  // ============================================================
  // Error
  // ============================================================

  Widget _buildError(String message) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }
}