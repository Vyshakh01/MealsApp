import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/provider/favoritemealsprovider.dart';

class MealdetailsScreen extends ConsumerWidget {
  const MealdetailsScreen({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favmeals = ref.watch(favoritemealsprovider);
    final isfavourite = favmeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final favoritestaus = ref
                    .read(favoritemealsprovider.notifier)
                    .togglefavouritestatus(meal);

                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(favoritestaus
                        ? "Meal removed from favorites"
                        : "Meal added to favorites")));
              },
              icon: Icon(isfavourite ? Icons.star : Icons.star_border))
        ],
        title: Text(meal.title),
      ),
      body: Column(
        children: [
          Image.network(
            meal.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "INGREDIANTS :",
            style: TextStyle(
                color: Colors.orange,
                fontSize: 22,
                //fontWeight: FontWeight.bold,
                fontFamily: AutofillHints.creditCardExpirationMonth),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: meal.ingredients.length,
              itemBuilder: (context, index) => Text(
                "*  ${meal.ingredients[index]}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Text(
            "Steps:",
            style: TextStyle(
                color: Colors.orange,
                fontSize: 22,
                //fontWeight: FontWeight.bold,
                fontFamily: AutofillHints.creditCardExpirationMonth),
          ),
          const SizedBox(
            height: 2,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: meal.steps.length,
              itemBuilder: (context, index) => Expanded(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${index + 1}.",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: Text(
                        " ${meal.steps[index]}",
                        style: const TextStyle(color: Colors.white),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
