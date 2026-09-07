// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductEntity {

 int get id; String get title; String get description;/// مسارات الصور:
/// assets/images/phone.png
/// أو مسار صورة من Gallery
 List<String> get images;/// الألوان كـ String
/// مثال:
/// ['#FFFFFF', '#000000']
 List<String> get colors; double get price; double get rating; bool get isFavourite; bool get isPopular;
/// Create a copy of ProductEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductEntityCopyWith<ProductEntity> get copyWith => _$ProductEntityCopyWithImpl<ProductEntity>(this as ProductEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.colors, colors)&&(identical(other.price, price) || other.price == price)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.isFavourite, isFavourite) || other.isFavourite == isFavourite)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(colors),price,rating,isFavourite,isPopular);

@override
String toString() {
  return 'ProductEntity(id: $id, title: $title, description: $description, images: $images, colors: $colors, price: $price, rating: $rating, isFavourite: $isFavourite, isPopular: $isPopular)';
}


}

/// @nodoc
abstract mixin class $ProductEntityCopyWith<$Res>  {
  factory $ProductEntityCopyWith(ProductEntity value, $Res Function(ProductEntity) _then) = _$ProductEntityCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, List<String> images, List<String> colors, double price, double rating, bool isFavourite, bool isPopular
});




}
/// @nodoc
class _$ProductEntityCopyWithImpl<$Res>
    implements $ProductEntityCopyWith<$Res> {
  _$ProductEntityCopyWithImpl(this._self, this._then);

  final ProductEntity _self;
  final $Res Function(ProductEntity) _then;

/// Create a copy of ProductEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? images = null,Object? colors = null,Object? price = null,Object? rating = null,Object? isFavourite = null,Object? isPopular = null,}) {
  return _then(ProductEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,colors: null == colors ? _self.colors : colors // ignore: cast_nullable_to_non_nullable
as List<String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,isFavourite: null == isFavourite ? _self.isFavourite : isFavourite // ignore: cast_nullable_to_non_nullable
as bool,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductEntity].
extension ProductEntityPatterns on ProductEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProductEntity():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProductEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String description,  List<String> images,  List<String> colors,  double price,  double rating,  bool isFavourite,  bool isPopular)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductEntity() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.images,_that.colors,_that.price,_that.rating,_that.isFavourite,_that.isPopular);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String description,  List<String> images,  List<String> colors,  double price,  double rating,  bool isFavourite,  bool isPopular)  $default,) {final _that = this;
switch (_that) {
case _ProductEntity():
return $default(_that.id,_that.title,_that.description,_that.images,_that.colors,_that.price,_that.rating,_that.isFavourite,_that.isPopular);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String description,  List<String> images,  List<String> colors,  double price,  double rating,  bool isFavourite,  bool isPopular)?  $default,) {final _that = this;
switch (_that) {
case _ProductEntity() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.images,_that.colors,_that.price,_that.rating,_that.isFavourite,_that.isPopular);case _:
  return null;

}
}

}

/// @nodoc


class _ProductEntity implements ProductEntity {
  const _ProductEntity({required this.id, required this.title, required this.description, required  List<String> images, required  List<String> colors, required this.price, this.rating = 0.0, this.isFavourite = false, this.isPopular = false}): _images = images,_colors = colors;
  

@override final  int id;
@override final  String title;
@override final  String description;
/// مسارات الصور:
/// assets/images/phone.png
/// أو مسار صورة من Gallery
 final  List<String> _images;
/// مسارات الصور:
/// assets/images/phone.png
/// أو مسار صورة من Gallery
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

/// الألوان كـ String
/// مثال:
/// ['#FFFFFF', '#000000']
 final  List<String> _colors;
/// الألوان كـ String
/// مثال:
/// ['#FFFFFF', '#000000']
@override List<String> get colors {
  if (_colors is EqualUnmodifiableListView) return _colors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colors);
}

@override final  double price;
@override@JsonKey() final  double rating;
@override@JsonKey() final  bool isFavourite;
@override@JsonKey() final  bool isPopular;

/// Create a copy of ProductEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductEntityCopyWith<_ProductEntity> get copyWith => __$ProductEntityCopyWithImpl<_ProductEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._colors, _colors)&&(identical(other.price, price) || other.price == price)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.isFavourite, isFavourite) || other.isFavourite == isFavourite)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_colors),price,rating,isFavourite,isPopular);

@override
String toString() {
  return 'ProductEntity(id: $id, title: $title, description: $description, images: $images, colors: $colors, price: $price, rating: $rating, isFavourite: $isFavourite, isPopular: $isPopular)';
}


}

/// @nodoc
abstract mixin class _$ProductEntityCopyWith<$Res> implements $ProductEntityCopyWith<$Res> {
  factory _$ProductEntityCopyWith(_ProductEntity value, $Res Function(_ProductEntity) _then) = __$ProductEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, List<String> images, List<String> colors, double price, double rating, bool isFavourite, bool isPopular
});




}
/// @nodoc
class __$ProductEntityCopyWithImpl<$Res>
    implements _$ProductEntityCopyWith<$Res> {
  __$ProductEntityCopyWithImpl(this._self, this._then);

  final _ProductEntity _self;
  final $Res Function(_ProductEntity) _then;

/// Create a copy of ProductEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? images = null,Object? colors = null,Object? price = null,Object? rating = null,Object? isFavourite = null,Object? isPopular = null,}) {
  return _then(_ProductEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,colors: null == colors ? _self._colors : colors // ignore: cast_nullable_to_non_nullable
as List<String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,isFavourite: null == isFavourite ? _self.isFavourite : isFavourite // ignore: cast_nullable_to_non_nullable
as bool,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
