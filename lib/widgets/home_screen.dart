import 'package:flutter/material.dart';

import 'app_bar/home_app_bar.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController();
   List<String> names = [];
   List<bool> completed = [];
   List<bool> isHidden = [];
   void addproduct(){
        setState(() {
                  names.add(nameController.text);
                  completed.add(false);
                  isHidden.add(false);
                  nameController.clear();
                 
                });
   }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const  Color(0xFFF5F6F9),
      appBar: const HomeAppBar(),
      body : Column(
        children: [
          SizedBox(height: 40,)
,          TextField(
  controller: nameController,

          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: addproduct, child: const Text('حفط')),
              ElevatedButton(onPressed: (){}, child: const Text('تعديل'))
            ],
          ),
          SizedBox(height: 20,),
          names.isEmpty
          ? Expanded(child:  Center(
            child:  Text('لا يوحد الاسماء')))
          :
           Expanded(
          child: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context,index){
            return ListTile(
              title:
              isHidden[index]
              ? const SizedBox.shrink()
              : Text(names[index],
              style:  TextStyle(
                decoration: 
                completed[index]
                ?
                TextDecoration.lineThrough
                : TextDecoration.none,
                
              ),
              ),

              leading: Checkbox(value: completed[index], onChanged: (value){
                setState(() {
                  completed[index] = value!;
                });
              }),
         
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                       isHidden[index] = ! isHidden[index];
                    });
                   


                  }, icon: Icon(isHidden[index]
                  ? Icons.visibility_off
                  :Icons.visibility,
                  )),
                  IconButton(onPressed: (){
                    setState(() {
                      names.removeAt(index);
                    });
                  }, icon: Icon(Icons.remove)),
                ],
              ),
              
            );
          }))
        ],

      ),

    );
    
  }
}

//