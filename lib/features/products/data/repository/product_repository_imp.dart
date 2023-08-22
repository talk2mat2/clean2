import 'dart:io';

import 'package:clean/core/resources/dart_state.dart';
import 'package:clean/features/products/data/data_source/remote/product_api_service.dart';
import 'package:clean/features/products/data/models/productMode.dart';
import 'package:clean/features/products/domain/repository/Product_Reository.dart';
import 'package:dio/dio.dart';

class ProductRepositoryImp implements ProductRepository {
  final ProductApiService _productApiService;

  ProductRepositoryImp(this._productApiService);

  @override
  Future<DataState<List<ProductModel>>> fecthAllProduct() async {
    try {
      final httpPesponse = await _productApiService.getProducts();
      if (httpPesponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpPesponse.data);
      } else {
        return DataFailed(DioException(
            error: httpPesponse.response.statusMessage,
            response: httpPesponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpPesponse.response.requestOptions));
      }
    } on DioException catch (e) {
      print("error occured on fetch $e");
      // print(e);

      // return DataFailed(e);
      return DataFailed(DioException(
          error: null,
          response: null,
          type: DioExceptionType.badResponse,
          requestOptions: RequestOptions()));
    }
  }
}
