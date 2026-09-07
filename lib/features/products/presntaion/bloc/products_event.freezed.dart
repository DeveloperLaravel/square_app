// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsEvent()';
}


}

/// @nodoc
class $ProductsEventCopyWith<$Res>  {
$ProductsEventCopyWith(ProductsEvent _, $Res Function(ProductsEvent) __);
}


/// Adds pattern-matching-related methods to [ProductsEvent].
extension ProductsEventPatterns on ProductsEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddProduct value)?  add,TResult Function( UpdateProduct value)?  update,TResult Function( DeleteProduct value)?  delete,TResult Function( LoadProducts value)?  load,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddProduct() when add != null:
return add(_that);case UpdateProduct() when update != null:
return update(_that);case DeleteProduct() when delete != null:
return delete(_that);case LoadProducts() when load != null:
return load(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddProduct value)  add,required TResult Function( UpdateProduct value)  update,required TResult Function( DeleteProduct value)  delete,required TResult Function( LoadProducts value)  load,}){
final _that = this;
switch (_that) {
case AddProduct():
return add(_that);case UpdateProduct():
return update(_that);case DeleteProduct():
return delete(_that);case LoadProducts():
return load(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddProduct value)?  add,TResult? Function( UpdateProduct value)?  update,TResult? Function( DeleteProduct value)?  delete,TResult? Function( LoadProducts value)?  load,}){
final _that = this;
switch (_that) {
case AddProduct() when add != null:
return add(_that);case UpdateProduct() when update != null:
return update(_that);case DeleteProduct() when delete != null:
return delete(_that);case LoadProducts() when load != null:
return load(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Product product)?  add,TResult Function( Product product)?  update,TResult Function( int productId)?  delete,TResult Function()?  load,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddProduct() when add != null:
return add(_that.product);case UpdateProduct() when update != null:
return update(_that.product);case DeleteProduct() when delete != null:
return delete(_that.productId);case LoadProducts() when load != null:
return load();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Product product)  add,required TResult Function( Product product)  update,required TResult Function( int productId)  delete,required TResult Function()  load,}) {final _that = this;
switch (_that) {
case AddProduct():
return add(_that.product);case UpdateProduct():
return update(_that.product);case DeleteProduct():
return delete(_that.productId);case LoadProducts():
return load();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Product product)?  add,TResult? Function( Product product)?  update,TResult? Function( int productId)?  delete,TResult? Function()?  load,}) {final _that = this;
switch (_that) {
case AddProduct() when add != null:
return add(_that.product);case UpdateProduct() when update != null:
return update(_that.product);case DeleteProduct() when delete != null:
return delete(_that.productId);case LoadProducts() when load != null:
return load();case _:
  return null;

}
}

}

/// @nodoc


class AddProduct implements ProductsEvent {
  const AddProduct(this.product);
  

 final  Product product;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddProductCopyWith<AddProduct> get copyWith => _$AddProductCopyWithImpl<AddProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddProduct&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'ProductsEvent.add(product: $product)';
}


}

/// @nodoc
abstract mixin class $AddProductCopyWith<$Res> implements $ProductsEventCopyWith<$Res> {
  factory $AddProductCopyWith(AddProduct value, $Res Function(AddProduct) _then) = _$AddProductCopyWithImpl;
@useResult
$Res call({
 Product product
});




}
/// @nodoc
class _$AddProductCopyWithImpl<$Res>
    implements $AddProductCopyWith<$Res> {
  _$AddProductCopyWithImpl(this._self, this._then);

  final AddProduct _self;
  final $Res Function(AddProduct) _then;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(AddProduct(
null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product,
  ));
}


}

/// @nodoc


class UpdateProduct implements ProductsEvent {
  const UpdateProduct(this.product);
  

 final  Product product;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProductCopyWith<UpdateProduct> get copyWith => _$UpdateProductCopyWithImpl<UpdateProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProduct&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'ProductsEvent.update(product: $product)';
}


}

/// @nodoc
abstract mixin class $UpdateProductCopyWith<$Res> implements $ProductsEventCopyWith<$Res> {
  factory $UpdateProductCopyWith(UpdateProduct value, $Res Function(UpdateProduct) _then) = _$UpdateProductCopyWithImpl;
@useResult
$Res call({
 Product product
});




}
/// @nodoc
class _$UpdateProductCopyWithImpl<$Res>
    implements $UpdateProductCopyWith<$Res> {
  _$UpdateProductCopyWithImpl(this._self, this._then);

  final UpdateProduct _self;
  final $Res Function(UpdateProduct) _then;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(UpdateProduct(
null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product,
  ));
}


}

/// @nodoc


class DeleteProduct implements ProductsEvent {
  const DeleteProduct(this.productId);
  

 final  int productId;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteProductCopyWith<DeleteProduct> get copyWith => _$DeleteProductCopyWithImpl<DeleteProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteProduct&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'ProductsEvent.delete(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $DeleteProductCopyWith<$Res> implements $ProductsEventCopyWith<$Res> {
  factory $DeleteProductCopyWith(DeleteProduct value, $Res Function(DeleteProduct) _then) = _$DeleteProductCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$DeleteProductCopyWithImpl<$Res>
    implements $DeleteProductCopyWith<$Res> {
  _$DeleteProductCopyWithImpl(this._self, this._then);

  final DeleteProduct _self;
  final $Res Function(DeleteProduct) _then;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(DeleteProduct(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class LoadProducts implements ProductsEvent {
  const LoadProducts();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadProducts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsEvent.load()';
}


}




// dart format on
