part of 'product_by_id_bloc.dart';

@immutable
abstract class HomeScreenProductState {}

class HomeScreenProductInitialState extends HomeScreenProductState {}

class HomeScreenProductLoadingState extends HomeScreenProductState {}

class HomeScreenProductListSuccessfullyState extends HomeScreenProductState {
  final List<ProductListModel> list;
  HomeScreenProductListSuccessfullyState({required this.list});
}

class HomeScreenProductListFailedState extends HomeScreenProductState {
  final String message;
  HomeScreenProductListFailedState({required this.message});
}

//iss ko ly k chlo
// ignore: must_be_immutable
class HomeScreenCategoryByIdState extends HomeScreenProductState {
  List<ProductByIdModel> list;
  HomeScreenCategoryByIdState({required this.list});
}

class HomeScreenEmptyListState extends HomeScreenProductState {}
