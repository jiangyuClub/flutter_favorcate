import "package:flutter/material.dart";
import 'package:flutter_favorcate/ui/pages/home/home_drawer.dart';
import 'package:flutter_favorcate/ui/pages/main/initialize_items.dart';

class HYMainScreen extends StatefulWidget {
  static const String routerName = "/";

  @override
  _HYMainScreenState createState() => _HYMainScreenState();
}

class _HYMainScreenState extends State<HYMainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HYHomeDrawer(),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
