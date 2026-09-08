import 'package:flutter/material.dart';

import 'product_back_button.dart';
import 'product_rating_badge.dart';

class ProductAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,

      leading: const ProductBackButton(),

      actions: const [
        ProductRatingBadge(
          rating: 4.7,
        ),
      ],
    );
  }
}