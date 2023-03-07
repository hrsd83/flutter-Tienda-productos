import 'package:flutter/material.dart';
import 'package:flutter_myshop/providers/orders.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart'show Cart ;
import '../widgets/cart_item.dart'; 
class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
        backgroundColor: Colors.black54,
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Total',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato'),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount}',
                    ),
                    backgroundColor: Colors.red[300],
                  ),
                  ElevatedButton(onPressed: () {
                    Provider.of<Orders>(context, listen: false).addOrder(cart.items.values.toList(), cart.totalAmount);
                    cart.clear();
                  }, child: const Text('Ordenar'))
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Expanded (
            child:  ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i)=>CartItem(id:cart.items.values.toList()[i].id , title: cart.items.values.toList() [i].title, quantity: cart.items.values.toList()[i].quantity, price: cart.items.values.toList()[i].price, producId: cart.items.keys.toList()[i],)))
        ],
      ),
    );
  }
}
