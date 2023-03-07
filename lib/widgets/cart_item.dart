import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String producId;
  final double price;
  final int quantity;
  final String title;
  const CartItem({Key? key, 
    required this.id,
    required this.price,
    required this.quantity,
    required this.title, required this.producId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context ) {
    return
    Dismissible(
      key:ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: const Icon(Icons.delete, color: Colors.white,size: 35,),
      

      ),
      direction: DismissDirection.endToStart,
      
      onDismissed: (direction){
        
        Provider.of<Cart>(context, listen: false).removeItem(producId);
        
      },
      
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: ListTile(
          title: Text(title),
          trailing: Text('$quantity* X'),
          subtitle: Text('Total:\$${price * quantity}'),
          leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                  child: Text(
                          '\$$price',
                        ),
                ),
              )),
        ),
      ),
    );
  }
}
