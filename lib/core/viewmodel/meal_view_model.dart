
import 'package:flutter_favorcate/core/model/meal_model.dart';
import 'package:flutter_favorcate/core/services/json_parse.dart';
import 'package:flutter_favorcate/core/viewmodel/base_view_model.dart';

class HYMealViewModel extends BaseMealViewModel {
  HYMealViewModel() {
    HYJsonParse.getMealData().then((value) {
      meals = value;
    });
  }
}