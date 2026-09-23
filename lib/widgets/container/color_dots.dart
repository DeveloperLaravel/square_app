import 'package:flutter/material.dart';
import 'package:square_app/domain/models/product.dart';
import 'package:square_app/widgets/container/color_dot.dart';

import 'rounded_icon_btn.dart';



class ColorDots extends StatefulWidget {
  const ColorDots({super.key, required this.product});
  final Product product;

  @override
  State<ColorDots> createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  int selectedColor = 0;
  int quantity =1;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Row(
        children: 
        [
          ...List.generate(widget.product.colors.length, (index){
            return  GestureDetector(
              onTap: (){
                setState(() {
                  selectedColor = index;
                });
              },
              child: ColorDot(color: widget.product.colors[index],
              isSelected: index == selectedColor,
              ),
             
            );
          }),
          const Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press:(){
              setState(() {
                if(quantity > 1){
                  quantity--;
                }
              });
            }
          ),
          Padding(padding: const EdgeInsetsGeometry.symmetric(horizontal: 8),
          child: Text(
            '$quantity',style: Theme.of(context).textTheme.titleMedium,
          ),
          ),
                RoundedIconBtn(
            icon: Icons.add,
            press:(){
                setState(() {
                  quantity++;
              });
            }
          ),
        ]
      ),

    );
  }
}