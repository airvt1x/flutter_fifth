import 'package:flutter/material.dart';
import 'package:project_name/models/item_class.dart';
import 'package:project_name/components/item.dart';

class FavoritesPage extends StatelessWidget {
  final List<ItemClass> favorites;

  const FavoritesPage({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final item = favorites[index];
          return Item(
            imgLink: item.imgLink,
            price: item.price,
            brand: item.brand,
            title: item.title,
            description: item.description,
            isFavorite: true,
            onFavoriteToggle: () {},
          );
        },
      ),
    );
  }
}
