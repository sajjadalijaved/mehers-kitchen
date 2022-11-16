import 'package:flutter/material.dart';

@immutable
abstract class HomeScreenCategoryEvent {}

class HomeScreenCategoryInitialEvent extends HomeScreenCategoryEvent {}

class HomeScreenCategoryLoadingEvent extends HomeScreenCategoryEvent {}

class HomeScreenCategoryFetchCategoryListSuccessfullyEvent
    extends HomeScreenCategoryEvent {}
