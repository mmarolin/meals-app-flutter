import 'package:flutter/material.dart';

import '../dummy_data.dart';
import './category_meals_screen.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isMealFavorite;

  MealDetailScreen(this.toggleFavorite, this.isMealFavorite);

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, top: 20),
      child: Text(title, style: Theme.of(context).textTheme.headline6),
    );
  }

  Widget buildSectionContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      height: 200,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(child: Text('${selectedMeal.title}')),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(selectedMeal.imageUrl))),
              ),
            ),
            buildSectionTitle(context, 'INGREDIENTS'),
            buildSectionContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 10, top: 10, bottom: 10),
                    child: Text(selectedMeal.ingredients[index].toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                        )),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'STEPS'),
            buildSectionContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 16,
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontFamily: 'RobotoCondensed'),
                        ),
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5),
                        foregroundColor: Colors.black,
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: TextStyle(
                            fontFamily: 'Raleway', fontWeight: FontWeight.w700),
                      ),
                    ),
                    Divider(
                        color: Colors.pink.withOpacity(0.5),
                        indent: 20,
                        endIndent: 20),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          isMealFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
