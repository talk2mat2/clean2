import 'package:clean/core/resources/dart_state.dart';
import 'package:clean/core/usecases/usecase.dart';
import 'package:clean/features/products/data/repository/product_repository_imp.dart';
import 'package:clean/features/products/domain/entities/ProductEntity.dart';

class getProductUseCase
    implements UseCase<DataState<List<ProductEntity>>, void> {
  final ProductRepositoryImp _productRepository;
  getProductUseCase(this._productRepository);
  @override
  Future<DataState<List<ProductEntity>>> call({void params}) async {
    var res = await _productRepository.fecthAllProduct();
    print("helloooo $res");
    return res;
  }
}
