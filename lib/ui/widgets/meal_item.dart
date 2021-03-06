import 'package:flutter/material.dart';
import 'package:flutter_favorcate/core/model/meal_model.dart';
import 'package:flutter_favorcate/core/extension/int_extension.dart';
import 'package:flutter_favorcate/core/viewmodel/favor_view_model.dart';
import 'package:flutter_favorcate/ui/pages/detail/detail.dart';
import 'package:flutter_favorcate/ui/shared/app_theme.dart';
import 'package:flutter_favorcate/ui/widgets/operation_item.dart';
import 'package:provider/provider.dart';


final cardRadius = 12.px;

class HYMealItem extends StatelessWidget {
  final HYMealModel _meal;
  HYMealItem(this._meal);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        //阴影
        elevation: 5,
        //圆角
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardRadius)),
        child: Column(
          children: [
            buildBasicInfo(context),
            buildOperationInfo(),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(HYDetailScreen.routeName, arguments: _meal);
      },
    );
  }

  //上部图片
  Widget buildBasicInfo(BuildContext context) {
    return Stack(

      children: [
        //图片裁剪使用ClipRRect
        ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(cardRadius),
                topRight: Radius.circular(cardRadius)),
            //图片宽度撑满card，高度固定250px
            child: Image.network(
              _meal.imageUrl,
              width: double.infinity,
              height: 250.px,
              fit: BoxFit.cover,
            )),
        //一句话信息，Positioned包裹设置绝对定位
        Positioned(
          right: 10.px,
          bottom: 10.px,
          child: Container(
            width: 300.px,
            padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
            //设置Container圆角样式
            decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(6.px)),
            child: Text(_meal.title, style: TextStyle(fontSize: HYAppTheme.largeFontSize, color: Colors.white),),
          ),
        )
      ],
    );
  }

  //下部信息
  Widget buildOperationInfo() {
    return Row(
      //主轴展开
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        HYOperationItem(Icon(Icons.schedule), "${_meal.duration}分钟"),
        HYOperationItem(Icon(Icons.restaurant), "${_meal.complexStr}"),
        buildFavorItem()
      ],
    );
  }

  Widget buildFavorItem() {
    return Consumer<HYFavorViewModel>(
      builder: (ctx, favorVM, child) {
        // 1.判断是否收藏状态
        final iconData = favorVM.isFavor(_meal) ? Icons.favorite: Icons.favorite_border;
        final favorColor = favorVM.isFavor(_meal) ? Colors.red: Colors.black;
        final title = favorVM.isFavor(_meal)? "收藏": "未收藏";
        return GestureDetector(
          child: HYOperationItem(
              Icon(iconData, color: favorColor,),
              title,
              textColor: favorColor
          ),
          onTap: () {
            favorVM.handleMeal(_meal);
          },
        );
      },
    );
  }

}
