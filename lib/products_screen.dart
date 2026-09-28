import 'package:flutter/material.dart';

import 'widgets/body/counter_text.dart';
import 'widgets/body/dot_indicator.dart';
import 'widgets/body/home_header.dart';


class ProductsScreen extends StatefulWidget {
 const  ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String userInput = 'userInput';
 
   bool oTurn = true;
   int filledBoxes = 0;
   String time ='';
int xScore = 0;
int oScore = 0;
String winner = '';
bool gameOver = false;
  void play(int index){
  
  if(filledBoxes == 8){
time =  'لا يوجد فائز  في لعبة';
restartGame();
  }
  if(cells[index] == '' && !gameOver){
 setState(() {


  if(oTurn ){
cells[index]  = '0';

  }
  
  else{
    cells[index]  = 'X';
  }
       filledBoxes++;
       checkWinner();
       oTurn = !oTurn;
 
            
         });
         
  }  }
        



   void checkWinner() {
    String player = cells[0];
if (
  cells[0] != '' &&
  cells[0] == cells[1] && cells[1] == cells[2] 
) {
 time =  '$player الفائز في لعبة';
  gameOver = true;
  time = cells[0];
   addScore();
 
}

if (
  cells[3] != '' &&
  cells[3] == player &&
  cells[4] == player &&
  cells[5] == player
) {
  time =  '$player الفائز في لعبة';
    time = cells[3];
  gameOver = true;
     addScore();


}
if (
  cells[6] != '' &&
  cells[6] == player &&
  cells[7] == player &&
  cells[8] == player
) {
  time =  '$player الفائز في لعبة';
    time = cells[6];
  gameOver = true;
     addScore();

}
if (
  cells[0] != '' &&
  cells[0] == player &&
  cells[3] == player &&
  cells[6] == player
) {
  time =  '$player الفائز في لعبة';
    time = cells[0];
  gameOver = true;
     addScore();

}
if (
  cells[1] != '' &&
  cells[1] == player &&
  cells[4] == player &&
  cells[7] == player
) {
  time =  '$player الفائز في لعبة';
      time = cells[1];
  gameOver = true;
     addScore();

}
if (
  cells[2] != '' &&
  cells[2] == player &&
  cells[5] == player &&
  cells[8] == player
) {
  time =  '$player الفائز في لعبة';
   
  gameOver = true;
     addScore();

}
if (
  cells[0] != '' &&
  cells[0] == player &&
  cells[4] == player &&
  cells[8] == player
) {
  time =  '$player الفائز في لعبة';
 
  gameOver = true;
     addScore();

}
if (
  cells[2] != '' &&
  cells[2] == player &&
  cells[4] == player &&
  cells[6] == player
) {
  time =  '$player الفائز في لعبة';
 
  gameOver = true;
   addScore();
}
} 
void addScore() {
  if (time == 'X') {
    xScore++;
  } else if (time == '0') {
    oScore++;
  }
}
void restartGame() {
  setState(() {
    cells = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];

    oTurn = true;
    filledBoxes = 0;
    gameOver = false;
    time = time;
  });
}
List <String> cells  = [
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
];
 int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
   
      body: SafeArea(
        child:  
        
        Column(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: Column(
                children: [
            
                  HomeHeader(),
                  //  DiscountBanner(),
                  // Padding(
                    // padding: const EdgeInsets.only(left: 40),
                    
                    // child: DiscountBanner(title: time.toString(), xScore: xScore, oScore: oScore
                    // ,),
                  // ),
                  // Categories(),
                  // SpecialOffers(),

SizedBox(
  width: 300,
  height: 300,
  child: GridView.builder(gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,

              ),
              itemCount: 9,
               itemBuilder: (context,index){
                return CounterText( value: cells[index] , play:(){
                   play(index);
                } );
  
  }),
),
                 
            ElevatedButton(onPressed: gameOver ? restartGame : null, child: const Text('اعاده العبة'))
                ],
              ),
            ),
           



