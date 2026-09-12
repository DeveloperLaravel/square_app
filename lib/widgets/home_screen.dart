import 'package:flutter/material.dart';

import '../domain/product.dart';
import 'app_bar/home_app_bar.dart';
import 'body/container/color_dots.dart';
import 'body/container/product_description.dart';
import 'body/container/top_rounded_containe.dart';
import 'body/image/body_image.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   Color selectedColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    final product = demoProducts[0];
    return  Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const  Color(0xFFF5F6F9),
      appBar: const HomeAppBar(),
      body : ListView( 
        children: [
          BodyImage(product: product),

         TopRoundedContainer(
          color: selectedColor.withOpacity(0.15),
           child: Column(
            children: [
               ProductDescription(
                  product: product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: selectedColor.withOpacity(0.75),
                  child: Column(
                    children: [
                      ColorDots(product: product, 
                      onColorChanged: (color) { 
                        setState(() {
                      selectedColor = color;
                          });
                       },
                       ),
                    ],
                  ),
                ),
            ],
           ),
           
           ),

        ],),

    );
    
  }
}

// =====================================================
// Products
// =====================================================

 List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
      'assets/images/4.png',
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Wireless Controller for PS4™',
    price: 64.99,
    description: 'Wireless Controller for PS4™',
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),

  Product(
    id: 2,
    images: [
      'https://i.postimg.cc/CxD6nH74/Image-Popular-Product-2.png',
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Nike Sport White - Man Pant',
    price: 50.5,
    description: 'Nike Sport White - Man Pant',
    rating: 4.1,
    isFavourite: false,
    isPopular: true,
  ),

  Product(
    id: 3,
    images: [
      'https://i.postimg.cc/1XjYwvbv/glap.png',
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Gloves XC Omega - Polygon',
    price: 36.55,
    description: 'Gloves XC Omega - Polygon',
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),

  Product(
    id: 4,
    images: [
      'https://i.postimg.cc/d1QWXMYW/Image-Popular-Product-3.png',
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Gloves XC Omega - Polygon',
    price: 36.55,
    description: 'Gloves XC Omega - Polygon',
    rating: 4.1,
    isFavourite: false,
    isPopular: true,
  ),
];