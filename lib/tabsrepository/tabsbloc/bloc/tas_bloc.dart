import 'package:bloc/bloc.dart';
import 'package:mehers_kitchen/modelclasses/category_id_model_page.dart';
import 'package:mehers_kitchen/tabsrepository/tabs_api_class.dart';
import 'package:mehers_kitchen/tabsrepository/tabsbloc/bloc/tas_event.dart';
import 'package:mehers_kitchen/tabsrepository/tabsbloc/bloc/tas_state.dart';
import 'package:meta/meta.dart';

class HomeScreenCategoryBloc
    extends Bloc<HomeScreenCategoryEvent, HomeScreenCategoryState> {
  TabsServices tabsServices = TabsServices();

  HomeScreenCategoryBloc() : super(HomeScreenCategoryInitialState()) {
    on<HomeScreenCategoryFetchCategoryListSuccessfullyEvent>(
        (event, emit) async {
      emit.call(HomeScreenCategoryLoadingState());
      try {
        List<CategoryModel> list = await tabsServices.getCategoryList();
        emit.call(HomeScreenCategoryListSuccessfullyLoadedState(list: list));
      } catch (e) {
        emit.call(HomeScreenCategoryListFailedState(message: e.toString()));
      }
    });
  }
}
