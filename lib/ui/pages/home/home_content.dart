
import 'package:flutter/material.dart';
import 'package:flutter_favorcate/core/extension/int_extension.dart';
import 'package:flutter_favorcate/core/model/category_model.dart';
import 'package:flutter_favorcate/core/services/json_parse.dart';
import 'package:flutter_favorcate/ui/pages/home/home_category_item.dart';

/**
 * 页面需要请求接口数据或读取json处理（json也是异步的）
 * 1、继承StatefullWidget，在initsate里面请求数据赋值属性刷新界面
 * 2、通过FutureBuilder构件页面，snapshot获取数据
 * */
class HYHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //异步请求处理FutureBuilder
    return FutureBuilder<List<HYCategoryModel>>(
      future: HYJsonParse.getCategoryData(),
      builder: (ctx, snapshot) {
        //请求中菊花页面
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
        //请求失败页面
        if (snapshot.error != null) return Center(child: Text("请求失败"),);
        final categories = snapshot.data as List<HYCategoryModel>;
        //瀑布流栅格组件
        return GridView.builder(
            padding: EdgeInsets.all(20.px),
            itemCount: categories.length,
            //栅格样式布局
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.px,
                mainAxisSpacing: 20.px,
                childAspectRatio: 1.5
            ),
            itemBuilder: (ctx, index) {
              return HYHomeCategoryItem(categories[index]);
            }
        );
      },
    );
  }
}
