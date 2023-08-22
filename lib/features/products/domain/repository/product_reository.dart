import 'package:clean/core/resources/dart_state.dart';
import 'package:clean/features/products/domain/entities/ProductEntity.dart';

abstract class ProductRepository {
  Future<DataState<List<ProductEntity>>> fecthAllProduct();
}
