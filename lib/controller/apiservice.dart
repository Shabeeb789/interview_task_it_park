import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_task_trissur/model/productmodel.dart';

class ApiServices {
  final Dio dio = Dio();

  /// Get products from the API
  Future<List<ProductModel>> getProduct() async {
    try {
      final response =
          await dio.get("https://interview.sanjaysanthosh.me/api/items");
      if (response.statusCode == 200) {
        final data = jsonEncode(response.data);
        return productModelFromJson(data);
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
    throw Exception("something went wrong");
  }
}

final apiProvider = StateProvider<ApiServices>((ref) {
  return ApiServices();
});

//to get product from api//
final productProvider = FutureProvider<List<ProductModel>>((ref) async {
  return ref.watch(apiProvider).getProduct();
});
