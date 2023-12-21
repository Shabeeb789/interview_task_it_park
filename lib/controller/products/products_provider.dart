import 'package:interview_task_trissur/model/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/api_service.dart';

part 'products_provider.g.dart';

@riverpod
Future<List<ProductModel>> products(ProductsRef ref) async {
  return ref.read(apiServiceProvider).getProduct();
}
