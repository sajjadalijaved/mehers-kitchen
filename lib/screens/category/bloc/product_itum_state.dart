part of 'product_itum_bloc.dart';

@immutable
abstract class ProductItumState {}

class ProductItumInitial extends ProductItumState {
  ProductItumInitial();
}

class ProductItumLoadingState extends ProductItumState {
  ProductItumLoadingState();
}

class ProductItumLoadedState extends ProductItumState {
  final List<ProductByIdModel> list;
  ProductItumLoadedState(this.list);
}

class ProductItumErrorState extends ProductItumState {
  final String message;
  ProductItumErrorState(this.message);
}
