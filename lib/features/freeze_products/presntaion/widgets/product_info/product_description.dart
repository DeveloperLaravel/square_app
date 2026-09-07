import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final String description;

  const ProductDescription({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Text(
      description,

      maxLines: 2,

      overflow: TextOverflow.ellipsis,

      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(
            color: colors.onSurfaceVariant,
          ),
    );
  }
}