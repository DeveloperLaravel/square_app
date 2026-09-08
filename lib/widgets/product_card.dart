import 'package:flutter/material.dart';

import '../domain/models/square_model.dart';

class ProductCard extends StatelessWidget {
  final SquareModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          product.image,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(product.name),
        subtitle: Text(product.description),
        trailing: Text(
          '${product.price} \$',
        ),
      ),
    );
  }
}