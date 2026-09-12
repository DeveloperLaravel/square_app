import 'package:flutter/material.dart';

import '../../../domain/product.dart';
import 'color_dot.dart';
import 'rounded_icon_btn.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({
    super.key,
    required this.product, required this.onColorChanged,
  });

  final Product product;
 // نرسل اللون المختار إلى الأب
  final ValueChanged<Color> onColorChanged;
  @override
  State<ColorDots> createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
    // اللون المختار
   int selectedColor = 0;
     // الكمية
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ...List.generate(
            widget.product.colors.length,
            (index) {
              return
               GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = index;
                  });
                     // إرسال اللون المختار إلى الأب
                  widget.onColorChanged(
                    widget.product.colors[index],
                  );
                },
                child:
               ColorDot(
              color: widget.product.colors[index],
              isSelected: index == selectedColor,
            
           ),
          );
          },
          ),
          const Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {
              setState(() {
                if (quantity > 1) {
                  quantity--;
                }
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '$quantity',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {
               setState(() {
                quantity++;
              });
            },
          ),
        ],
      ),
    );
  }
}

