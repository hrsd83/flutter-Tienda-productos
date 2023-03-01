import 'package:flutter/material.dart';
import 'package:flutter_myshop/providers/cart.dart';
import 'package:flutter_myshop/screens/cart.screen.dart';
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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => Products()),
          ChangeNotifierProvider(
            create: (ctx) => Cart(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tienda de Artículos',
          theme: ThemeData(
              fontFamily: 'Lato',
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: Color.fromARGB(255, 7, 69, 205))),
          home: const ProductsScreen(),
          routes: {
            ProductDetalsScreen.routeName: (ctx) => ProductDetalsScreen(),
            CartScreen.routeName: (ctx) => const CartScreen(),

          },
        ));
  }
}
