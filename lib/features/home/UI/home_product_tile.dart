import 'package:flutter/material.dart';

import '../models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProdutDataModel productdatamodel;
  const ProductTileWidget({super.key, required this.productdatamodel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Container(
        color: const Color.fromARGB(255, 242, 239, 231),
        height: MediaQuery.of(context).size.height*0.2,
        child: Row(
          children: [
            Text(productdatamodel.name),
Image.network(
                  productdatamodel.url,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
                 IconButton(
                        onPressed: () {
                          // homeBloc.add(
                          //     HomeProductWishlistNavigateButtonClickEvent());
                        },
                        icon: Icon(Icons.favorite)),
                    IconButton(
                        onPressed: () {
                          // homeBloc
                          //     .add(HomeProductCartNavigateButtonClickEvent());
                        },
                        icon: Icon(Icons.shopping_bag))
          ],

        ),
      ),

    );
  }
}
