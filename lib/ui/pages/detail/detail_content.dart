
import 'package:flutter/material.dart';
import 'package:flutter_favorcate/core/model/meal_model.dart';
import 'package:flutter_favorcate/ui/shared/app_theme.dart';
import 'package:flutter_favorcate/core/extension/int_extension.dart';

class HYDetailContent extends StatelessWidget {
  final HYMealModel _meal;
  HYDetailContent(this._meal);

  /**
   * 滚动试图，常见实现方案有两种
   * 1、listview
   * 2、SingleChildScrollView+Column
   * 难点：外部的滚动试图和制作材料的listview存在布局冲突，通过shrinkWrap+physics解决
   * */
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBannerImage(),
          buildMakeTitle(context, "制作材料"),
          buildMakeMaterial(context),
          buildMakeTitle(context, "制作步骤"),
          buildMakeSteps(context),
          SizedBox(height: 30.px,)
        ],
      ),
    );
  }

  // 1.横幅图片
  Widget buildBannerImage() {
    return Container(
        width: double.infinity,
        child: Image.network(_meal.imageUrl)
    );
  }

  // 标题
  Widget buildMakeTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.px),
      child: Text(title, style: TextStyle(fontSize: HYAppTheme.largeFontSize, color: Colors.black87, fontWeight: FontWeight.bold),),
    );
  }

  // 2.制作材料，滚动冲突报错解释详见课程20讲
  Widget buildMakeMaterial(BuildContext context) {
    return buildMakeContent(
      context: context,
      child: ListView.builder(
          //解决滚动冲突
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: _meal.ingredients.length,
          itemBuilder: (ctx, index) {
            return Card(
              color: Colors.amber,
              child: Text(_meal.ingredients[index]),
            );
          })
    );
  }

  // 3.制作步骤
  Widget buildMakeSteps(BuildContext context) {
    return buildMakeContent(
        context: context,
        //带分割线的listview
        child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text("#${index+1}"),
                ),
                title: Text(_meal.steps[index]),
              );
            },
            separatorBuilder: (ctx, index) {
              return Divider();
            },
            itemCount: _meal.steps.length
        )
    );
  }

  //公共方法：制作材料和制作步骤的边框
  Widget buildMakeContent({required BuildContext context, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.px)
      ),
      width: MediaQuery.of(context).size.width - 30.px,
      child: child,
    );
  }

}
