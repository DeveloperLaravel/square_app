import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/product.dart';


part 'products_event.freezed.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.add(
    Product product,
  ) = AddProduct;

  const factory ProductsEvent.update(
    Product product,
  ) = UpdateProduct;

  const factory ProductsEvent.delete(
    int productId,
  ) = DeleteProduct;

  const factory ProductsEvent.load() = LoadProducts;
}