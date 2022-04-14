import 'package:flutter_favorcate/core/model/category_model.dart';

//import 'package:flutter_favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_favorcate/core/extension/int_extension.dart';
import 'package:flutter_favorcate/ui/pages/meal/meal.dart';
import 'package:flutter_favorcate/ui/shared/app_theme.dart';

class HYHomeCategoryItem extends StatelessWidget {
  final HYCategoryModel category;

  HYHomeCategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    final bgColor = category.cColor!;

    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: bgColor,
            //圆角
            borderRadius: BorderRadius.circular(12.px),
            //渐变色
            gradient: LinearGradient(colors: [bgColor.withOpacity(0.5), bgColor])
        ),
        child: Text(
          category.title!,
          style: TextStyle(
              fontSize: HYAppTheme.normalFontSize,
              color: Colors.black87,
              fontWeight: FontWeight.bold),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(HYMealScreen.routeName, arguments: category);
      },
    );
  }
}
