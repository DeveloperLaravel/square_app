import '../models/square_model.dart';
import '../repository/squar_repositry.dart';

class GetSquar {

final SquarRepositry squarRepositry;
  GetSquar({
    required this.squarRepositry,
  });

Future <List<SquareModel>> call(){
  return  squarRepositry.getSquar();
}

}