part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeactionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSucessState extends HomeState {
 final List<ProdutDataModel> products;

  HomeLoadedSucessState({required this.products});
}

class HomeErrorState extends HomeState {}

class NavigateToWishListPageActionState extends HomeactionState {}

class NavigateToCartPageActionState extends HomeactionState {}
