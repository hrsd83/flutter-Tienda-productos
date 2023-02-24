import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

enum FilterOptions { Favorites, All }

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tienda de Productos'),
        backgroundColor: Colors.black54,
        // elevation: 5,
        centerTitle: true,
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: const Icon(Icons.more_vert_outlined),
              itemBuilder: (_) => const [
                    PopupMenuItem(
                      value: FilterOptions.Favorites,
                      child: Text(
                        'Mis Favoritos',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    PopupMenuItem(
                      value: FilterOptions.All,
                      child: Text(
                        'Mostrar Todo',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ])
        ],
      ),
      body: ProductsGridView(
        _showOnlyFavorites,
        showFavs: _showOnlyFavorites,
      ),
    );
  }
}
