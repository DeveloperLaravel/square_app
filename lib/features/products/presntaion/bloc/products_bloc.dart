import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/product.dart';
import 'products_event.dart';
import 'products_state.dart';

class ProductsBloc
    extends Bloc<ProductsEvent, ProductsState> {

  ProductsBloc()
      : super(
          const ProductsState.initial(),
        ) {

    on<AddProduct>(_onAddProduct);

    on<UpdateProduct>(_onUpdateProduct);

    on<DeleteProduct>(_onDeleteProduct);

    on<LoadProducts>(_onLoadProducts);
  }

  // =====================================================
  // Load
  // =====================================================

  void _onLoadProducts(
    LoadProducts event,
    Emitter<ProductsState> emit,
  ) {

    emit(
      const ProductsState.loading(),
    );

    emit(
      const ProductsState.loaded([]),
    );
  }

  // =====================================================
  // Add
  // =====================================================

  void _onAddProduct(
    AddProduct event,
    Emitter<ProductsState> emit,
  ) {

    final currentProducts =
        state.maybeWhen(
      loaded: (products) => products,
      orElse: () => <Product>[],
    );

    final updatedProducts = [
      ...currentProducts,
      event.product,
    ];

    emit(
      ProductsState.loaded(
        updatedProducts,
      ),
    );
  }

  // =====================================================
  // Update
  // =====================================================

  void _onUpdateProduct(
    UpdateProduct event,
    Emitter<ProductsState> emit,
  ) {

    final currentProducts =
        state.maybeWhen(
      loaded: (products) => products,
      orElse: () => <Product>[],
    );

    final updatedProducts =
        currentProducts.map((product) {

      if (product.id == event.product.id) {
        return event.product;
      }

      return product;

    }).toList();

    emit(
      ProductsState.loaded(
        updatedProducts,
      ),
    );
  }

  // =====================================================
  // Delete
  // =====================================================

  void _onDeleteProduct(
    DeleteProduct event,
    Emitter<ProductsState> emit,
  ) {

    final currentProducts =
        state.maybeWhen(
      loaded: (products) => products,
      orElse: () => <Product>[],
    );

    final updatedProducts =
        currentProducts
            .where(
              (product) =>
                  product.id != event.productId,
            )
            .toList();

    emit(
      ProductsState.loaded(
        updatedProducts,
      ),
    );
  }
}