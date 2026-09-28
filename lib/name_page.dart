import 'package:flutter/material.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final nameController = TextEditingController();
  List<String> name = [];
  List<bool> selected = [];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('اسماء'),
      ),
      body: Padding(padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: nameController,
          ),
          SizedBox(height: 20,),
      ElevatedButton(
        onPressed: (){
          setState(() {
            if (nameController.text.trim().isEmpty) {
              return;
              }
            name.add(nameController.text);
            selected.add(true);
          });
        }
        ,child: const Text('عرض الاسم'),),

const SizedBox(height: 20,),

Expanded(child: ListView.builder(
  itemCount: name.length,
  itemBuilder: (context,index){
    return  
        ListTile(
          title: Text(name[index]),
          trailing:  
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             IconButton(
      onPressed: () {
        // تعديل
      },
      icon: const Icon(Icons.edit),
    ),

            IconButton(
              onPressed: () {
                setState(() {
                  name.removeAt(index);
                   selected.removeAt(index);
                });
              },
              icon: const Icon(Icons.delete),

            ),

//             Checkbox(
//   value: selected[index],
//   onChanged: (value) {
//     setState(() {
//       selected[index] = value!;
//     });
//   },
// )
          ],
        )
   
    );
  }))

        ],
      ),
      ),
      
    );
  }
}