import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_1/data/data_model.dart';
import 'package:bloc_1/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishlistButtonClickEvent>(
        homeProductWishlistButtonClickEvent);

    on<HomeProductCarttButtonClickEvent>(homeProductCarttButtonClickEvent);

    on<HomeProductWishlistNavigateButtonClickEvent>(
        homeProductWishlistNavigateButtonClickEvent);

    on<HomeProductCartNavigateButtonClickEvent>(
        homeProductCartNavigateButtonClickEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

   await Future.delayed(Duration(seconds: 3));

    emit(
      HomeLoadedSucessState(
        products: GroceryData.groceryProducts.map(
          (e) => ProdutDataModel(
              id: e['id'],
              name: e['name'],
              description: e['description'],
              url: e['url'],
              price: e['price']),
        ).toList(),
      ),
    );
  }

  FutureOr<void> homeProductWishlistButtonClickEvent(
      HomeProductWishlistButtonClickEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeProductCarttButtonClickEvent(
      HomeProductCarttButtonClickEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeProductWishlistNavigateButtonClickEvent(
      HomeProductWishlistNavigateButtonClickEvent event,
      Emitter<HomeState> emit) {
    print('wish clicked');
    emit(NavigateToWishListPageActionState());
  }

  FutureOr<void> homeProductCartNavigateButtonClickEvent(
      HomeProductCartNavigateButtonClickEvent event, Emitter<HomeState> emit) {
    print('wish clicked');
    emit(NavigateToCartPageActionState());
  }
}
