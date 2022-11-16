part of 'product_by_id_bloc.dart';

@immutable
abstract class HomeScreenProductEvent {}

class HomeScreenFetchProductInitialEvent {}

class HomeScreenFetchProductListSuccessfullyEvent
    extends HomeScreenProductEvent {}

//iss ko agay ly k chlo
class HomeScreenCategoryFetchCategoryByIdSuccessfullyEvent
    extends HomeScreenProductEvent {
  final int categoryId;
  HomeScreenCategoryFetchCategoryByIdSuccessfullyEvent(
      {required this.categoryId});
}
