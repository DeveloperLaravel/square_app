import 'package:flutter/material.dart';

import 'section_title.dart';
import 'special_offer_card.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Padding(padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
       child: SectionTitle(title: 'Special for you', press: () {  },), ),
       SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SpecialOfferCard(category: 'Smartphone', image: '', numOfBrands: 18, press: () {  },),
          ],
        ),
       )
      ],
    );
  }
}