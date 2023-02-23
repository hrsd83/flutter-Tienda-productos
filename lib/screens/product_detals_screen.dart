// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_myshop/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetalsScreen extends StatelessWidget {
  static const routeName = '/productDetalsScreen';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    //Se obtiene datos de los product
    final loadedProduct = Provider.of<Products>(context).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
        backgroundColor: Colors.black54,
      ),
    );
  }
}
