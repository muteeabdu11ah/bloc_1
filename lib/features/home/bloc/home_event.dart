part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}


class HomeProductWishlistButtonClickEvent extends HomeEvent {}

class HomeProductCarttButtonClickEvent extends HomeEvent {}

class HomeProductWishlistNavigateButtonClickEvent extends HomeEvent {}

class HomeProductCartNavigateButtonClickEvent extends HomeEvent {}
