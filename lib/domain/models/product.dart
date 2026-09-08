import 'dart:ui';

class Product {
  final int id;
  final String  title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;
 const Product({
    required this.id,
    required this.description,
    required this.images,
    required this.colors,
    required this.price,
     this.isPopular = false, required this.title,this.rating = 0.0,  this.isFavourite = false,
  });
}
