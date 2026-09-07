import 'dart:io';

import 'package:flutter/material.dart';

import '../../../domain/product.dart';

class ProductImage extends StatelessWidget {
  final Product product;

  const ProductImage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final image = product.images.isNotEmpty
        ? product.images.first
        : '';

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: _image(image, colors),
      ),
    );
  }

  Widget _image(
    String image,
    ColorScheme colors,
  ) {
    if (image.isEmpty) {
      return _placeholder(colors);
    }

    if (image.startsWith('assets/')) {
      return Image.asset(
        image,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) {
          return _placeholder(colors);
        },
      );
    }

    return Image.file(
      File(image),
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) {
        return _placeholder(colors);
      },
    );
  }

  Widget _placeholder(ColorScheme colors) {
    return Icon(
      Icons.image_not_supported_outlined,
      size: 60,
      color: colors.onSurfaceVariant,
    );
  }
}