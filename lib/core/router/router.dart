
import 'package:flutter/material.dart';
import 'package:flutter_favorcate/ui/pages/detail/detail.dart';
import 'package:flutter_favorcate/ui/pages/filter/filter.dart';
import 'package:flutter_favorcate/ui/pages/main/main.dart';
import 'package:flutter_favorcate/ui/pages/meal/meal.dart';

class HYRouter {
  static final String initialRoute = HYMainScreen.routerName;

  static final Map<String, WidgetBuilder> routes = {
    HYMainScreen.routerName: (ctx) => HYMainScreen(),
    HYMealScreen.routeName: (ctx) => HYMealScreen(),
    HYDetailScreen.routeName: (ctx) => HYDetailScreen(),
  };

  // 自己扩展
  static final RouteFactory generateRoute = (settings) {
    if (settings.name == HYFilterScreen.routeName) {
      return MaterialPageRoute(
          builder: (ctx) {
            return HYFilterScreen();
          },
          fullscreenDialog: true
      );
    }

    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}