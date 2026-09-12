
import 'package:flutter/material.dart';

import 'home_back_button.dart';
import 'home_rating.dart';

class HomeAppBar extends StatelessWidget implements  PreferredSizeWidget {
  const HomeAppBar({super.key});
    @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: HomeBackButton(),

    actions: [
        HomeRating(rating: 3.5),
],

    
    );

    
   
  }


}