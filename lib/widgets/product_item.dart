// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_myshop/screens/product_detals_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const ProductItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
              title,
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () {}),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ProductDetalsScreen.routeName, arguments: id);
            },
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
