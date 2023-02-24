import 'package:flutter/material.dart';
import 'package:flutter_myshop/providers/products.dart';
import 'package:provider/provider.dart';
import 'product_item.dart';
import '../providers/products.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView(bool showOnlyFavorites, {Key? key,required this.showFavs}) : super(key: key);
  final bool showFavs;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items  ;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(
            // id:products[i].id,
            // imageUrl:products[i].imageUrl,
            // title:products[i].title,
            ),
      ),
      //Cuadricula con el GridView
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 4 / 6,
          mainAxisSpacing: 10),
    );
  }
}
