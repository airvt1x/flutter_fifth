import 'package:flutter/material.dart';
import 'package:project_name/components/item.dart';
import 'package:project_name/models/item_class.dart';
import 'package:project_name/pages/add_item_page.dart';
import 'package:project_name/pages/favorites_page.dart';
import 'package:project_name/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ItemClass> items = [
    ItemClass(
    1,
    'https://img.razrisyika.ru/kart/127/507521-sotovyy-telefon-6.jpg',
    5990,
    'Apple Nokia Samsung',
    'Сразу несколько, представь.',
    'Продается сразу несколько новеньких телефонов только вместе.',
  ),
  ItemClass(
    2,
    'https://burobiz-a.akamaihd.net/uploads/images/104287/large_remont-i-prodazha-bu-mobilnyx-telefonov-xoroshee-nachalo-dlya-perspektivnogo-biznesa-www-ural-org.jpg',
    6690,
    'Nokia',
    'Неворованный синий нокиа с фото',
    'Отличный телефон, держит заряд месяц',
  ),
  ItemClass(
    3,
    'https://cdn1.ozone.ru/s3/multimedia-b/6014927879.jpg',
    7990,
    'Texet',
    'Неубиваемый телефон, пережил ядерную войну',
    'Этим телефоном люди впервые научились добывать огонь, охотиться на мамонтов, это он нагрузил Грузию, затонировал черное море, а мертвое убил, успокоил тихий океан и покрасил красную площадь',
  ),
  ];

  List<ItemClass> favorites = [];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      Scaffold(
        appBar: AppBar(
          title: const Text('Магазин товаров'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            return Item(
              imgLink: item.imgLink,
              price: item.price,
              brand: item.brand,
              title: item.title,
              description: item.description,
              isFavorite: favorites.contains(item),
              onFavoriteToggle: () {
                setState(() {
                  if (favorites.contains(item)) {
                    favorites.remove(item);
                  } else {
                    favorites.add(item);
                  }
                });
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddItemPage(onItemAdded: (newItem) {
                  setState(() {
                    items.add(newItem);
                  });
                }),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
      Scaffold(
        appBar: AppBar(
          title: const Text('Избранное'),
        ),
        body: FavoritesPage(favorites: favorites),
      ),
      Scaffold(
        appBar: AppBar(
          title: const Text('Мой профиль'),
        ),
        body: const ProfilePage(),
      ),
    ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Товары',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
