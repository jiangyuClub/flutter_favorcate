
import 'package:flutter/material.dart';
import 'package:flutter_favorcate/ui/pages/home/home_app_bar.dart';
import 'package:flutter_favorcate/ui/pages/home/home_content.dart';

class HYHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HYHomeAppBar(context),
      body: HYHomeContent(),
    );
  }
}
