import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite =
        state.contains(meal); //yemek favoriler listesinde var mı?

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList(); // varsa çıkartık
      return false;
    } else {
      state = [...state, meal]; // yoksa ekler
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
  (ref) => FavoriteMealsNotifier(),
);
