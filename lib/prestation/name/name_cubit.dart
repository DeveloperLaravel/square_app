import 'package:flutter_bloc/flutter_bloc.dart';



class NameCubit extends Cubit<String>{
  NameCubit() : super('');
  void showName(String name){
    emit(name);
  }
}