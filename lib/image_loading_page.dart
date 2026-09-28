import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'clock_painter.dart';
import 'data/questions.dart';
import 'widgets/color_selector.dart';
import 'widgets/image_selector.dart';

class ImageLoadingPage extends StatefulWidget {
  const ImageLoadingPage({super.key});

  @override
  State<ImageLoadingPage> createState() => _ImageLoadingPageState();
}

class _ImageLoadingPageState extends State<ImageLoadingPage> {
  int selectedImage = 0;
  int selectedColor = 0;
  bool loading = false;
  bool imageOpened = false;
  int progress = 0;
  int currentQuestion = 0;
  int totalScore = 0;
  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          now = DateTime.now();
        });
      },
    );
  }

  final List<String> images = [

    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',

  ];
  final List<Color> colors =[
Colors.red,
Colors.blue,
Colors.green,
Colors.orange,
  ];
  DateTime now = DateTime.now();
  Timer? timer;

  void startLoading(){
    if(loading) return;
    setState(() {
      loading = true;
      progress = 0;
      imageOpened = false;
    });
    timer = Timer.periodic(const Duration(milliseconds: 150), (timer){
      setState(() {
        progress += 5;
      });
      if(progress >= 100){
        timer.cancel();
        setState(() {
          progress = 100;
          loading = false;
          imageOpened=true;
        });
      }
    });
  }
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // final question = questions[currentQuestion];
    // final String time = DateFormat('HH:mm:ss').format(now);
    //  final String date = DateFormat(
    //   'EEEE، d MMMM yyyy',
    //   'ar',
    // ).format(now);
    return  Scaffold(
      appBar: AppBar(
        title: const Text('معرض الصورة'),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: imageOpened
                ?
                Image.asset(images[selectedImage],
                fit: BoxFit.contain,)
                :  const Icon(
                          Icons.image,
                          size: 100,
                          color: Colors.grey,
                        ),
              ),
            ),
            const SizedBox(height: 20,),
            if(loading)
            Text('$progress',style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
        
            const SizedBox(height: 10,),
        
            if(loading)
            LinearProgressIndicator(
              value: progress / 100,
            ),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(onPressed: loading ? null : startLoading,
               child: Text(loading    ? 'جاري التحميل $progress%'
                        : 'فتح الصورة'
               ) ),
            ),
        
        
        
            const SizedBox(height: 10,),
          ImageSelector(images: images, selectedImage: selectedImage, onImageSelected: (index) { setState(() {
                  selectedImage = index;
                }); },),

            // محتوى إضافي للتجربة 
            const SizedBox(height: 20), 
  // Container(width: double.infinity,
  // height: 200,
  // decoration: BoxDecoration(
  //   color: colors[selectedColor],
  //   borderRadius: BorderRadius.circular(20)
  // ),
  // ),
            const SizedBox(height: 20), 

                // ColorSelector(colors: colors, onColorSelected: (index) {  setState(() {
                  // selectedColor = index;
                // }); }, selectedColor: selectedColor,),
                const SizedBox(height: 20),
                Padding(padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Text( 'السؤال ${currentQuestion + 1} من ${questions.length}',
                    // style: const TextStyle(
                    //   fontSize: 20,
                    //   fontWeight: FontWeight.bold
                    // ),),
                    // Text(question.question,style: const TextStyle(
                    //   fontSize: 24,
                    //   fontWeight: FontWeight.bold,
                    // ),),
                    const SizedBox(height: 30,),
                    // ...question.answers.map((answer){
                    //   return Padding(padding: const EdgeInsets.only(bottom: 12),
                    //   child: ElevatedButton(onPressed: (){
                    //     totalScore += answer.value;
                    //     // if(currentQuestion == questions.length -1){
                        //   showResult();
                        // }else{
                        //   setState(() {
                        //     currentQuestion++;
                        //   });
                        // }
                    //   }, child:  Text(answer.text,
                    //   style: const TextStyle(
                    //     fontSize: 18
                    //   ),)),);
                    // }),
                    SizedBox(height: 20,),
                    Center(
                      child: Column(
                        children: [
                          // Text(time,style: const TextStyle(
                          //   fontSize:40,
                          //   fontWeight: FontWeight.bold,
                          //   letterSpacing: 5,
                          // ),),
                          // const SizedBox(height: 20,),
                          // Text(date,
                          // style: const TextStyle(
                          //   fontSize: 25,
                          //   color: Colors.grey
                          // ),),

                          SizedBox(height: 20,),
                          // Center(
                          //   child: SizedBox(
                          //     width: 320,
                          //     height: 320,
                          //     child: CustomPaint(
                          //       painter: ClockPainter(now),
                          //     ),
                          //   ),
                          // ),

                        ],
                      ),
                    ),
  SizedBox(height: 20,),

// NotesScreen(),


                  ],
                ),)

          ],
        ),
        ),
      ),
    );
  }
  void showResult(){
    showDialog(context: context,
     builder: (context){
      return AlertDialog(
        title: const Text( 'النتيجة',
        ),
        content: Text('مجموع نقاطك: $totalScore',
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
            setState(() {
              currentQuestion = 0;
              totalScore = 0;
            });
          }, child: const Text('اعادة اختبار'))
        ],
        
      );
     });

  }
}