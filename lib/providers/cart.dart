import 'package:flutter/material.dart';

class CartItem  {
  final String id;
  final String title;
  final int quantity;
  final double price;
  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  late  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return items.length;
  }

  //Logica de carrito de compras
  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void addItems(String producId, double price, String title) {
    if (_items.containsKey(producId)) {
      _items.update(
          producId,
          (existingCartItem) =>CartItem  (
              id: existingCartItem.id,
              price: existingCartItem.price,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1));
    } else {
      _items.putIfAbsent(
        producId,
        () =>  CartItem(id: producId, title: title, price: price, quantity:  1),
      );
    }
    notifyListeners();
  }

  //Metodo para eliminar articulo

  void removeItem(String producId){
    _items.remove(producId);
    notifyListeners();
  }

  //Metodo para vacias carrito

  void clear() {
    _items = {};
    notifyListeners();


  }
}

