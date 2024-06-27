import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  final List<String> favoriteItems;

  FavoritePage({required this.favoriteItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite product'),
        backgroundColor: Color(0xFF475269),
      ),
      body: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteItems[index]),
          );
        },
      ),
    );
  }
}
