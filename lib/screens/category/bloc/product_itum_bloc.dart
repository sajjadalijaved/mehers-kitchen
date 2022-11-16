// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:mehers_kitchen/authentication/authentication.dart';
import 'package:mehers_kitchen/modelclasses/product_by_id.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'product_itum_event.dart';
part 'product_itum_state.dart';

class ProductItumBloc extends Bloc<ProductItumEvent, ProductItumState> {
  ProductItumBloc() : super(ProductItumInitial()) {
    on<FetchProductItumEvent>((event, emit) async {
      emit.call(ProductItumLoadingState());
      try {
        final List<ProductByIdModel> list = await getProductList();
        emit.call(ProductItumLoadedState(list));
      } catch (e) {
        emit.call(ProductItumErrorState(e.toString()));
      }
    });
  }
}
