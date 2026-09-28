import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:square_app/prestation/name/name_cubit.dart';

import 'image_loading_page.dart';
import 'name_bloc_page.dart';





void main()async {





  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('ar');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:
      
      // BlocProvider(create: (context)=> NameCubit() ,
      // child:  NameBlocPage() ,)
      
      
      
      //  const  NamePage(),
      ImageLoadingPage(),
    );
  }
}



