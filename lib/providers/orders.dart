// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../providers/cart.dart';

class OrdenItem {
  final String id;
  final double amount;
  final List <CartItem> products;
  final DateTime dateTime;
  OrdenItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });

}

class Orders with ChangeNotifier{
  List<OrdenItem> _orders = [];


List <OrdenItem> get orders{
  return [...orders];
}

//Metodo para añadir el pedido
void addOrder(List<CartItem> cartProducts, double total){
  _orders.insert(0,OrdenItem(id: DateTime.now().toString(), amount: total, products: cartProducts, dateTime: DateTime.now(),
  )
  );
  notifyListeners();
  
}



}