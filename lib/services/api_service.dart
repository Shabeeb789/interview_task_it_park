import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:interview_task_trissur/model/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_service.g.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://interview.sanjaysanthosh.me/api',
    ),
  );

  /// Get authorization options
  Options _getAuthorizationOption(String token) {
    return Options(headers: {
      'x-access-token': token,
    });
  }

  /// Get products from the API
  Future<List<ProductModel>> getProduct() async {
    try {
      final response = await _dio.get("/items");
      if (response.statusCode == 200) {
        final products = <ProductModel>[];
        for (final product in response.data) {
          products.add(ProductModel.fromJson(product));
        }

        return products;
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
    throw Exception("Something went wrong. Try again");
  }

  /// Login user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post("/login", data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        return (response.data['token']);
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
    throw Exception("Cannot login. Please try again");
  }

  /// Register user
  Future<String> registerUser({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      final response = await _dio.post("/register", data: {
        'name': name,
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        return (response.data['token']);
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
    throw Exception("Cannot register. Please try again");
  }

  /// Get protected data
  Future<String> getProtectedData({
    required String token,
  }) async {
    try {
      final response = await _dio.get(
        "/protected",
        options: _getAuthorizationOption(token),
      );
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        return response.data["message"];
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
    throw Exception("Cannot get protected data. Please try again");
  }

  /// Update user
  Future<bool> updateUser({
    required String name,
    required String password,
    required String token,
  }) async {
    try {
      final response = await _dio.put(
        "/update-user",
        data: {
          'name': name,
          'password': password,
        },
        options: _getAuthorizationOption(token),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
    throw Exception("Cannot update user. Please try again");
  }

  /// Delete user
  Future<bool> deleteUser({
    required String token,
  }) async {
    try {
      final response = await _dio.delete(
        "/delete-user",
        options: _getAuthorizationOption(token),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
    throw Exception("Cannot update user. Please try again");
  }
}

//notifier provider//
@riverpod
ApiServices apiService(ApiServiceRef ref) {
  return ApiServices();
}
