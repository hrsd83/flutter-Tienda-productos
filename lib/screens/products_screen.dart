import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductsScrenn extends StatelessWidget {
  ProductsScrenn({Key? key}) : super(key: key);

  final List<Product> loadedProducts = [
    Product(
        id: 'p1',
        title: 'Red Shirt',
        description: 'A red shirt - it is pretty red!',
        price: 29.99,
        imageUrl:
            'https://www.cronista.com/files/image/295/295924/5ffe0a66110c3.webp?oe=jpg',
        isFavorite: false),
    Product(
        id: 'p2',
        title: 'Trousers',
        description: 'A nice pair of trousers.',
        price: 59.99,
        imageUrl:
            'https://img.clasf.pe/2018/12/31/Zapatillas-Nike-Hyperadapt-Futuro-Solo-Luces-Led-Stock-20181231030259.6842920015.jpg',
        isFavorite: false),
    Product(
        id: 'p3',
        title: 'Yellow Scarf',
        description: 'Warm and cozy - exactly what you need for the winter.',
        price: 19.99,
        imageUrl: 'https://i.blogs.es/7342c1/iphone-13-1-/1366_2000.jpg',
        isFavorite: false),
    Product(
        id: 'p4',
        title: 'A Pan',
        description: 'Prepare any meal you want.',
        price: 49.99,
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
        isFavorite: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tienda de Productos'),
        backgroundColor: Colors.black54,
        // elevation: 5,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, index) => ProductItem(
          id: loadedProducts[index].id,
          imageUrl: loadedProducts[index].imageUrl,
          title: loadedProducts[index].title,
        ),
        //Cuadricula con el GridView
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 4 / 6,
            mainAxisSpacing: 10),
      ),
    );
  }
}
