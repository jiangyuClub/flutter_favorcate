
import 'package:flutter/material.dart';
import 'package:flutter_favorcate/core/model/meal_model.dart';
import 'package:flutter_favorcate/core/viewmodel/filter_view_model.dart';

class BaseMealViewModel extends ChangeNotifier {

  List<HYMealModel> _meals = [];

  late HYFilterViewModel _filterVM;

  void updateFilters(HYFilterViewModel filterVM) {
    _filterVM = filterVM;
  }

  List<HYMealModel> get meals {
    return _meals.where((meal) {
      if (_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if (_filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  set meals(List<HYMealModel> value) {
    _meals = value;
    notifyListeners();
  }

  List<HYMealModel> get originMeals {
    return _meals;
  }
}