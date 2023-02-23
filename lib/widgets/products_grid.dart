import 'package:flutter/material.dart';
import 'package:flutter_myshop/providers/products.dart';
import 'package:provider/provider.dart';
import 'product_item.dart';
import '../providers/products.dart';

class ProductsGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   final productsData= Provider.of<Products>(context);
   final products = productsData.items; 
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, index) => ProductItem(
        id:products[index].id,
        imageUrl:products[index].imageUrl,
        title:products[index].title,
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
