import 'package:flutter/material.dart';
import 'package:mehers_kitchen/modelclasses/category_id_model_page.dart';

@immutable
abstract class HomeScreenCategoryState {}

class HomeScreenCategoryInitialState extends HomeScreenCategoryState {}

class HomeScreenCategoryLoadingState extends HomeScreenCategoryState {}

class HomeScreenCategoryListSuccessfullyLoadedState
    extends HomeScreenCategoryState {
  final List<CategoryModel> list;
  HomeScreenCategoryListSuccessfullyLoadedState({required this.list});
}

class HomeScreenCategoryListFailedState extends HomeScreenCategoryState {
  final String message;
  HomeScreenCategoryListFailedState({required this.message});
}
