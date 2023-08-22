import 'package:clean/features/products/domain/entities/ProductEntity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class productstate extends Equatable {
  final List<ProductEntity>? products;
  final DioException? error;
  const productstate({this.products, this.error});
  @override
  List<Object?> get props => [products!, error!];
}

class ProductIsLoading extends productstate {
  const ProductIsLoading();
}

class ProductIsDone extends productstate {
  const ProductIsDone(List<ProductEntity> product) : super(products: product);
}

class ProductIsError extends productstate {
  const ProductIsError(DioException error) : super(error: error);
}
