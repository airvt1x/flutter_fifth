import 'package:flutter/material.dart';
import 'package:project_name/pages/product_page.dart';

class Item extends StatelessWidget {
  final String imgLink;
  final int price;
  final String brand;
  final String title;
  final String description;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const Item({
    super.key,
    required this.imgLink,
    required this.price,
    required this.brand,
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(imgLink),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: onFavoriteToggle,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '$price ₽',
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              brand,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(
                      imgLink: imgLink,
                      price: price,
                      brand: brand,
                      title: title,
                      description: description,
                    ),
                  ),
                );
              },
              child: const Text(
                'Узнать больше',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
