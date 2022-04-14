
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_favorcate/core/model/category_model.dart';
import 'package:flutter_favorcate/core/model/meal_model.dart';


/**
 * 本地json存储app所有数据，包含两部分
 * 1、首页的分类数据，存储在category.json
 * 2、所有的meal数据，存储在meal.json中
 * 点击某个分类是通过HYCategoryModel的id匹配meal.json中categories对应id的meals
 * */
class HYJsonParse {
  //获取首页分类数据
  static Future<List<HYCategoryModel>> getCategoryData() async {
    // 1.加载json文件
    final jsonString = await rootBundle.loadString("assets/json/category.json");

    // 2.将jsonString转成Map/List
    final result =  json.decode(jsonString);

    // 3.将Map中的内容转成一个个对象
    final resultList = result["category"];
    List<HYCategoryModel> categories = [];
    for (var json in resultList) {
      categories.add(HYCategoryModel.fromJson(json));
    }
    return categories;
  }


  //获取全部meal
  static Future<List<HYMealModel>> getMealData() async {
    // 1.加载json文件
    final jsonString = await rootBundle.loadString("assets/json/meal.json");

    // 2.将jsonString转成Map/List
    final result =  json.decode(jsonString);

    // 3.将Map中的内容转成一个个对象
    final resultList = result["meal"];
    List<HYMealModel> meals = [];
    for (var json in resultList) {
      meals.add(HYMealModel.fromJson(json));
    }
    return meals;
  }
}