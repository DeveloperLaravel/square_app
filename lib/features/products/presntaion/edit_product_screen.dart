import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:square_app/features/products/domain/product.dart';


class EditProductScreen extends StatefulWidget {
  final Product product;

  const EditProductScreen(
  {required  this.product, super.key
});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final TextEditingController priceController;

  late List<String> images;
  late List<Color> colors;

  bool isFavourite = false;
  bool isPopular = false;

  @override
  void initState() {
    super.initState();

    final product = widget.product;

    titleController = TextEditingController(
      text: product.title,
    );

    descriptionController = TextEditingController(
      text: product.description,
    );

    priceController = TextEditingController(
      text: product.price.toString(),
    );

    images = List.from(product.images);
    colors = List.from(product.colors);

    isFavourite = product.isFavourite;
    isPopular = product.isPopular;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();

    super.dispose();
  }

  // ======================================================
  // اختيار صورة من Gallery
  // ======================================================

  Future<void> pickImage() async {
    final picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image == null) return;

    setState(() {
      images = [
        image.path,
      ];
    });
  }

  // ======================================================
  // حذف الصورة
  // ======================================================

  void removeImage() {
    setState(() {
      images.clear();
    });
  }

  // ======================================================
  // حفظ المنتج
  // ======================================================

  void saveProduct() {
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();
    final price = double.tryParse(
      priceController.text.trim(),
    );

    if (title.isEmpty) {
      showMessage('أدخل اسم المنتج');
      return;
    }

    if (description.isEmpty) {
      showMessage('أدخل وصف المنتج');
      return;
    }

    if (price == null) {
      showMessage('أدخل سعر صحيح');
      return;
    }

    final updatedProduct = Product(
      id: widget.product.id,

      title: title,

      description: description,

      price: price,

      images: images,

      colors: colors,

      rating: widget.product.rating,

      isFavourite: isFavourite,

      isPopular: isPopular,
    );

    context.pop(
      updatedProduct,
    );
  }

  // ======================================================
  // رسالة
  // ======================================================

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تعديل المنتج'),

        actions: [
          IconButton(
            onPressed: saveProduct,
            icon: const Icon(
              Icons.check,
            ),
            tooltip: 'حفظ',
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // ==================================================
            // الصورة
            // ==================================================

            _buildImageSection(),

            const SizedBox(height: 24),

            // ==================================================
            // الاسم
            // ==================================================

            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'اسم المنتج',
                hintText: 'أدخل اسم المنتج',
                prefixIcon: Icon(
                  Icons.shopping_bag_outlined,
                ),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // ==================================================
            // الوصف
            // ==================================================

            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'الوصف',
                hintText: 'أدخل وصف المنتج',
                prefixIcon: Icon(
                  Icons.description_outlined,
                ),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // ==================================================
            // السعر
            // ==================================================

            TextField(
              controller: priceController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'السعر',
                suffixText: 'د.ل',
                prefixIcon: Icon(
                  Icons.payments_outlined,
                ),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // ==================================================
            // المفضلة
            // ==================================================

            SwitchListTile(
              value: isFavourite,
              onChanged: (value) {
                setState(() {
                  isFavourite = value;
                });
              },
              title: const Text(
                'منتج مفضل',
              ),
              secondary: const Icon(
                Icons.favorite_outline,
              ),
            ),

            // ==================================================
            // شائع
            // ==================================================

            SwitchListTile(
              value: isPopular,
              onChanged: (value) {
                setState(() {
                  isPopular = value;
                });
              },
              title: const Text(
                'منتج شائع',
              ),
              secondary: const Icon(
                Icons.local_fire_department_outlined,
              ),
            ),

            const SizedBox(height: 24),

            // ==================================================
            // زر الحفظ
            // ==================================================

            SizedBox(
              width: double.infinity,
              height: 52,

              child: FilledButton.icon(
                onPressed: saveProduct,

                icon: const Icon(
                  Icons.save_outlined,
                ),

                label: const Text(
                  'حفظ التعديلات',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ======================================================
  // Image Section
  // ======================================================

  Widget _buildImageSection() {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text(
          'صورة المنتج',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Container(
          width: double.infinity,
          height: 220,

          decoration: BoxDecoration(
            color: colors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
          ),

          child: images.isEmpty
              ? _emptyImage()
              : _productImage(),
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: pickImage,

                icon: const Icon(
                  Icons.photo_library_outlined,
                ),

                label: const Text(
                  'تغيير الصورة',
                ),
              ),
            ),

            if (images.isNotEmpty) ...[
              const SizedBox(width: 10),

              IconButton(
                onPressed: removeImage,

                icon: const Icon(
                  Icons.delete_outline,
                ),

                color: colors.error,
              ),
            ],
          ],
        ),
      ],
    );
  }

  // ======================================================
  // Image
  // ======================================================

  Widget _productImage() {
    final image = images.first;

    if (image.startsWith('assets/')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),

        child: Image.asset(
          image,
          fit: BoxFit.contain,

          errorBuilder: (_, __, ___) {
            return _emptyImage();
          },
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),

      child: Image.file(
        File(image),
        fit: BoxFit.contain,

        errorBuilder: (_, __, ___) {
          return _emptyImage();
        },
      ),
    );
  }

  // ======================================================
  // Empty Image
  // ======================================================

  Widget _emptyImage() {
    return const Center(
      child: Icon(
        Icons.image_outlined,
        size: 70,
      ),
    );
  }
}