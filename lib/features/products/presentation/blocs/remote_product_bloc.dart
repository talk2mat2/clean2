import 'package:clean/core/resources/dart_state.dart';
import 'package:clean/features/products/domain/usecases/getproduct.dart';
import 'package:clean/features/products/presentation/blocs/remote_product_events.dart';
import 'package:clean/features/products/presentation/blocs/remote_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, productstate> {
  final getProductUseCase _getProductUseCase;

  ProductBloc(this._getProductUseCase) : super(const ProductIsLoading()) {
    on<GetProduct>(GetAllProduct);
  }
  void GetAllProduct(GetProduct event, Emitter<productstate> emit) async {
    final dataState = await _getProductUseCase();
    print(dataState);
    // or also   final dataState = await _getProductUseCase.call();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      print("successfull");
      emit(ProductIsDone(dataState.data!));
    }
    if (dataState is DataFailed &&
        dataState.data != null &&
        dataState.data!.isNotEmpty) {
      emit(ProductIsError(dataState.error!));
    }
  }
}
