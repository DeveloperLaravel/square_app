import 'package:flutter/material.dart';

import '../widgets/body/home_header.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();
 double? bmiResult;
 String bmiCategory = '';
 Color myColor = Colors.transparent;
 int quantity =1;
 bool isLoading = false;
  double calculateBMI(String weight, String height){
            double weight = double.parse(weightController.text);
            double height = double.parse(heightController.text);
            double bmi = weight / (height * height);
            return bmi;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
   
      body:
        
        Column(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: Column(
                children: [
            
                  HomeHeader()

             
                  

                ,SizedBox(height: 4),
                     Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SingleChildScrollView(
                        child: Center(
                          child: Container(
                            width: 300,
                            height: 500,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                 const Color(0xFF6DD5ED),
                                 const Color(0xFF2193B0),
                              ]),
                              
                            ),
                            child: Center(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                      SizedBox(height: 10),
                                  Text('BMI: ${bmiResult?.toStringAsFixed(2) ?? ''}',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color:  Color(0xFF0038FF),
                                  ),
                                  ),
                                       Padding(
                                         padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                                         child: TextField(
                                                                   controller: weightController,
                                                                   decoration: const InputDecoration(
                                                                     hintText: 'Enter weight',
                                                                       filled: true,
                                                                 fillColor: Colors.white,
                                                                   ),
                                                                 ),
                                       ),
                        SizedBox(height: 14,),
                             Padding(
                               padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                               child: TextField(
                                 keyboardType: TextInputType.numberWithOptions(decimal: true),
                               controller: heightController,
                               
                               decoration:  InputDecoration(  
                                            
                                                       hintText: 'Enter height ',
                                                        filled: true,
                                                       fillColor: Colors.white,
                                              ),
                                            ),
                             ),
                                           ElevatedButton(onPressed: (){
                  setState(() {
                     bmiResult = calculateBMI( 
                  weightController.text,
                  heightController.text,);
                 if (bmiResult! < 18.5) {
  bmiCategory = 'Underweight';
  myColor = Colors.blue;
} else if (bmiResult! <= 24.9) {
  bmiCategory = 'Normal';
    myColor = Colors.red;
} else if (bmiResult! <= 29.9) {
  bmiCategory = 'Overweight';
    myColor = Colors.yellow;
} else if (bmiResult! <= 34.9) {
  bmiCategory = 'Obese';
    myColor = Colors.teal;
} else {
  bmiCategory = 'Extreme';
}
                  });
                  
    
                }, child: const Text('انسخ')
                ),
                                  
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                 
                    ],
                  ),
                  
               
                  // Categories(),
                  // SpecialOffers(),


                 
                ],
              ),
            ),
           





          ],
        ),

    );
  }
}