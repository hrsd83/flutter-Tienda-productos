// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_myshop/screens/product_detals_screen.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // const ProductItem({
  //   Key? key,
  //   required this.id,
  //   required this.title,
  //   required this.imageUrl,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<Product>(context, listen: false);
    return Consumer<Product>(
      builder: (ctx, product, child) => ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              trailing: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () {}),
              title: Text(
                product.title,
                textAlign: TextAlign.center,
              ),
              leading:  IconButton(
                  icon: Icon(
                    product.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () {
                    product.toggleFavoriteStatus();
                  }),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ProductDetalsScreen.routeName,
                    arguments: product.id);
              },
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
    
  }
}
