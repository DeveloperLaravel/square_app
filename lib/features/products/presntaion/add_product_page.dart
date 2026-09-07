
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../domain/product.dart';


class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  // =========================================================
  // Form
  // =========================================================

  final _formKey = GlobalKey<FormState>();

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
  // State
  // =========================================================

  bool _isFavourite = false;
  bool _isPopular = false;

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
  // Pick Image
  // =========================================================

  Future<void> _pickImage() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image == null) {
      return;
    }

    setState(() {
      _selectedImage = File(image.path);
    });
  }

  // =========================================================
  // Remove Image
  // =========================================================

  void _removeImage() {
    setState(() {
      _selectedImage = null;
    });
  }

  // =========================================================
  // Add Product
  // =========================================================

  void _addProduct() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select a product image',
          ),
        ),
      );

      return;
    }

    final product = Product(
      id: DateTime.now().millisecondsSinceEpoch,

      title: _titleController.text.trim(),

      description:
          _descriptionController.text.trim(),

      price: double.parse(
        _priceController.text.trim(),
      ),

      // الصورة المختارة
      images: [
        _selectedImage!.path,
      ],

      colors: const [
        Colors.white,
      ],

      isFavourite: _isFavourite,

      isPopular: _isPopular,
    );

    // إرسال المنتج إلى ProductsScreen
    context.pop(product);
  }

  // =========================================================
  // Input Decoration
  // =========================================================

  InputDecoration _decoration({
    required String label,
    required IconData icon,
    String? hint,
  }) {
    final colorScheme =
        Theme.of(context).colorScheme;

    return InputDecoration(
      labelText: label,
      hintText: hint,

      prefixIcon: Icon(icon),

      filled: true,

      fillColor:
          colorScheme.surfaceContainerHighest
              .withValues(alpha: 0.35),

      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(14),

        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(14),

        borderSide: BorderSide(
          color: colorScheme.outline
              .withValues(alpha: 0.15),
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(14),

        borderSide: BorderSide(
          color: colorScheme.primary,
          width: 1.5,
        ),
      ),
    );
  }

  // =========================================================
  // Image Widget
  // =========================================================

  Widget _buildImagePicker() {
    final colorScheme =
        Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: _pickImage,

      child: Container(
        width: double.infinity,
        height: 220,

        decoration: BoxDecoration(
          color:
              colorScheme.surfaceContainerHighest,

          borderRadius:
              BorderRadius.circular(18),

          border: Border.all(
            color: colorScheme.outline
                .withValues(alpha: 0.2),
          ),
        ),

        child: _selectedImage == null
            ? _buildEmptyImage()
            : _buildSelectedImage(),
      ),
    );
  }

  // =========================================================
  // Empty Image
  // =========================================================

  Widget _buildEmptyImage() {
    final colorScheme =
        Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center,

      children: [
        Icon(
          Icons.add_photo_alternate_outlined,
          size: 55,
          color: colorScheme.primary,
        ),

        const SizedBox(height: 12),

        Text(
          'Select Product Image',

          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),

        const SizedBox(height: 6),

        Text(
          'Tap to choose an image',

          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(
                color:
                    colorScheme.onSurfaceVariant,
              ),
        ),
      ],
    );
  }

  // =========================================================
  // Selected Image
  // =========================================================

  Widget _buildSelectedImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius:
              BorderRadius.circular(18),

          child: SizedBox(
            width: double.infinity,
            height: double.infinity,

            child: Image.file(
              _selectedImage!,

              fit: BoxFit.contain,
            ),
          ),
        ),

        // Remove button
        Positioned(
          top: 10,
          right: 10,

          child: Material(
            color: Colors.black54,

            borderRadius:
                BorderRadius.circular(30),

            child: InkWell(
              onTap: _removeImage,

              borderRadius:
                  BorderRadius.circular(30),

              child: const Padding(
                padding:
                    EdgeInsets.all(8),

                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),
        ),

        // Change image
        Positioned(
          bottom: 10,
          right: 10,

          child: FilledButton.icon(
            onPressed: _pickImage,

            icon: const Icon(
              Icons.edit,
              size: 18,
            ),

            label: const Text(
              'Change',
            ),
          ),
        ),
      ],
    );
  }

  // =========================================================
  // Build
  // =========================================================

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Product',
        ),

        centerTitle: true,
      ),

      body: SafeArea(
        child: Form(
          key: _formKey,

          child: SingleChildScrollView(
            padding:
                const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                // =================================================
                // Image
                // =================================================

                Text(
                  'Product Image',

                  style: theme
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                        fontWeight:
                            FontWeight.bold,
                      ),
                ),

                const SizedBox(height: 10),

                _buildImagePicker(),

                const SizedBox(height: 24),

                // =================================================
                // Product Name
                // =================================================

                TextFormField(
                  controller:
                      _titleController,

                  textInputAction:
                      TextInputAction.next,

                  decoration:
                      _decoration(
                    label:
                        'Product Name',

                    hint:
                        'Enter product name',

                    icon: Icons
                        .inventory_2_outlined,
                  ),

                  validator: (value) {
                    if (value == null ||
                        value
                            .trim()
                            .isEmpty) {
                      return 'Product name is required';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // =================================================
                // Description
                // =================================================

                TextFormField(
                  controller:
                      _descriptionController,

                  minLines: 4,
                  maxLines: 6,

                  decoration:
                      _decoration(
                    label:
                        'Description',

                    hint:
                        'Enter product description',

                    icon: Icons
                        .description_outlined,
                  ),

                  validator: (value) {
                    if (value == null ||
                        value
                            .trim()
                            .isEmpty) {
                      return 'Description is required';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // =================================================
                // Price
                // =================================================

                TextFormField(
                  controller:
                      _priceController,

                  keyboardType:
                      const TextInputType
                          .numberWithOptions(
                    decimal: true,
                  ),

                  decoration:
                      _decoration(
                    label: 'Price',

                    hint: '0.00',

                    icon: Icons
                        .attach_money_rounded,
                  ),

                  validator: (value) {
                    if (value == null ||
                        value
                            .trim()
                            .isEmpty) {
                      return 'Price is required';
                    }

                    final price =
                        double.tryParse(
                      value.trim(),
                    );

                    if (price == null) {
                      return 'Enter a valid price';
                    }

                    if (price < 0) {
                      return 'Price cannot be negative';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 24),

                // =================================================
                // Favourite
                // =================================================

                SwitchListTile(
                  contentPadding:
                      EdgeInsets.zero,

                  title: const Text(
                    'Favourite',
                  ),

                  subtitle: const Text(
                    'Mark product as favourite',
                  ),

                  value: _isFavourite,

                  onChanged: (value) {
                    setState(() {
                      _isFavourite =
                          value;
                    });
                  },
                ),

                // =================================================
                // Popular
                // =================================================

                SwitchListTile(
                  contentPadding:
                      EdgeInsets.zero,

                  title: const Text(
                    'Popular Product',
                  ),

                  subtitle: const Text(
                    'Show product as popular',
                  ),

                  value: _isPopular,

                  onChanged: (value) {
                    setState(() {
                      _isPopular = value;
                    });
                  },
                ),

                const SizedBox(height: 24),

                // =================================================
                // Add
                // =================================================

                SizedBox(
                  width: double.infinity,
                  height: 54,

                  child:
                      FilledButton.icon(
                    onPressed:
                        _addProduct,

                    icon: const Icon(
                      Icons.add,
                    ),

                    label: const Text(
                      'Add Product',
                    ),

                    style:
                        FilledButton.styleFrom(
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius
                                .circular(
                          14,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // =================================================
                // Cancel
                // =================================================

                SizedBox(
                  width: double.infinity,
                  height: 54,

                  child:
                      OutlinedButton(
                    onPressed: () {
                      context.pop();
                    },

                    child: const Text(
                      'Cancel',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
