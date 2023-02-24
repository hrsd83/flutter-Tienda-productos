import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
        id: 'p1',
        title: 'Zapatillas Nike',
        description: 'Unas Zapatillas Hechas para jugar Basketball',
        price: 120.99,
        imageUrl:
            'https://www.cronista.com/files/image/295/295924/5ffe0a66110c3.webp?oe=jpg',
        isFavorite: false),
    Product(
        id: 'p2',
        title: 'Zapatillas Nike',
        description: 'Estan hechas para volar.',
        price: 99.99,
        imageUrl:
            'https://img.clasf.pe/2018/12/31/Zapatillas-Nike-Hyperadapt-Futuro-Solo-Luces-Led-Stock-20181231030259.6842920015.jpg',
        isFavorite: false),
    Product(
        id: 'p3',
        title: 'Iphone 12 Pro',
        description: 'Iphone 12 pro Max de 264 gigas de memoria interna.',
        price: 799.99,
        imageUrl: 'https://i.blogs.es/7342c1/iphone-13-1-/1366_2000.jpg',
        isFavorite: false),
    Product(
        id: 'p4',
        title: 'Playstation 5',
        description: 'Ps5 de 500 gigas de Memoria',
        price: 999.99,
        imageUrl:
            'https://jumboargentina.vtexassets.com/arquivos/ids/604345/Consola-Playstation-5-Ps5-Hw-Standard-2-853923.jpg?v=637369032320830000',
        isFavorite: false),
  ];

  var _showFavoriteOnly = false;

//aca devuelve una copia de los product
  List<Product> get items {
    // if (_showFavoriteOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoriteOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoriteOnly = false;
  //   notifyListeners();
  // }

  //Metodo para agregar items
  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
