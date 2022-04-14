import 'package:flutter/material.dart';
import 'package:flutter_favorcate/core/router/router.dart';
import 'package:flutter_favorcate/core/viewmodel/favor_view_model.dart';
import 'package:flutter_favorcate/core/viewmodel/filter_view_model.dart';
import 'package:flutter_favorcate/core/viewmodel/meal_view_model.dart';
import 'package:flutter_favorcate/ui/shared/app_theme.dart';
import 'package:flutter_favorcate/ui/shared/size_fit.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => HYFilterViewModel()),
      //处理两个VM的依赖关系
      ChangeNotifierProxyProvider<HYFilterViewModel, HYMealViewModel>(
        create: (ctx) => HYMealViewModel(),
        update: (ctx, filterVM, mealVM) {
          mealVM?.updateFilters(filterVM);
          return mealVM!;
        },
      ),
      ChangeNotifierProxyProvider<HYFilterViewModel, HYFavorViewModel>(
        create: (ctx) => HYFavorViewModel(),
        update: (ctx, filterVM, favorVM) {
          favorVM?.updateFilters(filterVM);
          return favorVM!;
        },
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: HYAppTheme.norTheme,
      initialRoute: HYRouter.initialRoute,
      routes: HYRouter.routes,
      onGenerateRoute: HYRouter.generateRoute,
      onUnknownRoute: HYRouter.unknownRoute,
    );
  }
}

