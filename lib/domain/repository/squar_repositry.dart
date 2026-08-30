import '../models/square_model.dart';

abstract class SquarRepositry {
  Future <List<SquareModel>> getSquar();

}