// ignore_for_file: must_be_immutable

part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartEmptyState extends CartState {}

class CartLoadedState extends CartState {
  double salesTax;
  double subTotalPrice;
  double deliverCharges;
  double total = 0;
  List<FoodModelData> list;
  CartLoadedState(
      {required this.list,
      required this.subTotalPrice,
      required this.salesTax,
      required this.deliverCharges,
      required this.total});
}

class CartFailedState extends CartState {
  final String message;
  CartFailedState({required this.message});
}

class CartDeleteAllItemState extends CartState {}

class CartDeleteSingleItemSate extends CartState {
  double salesTax;
  List<FoodModelData> list;
  double subTotalPrice;
  double deliveryCharges;
  double total;
  CartDeleteSingleItemSate(
      {required this.list,
      required this.subTotalPrice,
      required this.salesTax,
      required this.deliveryCharges,
      required this.total});
}

class CartAdditionOfQuantityState extends CartState {
  List<FoodModelData> list;
  double subTotalPrice;
  double salesTax;
  double deliveryCharges;
  double total;
  CartAdditionOfQuantityState(
      {required this.list,
      required this.subTotalPrice,
      required this.salesTax,
      required this.deliveryCharges,
      required this.total});
}

class CartSubtractionOfQuantityState extends CartState {
  List<FoodModelData> list;
  double subTotalPrice;
  double salesTax;
  double deliveryCharges;
  double total;
  CartSubtractionOfQuantityState(
      {required this.list,
      required this.subTotalPrice,
      required this.salesTax,
      required this.deliveryCharges,
      required this.total});
}

class FetchAllPricesSuccessfullyState extends CartState {
  double subTotalPrice;
  FetchAllPricesSuccessfullyState({required this.subTotalPrice});
}

class ProceedToCheckOutSuccessfullyState extends CartState {}

class ProceedToCheckOutFailedState extends CartState {
  final String message;
  ProceedToCheckOutFailedState({required this.message});
}
