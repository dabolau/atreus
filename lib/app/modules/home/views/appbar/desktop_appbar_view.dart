import 'package:atreus/app/common/constant.dart';
import 'package:atreus/app/common/urls.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

// 电脑导航栏
AppBar DesktopAppBarView(SizingInformation sizingInformation) {
  return AppBar(
    elevation: 0,
    centerTitle: false,
    // 菜单
    leading: IconButton(
      onPressed: () {
        print(sizingInformation.deviceScreenType);
      },
      icon: Icon(Icons.menu),
    ),
    // 标题
    title: Text('Atreus'),
    // 图标
    actions: [
      // 跳转到电报
      IconButton(
        onPressed: () {
          openUrl(uri: telegramGroupAddress);
        },
        icon: Icon(
          Icons.telegram,
          color: Colors.blue,
        ),
      ),
      SizedBox(
        width: 10,
      ),
    ],
  );
}
