import 'package:flutter/material.dart';
import 'package:flutter_myshop/screens/product_detals_screen.dart';
import 'package:flutter_myshop/screens/products_screen.dart';
import './providers/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(ctx) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme:
            ThemeData(fontFamily: 'Lato', accentColor: Colors.deepOrangeAccent),
        home: ProductsScreen(),
    
        routes: {
          ProductDetalsScreen.routeName: (ctx) => ProductDetalsScreen()
        },
      ),
    );
  }
}
