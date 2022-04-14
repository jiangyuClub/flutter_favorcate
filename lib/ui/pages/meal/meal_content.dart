import 'package:flutter/material.dart';
import 'package:flutter_favorcate/core/model/category_model.dart';
import 'package:flutter_favorcate/core/model/meal_model.dart';
import 'package:flutter_favorcate/core/viewmodel/meal_view_model.dart';
import 'package:flutter_favorcate/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

/**
 * meals中显示某个分类的list，数据需要从HYMealViewModel的meals中根据categories的id过滤，过滤方案有两种
 * 1、使用Consumer获取共享数据meals后通过where高阶函数过滤
 * 2、使用Selecter带有的过滤功能
 * */
class HYMealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as HYCategoryModel;

    //通过Consumer获取共享HYMealViewModel
    return Selector<HYMealViewModel, List<HYMealModel>>(
        //过滤
        selector: (ctx, mealVM) {
          return mealVM.meals.where((meal) {
            return meal.categories.contains(category.id);
          }).toList();
          },
        //是否刷新
        shouldRebuild: (prev, next) => !ListEquality().equals(prev, next),
        builder: (ctx, meals, child) {
          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) {
              return HYMealItem(meals[index]);
              },);
        });
  }
}

/**
 * 通过Consumer获取共享数据
 * */
class ConsumerTest extends StatelessWidget {
  const ConsumerTest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)?.settings.arguments as HYCategoryModel;

    return Consumer<HYMealViewModel>(builder: (ctx, mealVM, child) {
      print("testjiang==${mealVM.meals.length}");
      final meals = mealVM.meals
          .where((meal) => meal.categories.contains(category.id))
          .toList();
      return Text("jjj==${meals.length}");
    });
  }
}
