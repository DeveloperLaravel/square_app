// Product Model
// ======================================================

import 'dart:ui';

class ProductEntity {
  final int id;

  final String title;
  final String description;

  /// مسار الصور داخل assets
  final List<String> images;

  /// ألوان المنتج
  final List<Color> colors;

  final double rating;
  final double price;

  final bool isFavourite;
  final bool isPopular;

  const ProductEntity({
    required this.id,
    required this.images,
    required this.colors,
    required this.title,
    required this.price,
    required this.description,

    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
  });
}