import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/mealdetails.dart';
import 'package:meals/widgets/mealitem.dart';

class Mealscreen extends StatelessWidget {
  const Mealscreen({super.key, required this.meals, this.title});

  final String? title;
  final List<Meal> meals;

  void onselectmeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealdetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Oops...nothing to display here!",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Try some other options",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: ((ctx, index) => Mealitem(
                meal: meals[index],
                onSelectMeal: () {
                  onselectmeal(context, meals[index]);
                },
              )));
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