Row(
  children: List.generate(demoData.length, (index)=> DotIndicator(isActive: index == currentPage)),
)

          ],  
        ),
      ),

    );

          //  ProductCard(
          //   product: product,
  }
}
// Demo data for our Onboarding screen
List<Map<String, dynamic>> demoData = [
  {
    "illustration": "https://i.postimg.cc/L43CKddq/Illustrations.png",
    "title": "All your favorites",
    "text":
        "Order from the best local restaurants \nwith easy, on-demand delivery.",
  },
  {
    "illustration": "https://i.postimg.cc/xTjs9sY6/Illustrations-1.png",
    "title": "Free delivery offers",
    "text":
        "Free delivery for new customers via Apple Pay\nand others payment methods.",
  },
  {
    "illustration": "https://i.postimg.cc/6qcYdZVV/Illustrations-2.png",
    "title": "Choose your food",
    "text":
        "Easily find your type of food craving and\nyou’ll get delivery in wide range.",
  },
];


// List<Product> demoProducts = [
//   Product(
//     id: 1,
//     images: [
//       "assets/images/1.png",
//       "assets/images/2.png",
//       "assets/images/3.png",
//       "assets/images/4.png",
//     ],
//     colors: [
//       const Color(0xFFF6625E),
//       const Color(0xFF836DB8),
//       const Color(0xFFDECB9C),
//       Colors.black45,
//     ],
//     title: "Wireless Controller for PS4™",
//     price: 64.99,
//     description: 'الوصف',
//     rating: 4.8,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 2,
//     images: ["https://i.postimg.cc/CxD6nH74/Image-Popular-Product-2.png"],
//     colors: [
//       const Color(0xFFF6625E),
//       const Color(0xFF836DB8),
//       const Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Nike Sport White - Man Pant",
//     price: 50.5,
//     description: 'description',
//     rating: 4.1,
//     isPopular: true,
//   ),
//   Product(
//     id: 3,
//     images: ["https://i.postimg.cc/1XjYwvbv/glap.png"],
//     colors: [
//       const Color(0xFFF6625E),
//       const Color(0xFF836DB8),
//       const Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Gloves XC Omega - Polygon",
//     price: 36.55,
//     description: 'description',
//     rating: 4.1,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 4,
//     images: ["https://i.postimg.cc/d1QWXMYW/Image-Popular-Product-3.png"],
//     colors: [
//       const Color(0xFFF6625E),
//       const Color(0xFF836DB8),
//       const Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Gloves XC Omega - Polygon",
//     price: 36.55,
//     description: 'description',
//     rating: 4.1,
//     isFavourite: false,
//     isPopular: true,
//   ),
// ];




// const starIcon = '''<svg width="13" height="12" viewBox="0 0 13 12" fill="none" xmlns="http://www.w3.org/2000/svg">
// <path fill-rule="evenodd" clip-rule="evenodd" d="M12.7201 5.50474C12.9813 5.23322 13.0659 4.86077 12.9476 4.50957C12.8292 4.15777 12.5325 3.90514 12.156 3.83313L9.12773 3.25704C9.03883 3.23992 8.96219 3.18621 8.91743 3.11007L7.41279 0.515295C7.22517 0.192424 6.88365 0 6.49983 0C6.116 0 5.7751 0.192424 5.58748 0.515295L4.08284 3.11007C4.03808 3.18621 3.96144 3.23992 3.87192 3.25704L0.844252 3.83313C0.467173 3.90514 0.171028 4.15777 0.0526921 4.50957C-0.0662565 4.86077 0.0189695 5.23322 0.280166 5.50474L2.37832 7.68397C2.43963 7.74831 2.46907 7.83508 2.45803 7.92185L2.09199 10.8725C2.04661 11.2397 2.20419 11.5891 2.51566 11.8063C2.6996 11.935 2.91236 11.9999 3.12696 11.9999C3.27595 11.9999 3.42617 11.9687 3.56842 11.9055L6.36984 10.6577C6.45262 10.6211 6.54704 10.6211 6.62981 10.6577L9.43185 11.9055C9.7795 12.0601 10.1725 12.0235 10.484 11.8063C10.7955 11.5891 10.9537 11.2397 10.9083 10.8725L10.5416 7.92244C10.5306 7.83508 10.56 7.74831 10.6226 7.68397L12.7201 5.50474Z" fill="#FFC416"/>
// </svg>
// ''';