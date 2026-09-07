import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../domain/product_entity.dart';


class ProductDetailsPage extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() =>
      _ProductDetailsPageState();
}

class _ProductDetailsPageState
    extends State<ProductDetailsPage> {

  // =========================================================
  // Controllers
  // =========================================================

  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _priceController;

  // =========================================================
  // State
  // =========================================================

  late bool _isFavourite;
  late bool _isPopular;

  // =========================================================
  // Init
  // =========================================================

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(
      text: widget.product.title,
    );

    _descriptionController = TextEditingController(
      text: widget.product.description,
    );

    _priceController = TextEditingController(
      text: widget.product.price.toString(),
    );

    _isFavourite = widget.product.isFavourite;

    _isPopular = widget.product.isPopular;
  }

  // =========================================================
  // Dispose
  // =========================================================

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();

    super.dispose();
  }

  // =========================================================
  // Save
  // =========================================================

  void _saveProduct() {

    final updatedProduct = widget.product.copyWith(
      title: _titleController.text.trim(),

      description: _descriptionController.text.trim(),

      price: double.tryParse(
            _priceController.text.trim(),
          ) ??
          widget.product.price,

      isFavourite: _isFavourite,

      isPopular: _isPopular,
    );

    // إرسال المنتج المعدل إلى ProductsScreen
    context.pop(updatedProduct);
  }

  // =========================================================
  // Build
  // =========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Product Details Freeze'),

        actions: [
          IconButton(
            onPressed: _saveProduct,
            icon: const Icon(Icons.check),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // =================================================
            // Title
            // =================================================

            TextField(
              controller: _titleController,

              decoration: const InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // =================================================
            // Description
            // =================================================

            TextField(
              controller: _descriptionController,

              maxLines: 4,

              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // =================================================
            // Price
            // =================================================

            TextField(
              controller: _priceController,

              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),

              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // =================================================
            // Favourite
            // =================================================

            SwitchListTile(
              title: const Text('Favourite'),

              value: _isFavourite,

              onChanged: (value) {
                setState(() {
                  _isFavourite = value;
                });
              },
            ),

            // =================================================
            // Popular
            // =================================================

            SwitchListTile(
              title: const Text('Popular'),

              value: _isPopular,

              onChanged: (value) {
                setState(() {
                  _isPopular = value;
                });
              },
            ),

            const SizedBox(height: 24),

            // =================================================
            // Save Button
            // =================================================

            SizedBox(
              width: double.infinity,
              height: 54,

              child: FilledButton.icon(
                onPressed: _saveProduct,

                icon: const Icon(Icons.save),

                label: const Text(
                  'Save Product',
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}