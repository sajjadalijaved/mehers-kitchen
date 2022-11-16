// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:mehers_kitchen/authentication/authentication.dart';
import 'package:mehers_kitchen/modelclasses/product_by_id.dart';
import 'package:mehers_kitchen/modelclasses/product_list_model.dart';

import 'package:meta/meta.dart';

part 'product_by_id_event.dart';
part 'product_by_id_state.dart';

class HomeScreenProductBloc
    extends Bloc<HomeScreenProductEvent, HomeScreenProductState> {
  HomeScreenProductBloc() : super(HomeScreenProductInitialState()) {
    on<HomeScreenCategoryFetchCategoryByIdSuccessfullyEvent>(
        (event, emit) async {
      emit.call(HomeScreenProductLoadingState());
      if (event.categoryId == 0) {
        try {
          List<ProductByIdModel> list = await getProductList();
          emit.call(HomeScreenCategoryByIdState(list: list));
        } catch (e) {
          emit.call(HomeScreenProductListFailedState(message: e.toString()));
        }
      } else {
        try {
          List<ProductByIdModel> list = await getProductById(event.categoryId);
          if (list.isNotEmpty) {
            emit.call(HomeScreenCategoryByIdState(list: list));
          } else {
            emit.call(HomeScreenEmptyListState());
          }
        } catch (e) {
          emit.call(HomeScreenProductListFailedState(message: e.toString()));
        }
      }
    });
  }
}
