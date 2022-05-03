import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        child: Center(
            child: Text(title, style: Theme.of(context).textTheme.headline6)),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.9),
              color.withOpacity(0.6),
              color.withOpacity(0.4),
              color.withOpacity(0.6),
              color.withOpacity(0.9),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          border: Border.all(color: Colors.grey, width: 1),
          // boxShadow: const [
          //   BoxShadow(
          //       color: Colors.white,
          //       blurRadius: 10,
          //       spreadRadius: 0,
          //       offset: Offset(0, 10))
          // ],
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
