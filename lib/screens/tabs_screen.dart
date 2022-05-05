import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './categories_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Favorites'},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Theme.of(context).canvasColor,
            elevation: 0.0,
            currentIndex: _selectedPageIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined, size: 30),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star_border_outlined, size: 30),
                label: 'Favorites',
              )
            ]),
      ),
    );
  }
}
