import 'package:flutter/material.dart';
import 'package:meals_app/categories.dart';
import 'package:meals_app/category_meals_screen.dart';
import './categories.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
      ),
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
      },
    );
  }
}
