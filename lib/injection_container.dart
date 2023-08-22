import 'package:clean/features/products/data/data_source/remote/product_api_service.dart';
import 'package:clean/features/products/data/repository/product_repository_imp.dart';
import 'package:clean/features/products/domain/usecases/getproduct.dart';
import 'package:clean/features/products/presentation/blocs/remote_product_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());
  //apiservices
  sl.registerSingleton<ProductApiService>(ProductApiService(sl()));
  //repository
  sl.registerSingleton<ProductRepositoryImp>(ProductRepositoryImp(sl()));

  //usecases
  sl.registerSingleton<getProductUseCase>(getProductUseCase(sl()));

  //bloc
  sl.registerFactory<ProductBloc>(() => ProductBloc(sl()));
}
