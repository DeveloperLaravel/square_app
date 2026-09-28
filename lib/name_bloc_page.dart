import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:square_app/prestation/name/name_cubit.dart';

class NameBlocPage extends StatelessWidget {
   NameBlocPage({super.key});
    final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('عرض الاسم '),
      ),
      body: Padding(padding: const EdgeInsets.all(20),
      child: Column(
        children: [
    

          const SizedBox(height: 30,),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText:'اكتب اسم', 
              border: OutlineInputBorder()
            ),
     
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            context.read<NameCubit>().showName(nameController.text);
          }, child: const Text('عرض اسم')),

                BlocBuilder<NameCubit,String>(builder: (context, name){
            return Text(name,style: const TextStyle(fontSize: 30),);
          }),
        ],
      ),),
    );
  }
}