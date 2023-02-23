import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tienda de Productos'),
        backgroundColor: Colors.black54,
        // elevation: 5,
        centerTitle: true,
      ),
      body: ProductsGridView(),
    );
  }
}

