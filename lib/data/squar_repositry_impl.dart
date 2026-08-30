import 'package:square_app/domain/models/square_model.dart';

import '../domain/repository/squar_repositry.dart';

class SquarRepositryImpl  implements SquarRepositry{
  @override
  Future<List<SquareModel>> getSquar() async {

    return [
      SquareModel(id: 1 ,name: 'Abbes'),
      SquareModel(id: 2 ,name: 'Essa'),
    ];
 
  }
  
}