import 'package:flutter/material.dart';
import 'package:mealsapp/Widgets/main_drawer.dart';
import 'package:mealsapp/screens/categories_screen.dart';
import 'package:mealsapp/screens/favorite_screen.dart';

import '../model/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
 

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  void initState() {
    _pages =  [
    {'page': const CategoreisScreen(), 'title': 'Categories'},
    {'page':  FavoriteScreen(widget.favoriteMeals), 'title': "Your Favorite"}
  ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorite")
          ]),
    );
  }
}
