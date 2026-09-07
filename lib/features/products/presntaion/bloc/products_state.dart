import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:square_app/features/products/domain/product.dart';


part 'products_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() =
      ProductsInitial;

  const factory ProductsState.loading() =
      ProductsLoading;

  const factory ProductsState.loaded(
    List<Product> products,
  ) = ProductsLoaded;

  const factory ProductsState.error(
    String message,
  ) = ProductsError;
}