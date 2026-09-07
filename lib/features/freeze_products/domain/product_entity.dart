import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';

@freezed
abstract class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required int id,
    required String title,
    required String description,

    /// مسارات الصور:
    /// assets/images/phone.png
    /// أو مسار صورة من Gallery
    required List<String> images,

    /// الألوان كـ String
    /// مثال:
    /// ['#FFFFFF', '#000000']
    required List<String> colors,

    required double price,

    @Default(0.0)
    double rating,

    @Default(false)
    bool isFavourite,

    @Default(false)
    bool isPopular,
  }) = _ProductEntity;
}