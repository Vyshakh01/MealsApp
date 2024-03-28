import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/fliterscreen.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/mainDrawer.dart';
import 'package:meals/provider/favoritemealsprovider.dart';
import 'package:meals/provider/filters_provider.dart';

Map<filter, bool> kselectedfilters = {
  filter.isGlutenFree: false,
  filter.isLactoseFree: false,
  filter.isVegan: false,
  filter.isVegetarian: false
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int selectedPageIndex = 0;

  final List<Meal> favouritemeals = [];
  List<Meal> availablemeals = [];

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void onSelectscreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "Filters") {
      await Navigator.of(context).push<Map<filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    availablemeals = ref.watch(filteredMealsProvider);

    Widget activepage = CategoriesScreen(
      availablemeals: availablemeals,
    );
    var activepagetext = "Categories";

    if (selectedPageIndex == 1) {
      final favmeals = ref.watch(favoritemealsprovider);
      activepage = Mealscreen(
        meals: favmeals,
      );
      activepagetext = "Favourites";
    }
    return Scaffold(
      drawer: MainDrawer(onSelectScreen: onSelectscreen),
      appBar: AppBar(
        title: Text(activepagetext),
      ),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          currentIndex: selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: "Favourites"),
          ]),
    );
  }
}
