import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
sealed class Product with _$Product {
  const factory Product({
    required int id,
    required String title,
    required double price,
    required String description,
    @JsonKey(name: 'image') required String imageUrl,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
