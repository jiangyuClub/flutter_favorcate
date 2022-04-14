import 'package:flutter_favorcate/core/viewmodel/filter_view_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_favorcate/core/extension/int_extension.dart';
import 'package:flutter_favorcate/ui/shared/app_theme.dart';
import 'package:provider/provider.dart';

class HYFilterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildChoiceTitle(context),
        buildChoiceSelect()
      ],
    );
  }

  Widget buildChoiceTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      child: Text("展示你的选择", style: TextStyle(fontSize: HYAppTheme.largeFontSize, color: Colors.black87),),
    );
  }

  Widget buildChoiceSelect() {
    return Expanded(
      child: Consumer<HYFilterViewModel>(
        builder: (ctx, filterVM, child) {
          return ListView(
            children: <Widget>[
              buildListTile("无谷蛋白", "无谷蛋白", filterVM.isGlutenFree, (value) {
                filterVM.isGlutenFree = value;
              }),
              buildListTile("不含乳糖", "不含乳糖", filterVM.isLactoseFree, (value) {
                filterVM.isLactoseFree = value;
              }),
              buildListTile("素食主义", "素食主义", filterVM.isVegetarian, (value) {
                filterVM.isVegetarian = value;
              }),
              buildListTile("严格素食主义", "严格素食主义", filterVM.isVegan, (value) {
                filterVM.isVegan = value;
              }),
            ],
          );
        },
      ),
    );
  }

  Widget buildListTile(String title, String subtitle, bool value, void Function(bool) onChange) {
    return ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Switch(value: value, onChanged: onChange)
    );
  }
}
