import 'package:bloc_1/features/home/UI/home_product_tile.dart';
import 'package:bloc_1/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/UI/cart.dart';
import '../../wishlist/UI/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());

    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeactionState,
      buildWhen: (previous, current) => current is! HomeactionState,
      listener: (context, state) {
        if (state is NavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        } else if (state is NavigateToWishListPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WishListPage()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              ),
            );

          case HomeLoadedSucessState:
            final  mystate= state as HomeLoadedSucessState;
            return Scaffold(
                body: ListView.builder(
                  itemCount: mystate.products.length,
                  itemBuilder: (context, index) {
                  return ProductTileWidget(productdatamodel: mystate.products[index],);
                }),
                appBar: AppBar(
                  actions: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(
                              HomeProductWishlistNavigateButtonClickEvent());
                        },
                        icon: Icon(Icons.favorite)),
                    IconButton(
                        onPressed: () {
                          homeBloc
                              .add(HomeProductCartNavigateButtonClickEvent());
                        },
                        icon: Icon(Icons.shopping_bag))
                  ],
                  title: Text("grocery app"),
                ));
          case HomeErrorState:
            return Scaffold(
              body: Center(child: Text('Error')),
            );
          default:
            return Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
                color: Colors.deepOrange,
              )),
            );
        }
      },
    );
  }
}
