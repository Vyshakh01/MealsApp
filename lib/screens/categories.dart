import 'package:flutter/material.dart';
import 'package:meals/data/dummydata.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/categoryitem.dart';
import 'package:meals/models/categorymodel.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availablemeals});

  final List<Meal> availablemeals;

  void onselectcategory(BuildContext context, Category category) {
    final filteredMeals = availablemeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => Mealscreen(
          meals: filteredMeals,
          title: category.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.5),
        children: [
          for (final categry in availableCategories)
            Categoryitem(
              category: categry,
              onSelectCategory: () {
                onselectcategory(context, categry);
              },
            )
        ]);
  }
}
