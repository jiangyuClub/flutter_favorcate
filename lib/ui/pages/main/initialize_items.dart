import 'package:flutter/material.dart';
import 'package:flutter_favorcate/ui/pages/favor/favor.dart';
import 'package:flutter_favorcate/ui/pages/home/home.dart';

final List<Widget> pages = [
  HYHomeScreen(),
  HYFavorScreen()
];

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
      label: "首页",
      icon: Icon(Icons.home)
  ),
  BottomNavigationBarItem(
      label: "收藏",
      icon: Icon(Icons.star)
  ),
];
