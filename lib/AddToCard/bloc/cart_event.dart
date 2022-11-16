// ignore_for_file: must_be_immutable

part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartEmptyEvent extends CartEvent {}

class CartLoadedEvent extends CartEvent {}

class CartDeleteAllItemEvent extends CartEvent {}

class CartDeleteSingleItemEvent extends CartEvent {
  final FoodModelData foodModelData;
  CartDeleteSingleItemEvent({required this.foodModelData});
}

class CartAdditionOfQuantityEvent extends CartEvent {
  final FoodModelData foodModelData;
  CartAdditionOfQuantityEvent({required this.foodModelData});
}

class CartSubtractionOfQuantityEvent extends CartEvent {
  final FoodModelData foodModelData;
  CartSubtractionOfQuantityEvent({required this.foodModelData});
}

class FetchAllPricesSuccessfullyEvent extends CartEvent {}

class ProceedToCheckOutSuccessfullyEvent extends CartEvent {
  List<FoodModelData> list;
  ProceedToCheckOutSuccessfullyEvent({required this.list});
}
