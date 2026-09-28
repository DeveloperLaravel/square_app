import 'package:flutter/material.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({super.key, required this.colors, required this.onColorSelected, required this.selectedColor});
  final List<Color> colors;
  final int selectedColor;
  final ValueChanged<int> onColorSelected;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(colors.length, (index){
        return  GestureDetector(
          onTap: (){
onColorSelected(index);
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color:  selectedColor == index? Colors.black : Colors.grey.shade200,
                width: selectedColor == index ? 3 : 1,
              )
            ),
          ),
        );
      }),
    );
  }
}