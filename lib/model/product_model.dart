import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    required Rating rating,
  }) = _ProductModel;

//fromjson and to json undakaam//
  factory ProductModel.fromJson(Map<String, Object?> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class Rating with _$Rating {
  factory Rating({
    required double rate,
    required int count,
  }) = _Rating;

  factory Rating.fromJson(Map<String, Object?> json) => _$RatingFromJson(json);
}
