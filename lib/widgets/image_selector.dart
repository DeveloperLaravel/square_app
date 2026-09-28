import 'package:flutter/material.dart';

class ImageSelector extends StatelessWidget {
  const ImageSelector({super.key, required this.images, required this.selectedImage, required this.onImageSelected});
  final List<String> images;
  final int selectedImage;
  final ValueChanged<int> onImageSelected;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(images.length, (index){
        return GestureDetector(
          onTap: (){
            onImageSelected(index);
          },
          child: Container(
            width: 70,
            height: 70,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selectedImage == index
                ? Colors.blue : Colors.grey.shade200,
                width: selectedImage == index ?3 :1,
              )
            ),
            child: Image.asset(images[index],fit: BoxFit.contain,),
          ),
        );
      }),
    );
  }
}