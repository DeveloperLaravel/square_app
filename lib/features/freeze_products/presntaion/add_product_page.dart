import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../domain/product_entity.dart';


class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  // =========================================================
  // Controllers
  // =========================================================

  final TextEditingController _titleController =
      TextEditingController();

  final TextEditingController _descriptionController =
      TextEditingController();

  final TextEditingController _priceController =
      TextEditingController();

  // =========================================================
  // Image
  // =========================================================

  final ImagePicker _imagePicker = ImagePicker();

  File? _selectedImage;

  // =========================================================
  // Product state
  // =========================================================

  bool _isFavourite = false;
  bool _isPopular = false;

  // =========================================================
  // Pick Image
  // =========================================================

  Future<void> _pickImage() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image == null) return;

    setState(() {
      _selectedImage = File(image.path);
    });
  }

  // =========================================================
  // Add Product
  // =========================================================

  void _addProduct() {
    // ---------------------------------------------------------
    // Validation
    // ---------------------------------------------------------

    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();
    final priceText = _priceController.text.trim();

    if (title.isEmpty) {
      _showMessage('Please enter product title');
      return;
    }

    if (description.isEmpty) {
      _showMessage('Please enter product description');
      return;
    }

    if (priceText.isEmpty) {
      _showMessage('Please enter product price');
      return;
    }

    final double? price = double.tryParse(priceText);

    if (price == null) {
      _showMessage('Please enter a valid price');
      return;
    }

    if (_selectedImage == null) {
      _showMessage('Please select product image');
      return;
    }

    // ---------------------------------------------------------
    // Create ProductEntity
    // ---------------------------------------------------------

    final product = ProductEntity(
      id: DateTime.now().millisecondsSinceEpoch,

      title: title,

      description: description,

      price: price,

      // Gallery image path
      images: [
        _selectedImage!.path,
      ],

      // Freezed version uses List<String>
      colors: const [
        '#FFFFFF',
      ],

      rating: 0.0,

      isFavourite: _isFavourite,

      isPopular: _isPopular,
    );

    // ---------------------------------------------------------
    // Return product to ProductsScreen
    // ---------------------------------------------------------

    context.pop(product);
  }

  // =========================================================
  // Show Message
  // =========================================================

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
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
  // Build
  // =========================================================

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product Freeze'),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // =================================================
              // Product Image
              // =================================================

              Text(
                'Product Image',
                style: theme.textTheme.titleMedium,
              ),

              const SizedBox(height: 12),

              GestureDetector(
                onTap: _pickImage,

                child: Container(
                  width: double.infinity,
                  height: 220,

                  decoration: BoxDecoration(
                    color: colors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: colors.outlineVariant,
                    ),
                  ),

                  child: _selectedImage == null

                      // No image
                      ? Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center,

                          children: [
                            Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 50,
                              color: colors.onSurfaceVariant,
                            ),

                            const SizedBox(height: 12),

                            Text(
                              'Select Image',
                              style:
                                  theme.textTheme.titleMedium,
                            ),

                            const SizedBox(height: 4),

                            Text(
                              'Tap to choose image from gallery',
                              style:
                                  theme.textTheme.bodySmall,
                            ),
                          ],
                        )

                      // Selected image
                      : ClipRRect(
                          borderRadius:
                              BorderRadius.circular(16),

                          child: Image.file(
                            _selectedImage!,
                            width: double.infinity,
                            height: 220,
                            fit: BoxFit.contain,

                            errorBuilder:
                                (context, error, stackTrace) {
                              return const Center(
                                child: Icon(
                                  Icons.broken_image_outlined,
                                  size: 50,
                                ),
                              );
                            },
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 24),

              // =================================================
              // Title
              // =================================================

              Text(
                'Title',
                style: theme.textTheme.titleMedium,
              ),

              const SizedBox(height: 8),

              TextField(
                controller: _titleController,

                textInputAction:
                    TextInputAction.next,

                decoration: InputDecoration(
                  hintText: 'Enter product title',
                  prefixIcon: const Icon(
                    Icons.shopping_bag_outlined,
                  ),

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // =================================================
              // Description
              // =================================================

              Text(
                'Description',
                style: theme.textTheme.titleMedium,
              ),

              const SizedBox(height: 8),

              TextField(
                controller: _descriptionController,

                maxLines: 4,

                decoration: InputDecoration(
                  hintText: 'Enter product description',

                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(
                      bottom: 60,
                    ),
                    child: Icon(
                      Icons.description_outlined,
                    ),
                  ),

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // =================================================
              // Price
              // =================================================

              Text(
                'Price',
                style: theme.textTheme.titleMedium,
              ),

              const SizedBox(height: 8),

              TextField(
                controller: _priceController,

                keyboardType:
                    const TextInputType.numberWithOptions(
                  decimal: true,
                ),

                decoration: InputDecoration(
                  hintText: 'Enter product price',

                  prefixIcon: const Icon(
                    Icons.attach_money,
                  ),

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // =================================================
              // Favourite
              // =================================================

              SwitchListTile(
                contentPadding: EdgeInsets.zero,

                title: const Text(
                  'Favourite',
                ),

                subtitle: const Text(
                  'Mark this product as favourite',
                ),

                value: _isFavourite,

                onChanged: (value) {
                  setState(() {
                    _isFavourite = value;
                  });
                },

                secondary: const Icon(
                  Icons.favorite_outline,
                ),
              ),

              // =================================================
              // Popular
              // =================================================

              SwitchListTile(
                contentPadding: EdgeInsets.zero,

                title: const Text(
                  'Popular',
                ),

                subtitle: const Text(
                  'Mark this product as popular',
                ),

                value: _isPopular,

                onChanged: (value) {
                  setState(() {
                    _isPopular = value;
                  });
                },

                secondary: const Icon(
                  Icons.star_outline,
                ),
              ),

              const SizedBox(height: 24),

              // =================================================
              // Add Button
              // =================================================

              SizedBox(
                width: double.infinity,
                height: 52,

                child: FilledButton.icon(
                  onPressed: _addProduct,

                  icon: const Icon(
                    Icons.add,
                  ),

                  label: const Text(
                    'Add Product',
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}