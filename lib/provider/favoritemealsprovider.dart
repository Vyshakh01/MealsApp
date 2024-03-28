import 'package:meals/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritemealsNotifier extends StateNotifier<List<Meal>> {
  FavoritemealsNotifier() : super([]);

  bool togglefavouritestatus(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((element) => element.id != meal.id).toList();
      return true;
    } else {
      state = [...state, meal];
      return false;
    }
  }
}

final favoritemealsprovider =
    StateNotifierProvider<FavoritemealsNotifier, List<Meal>>(
        (ref) => FavoritemealsNotifier());
