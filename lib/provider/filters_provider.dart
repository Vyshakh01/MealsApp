import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/meals_provider.dart';

enum filter { isGlutenFree, isLactoseFree, isVegan, isVegetarian }

class FilterNotifier extends StateNotifier<Map<filter, bool>> {
  FilterNotifier()
      : super({
          filter.isGlutenFree: false,
          filter.isLactoseFree: false,
          filter.isVegan: false,
          filter.isVegetarian: false,
        });

  void setFilters(Map<filter, bool> chosenFIlters) {
    state = chosenFIlters;
  }

  void setFilter(filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersprovider =
    StateNotifierProvider<FilterNotifier, Map<filter, bool>>(
        (ref) => FilterNotifier());

final filteredMealsProvider = Provider((ref) {
  final activefilters = ref.watch(filtersprovider);

  final meals = ref.watch(mealsprovider);

  return meals.where((meal) {
    if (activefilters[filter.isGlutenFree]! && !meal.isGlutenFree) {
      return false;
    }

    if (activefilters[filter.isLactoseFree]! && !meal.isLactoseFree) {
      return false;
    }

    if (activefilters[filter.isVegan]! && !meal.isVegan) {
      return false;
    }

    if (activefilters[filter.isVegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
