// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_myshop/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetalsScreen extends StatelessWidget {
  static const routeName = '/productDetalsScreen';

  const ProductDetalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    //Se obtiene datos de los product
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
        backgroundColor: Colors.black54,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width:double.infinity,
              height: 300,
              child: Image.network(loadedProduct.imageUrl, fit: BoxFit.cover,),
              
            ),
            const SizedBox(height: 15,),

            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text('\$${loadedProduct.price}', style: const TextStyle(fontSize: 25, color: Colors.grey),
              ),
            ),
            SizedBox(height: 15,),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                
                loadedProduct.description, style: TextStyle(fontSize: 25, color: Colors.black54,),
                textAlign: TextAlign.center,
                softWrap: true,
                ),
            )
          ],
        ),
      ) ,
    );
  }
}
