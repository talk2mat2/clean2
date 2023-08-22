import 'package:clean/core/constant/constant.dart';
import 'package:clean/features/products/data/models/productMode.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'product_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ProductApiService {
  factory ProductApiService(Dio dio) = _ProductApiService;

  @GET('/products')
  Future<HttpResponse<List<ProductModel>>> getProducts();
}
