class SquareModel {

  final int id;
  final String name;
  final String description;
  final double price;
  final String image;
  final double rating;
  final bool isFavorite;
  SquareModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,this.rating = 0.0, this.isFavorite= false,
  });
}
