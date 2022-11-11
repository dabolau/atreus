import 'package:atreus/app/common/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    OKToast(
      child: GetMaterialApp(
        // 关闭调试模式
        debugShowCheckedModeBanner: false,
        title: "Atreus",
        theme: Themes.light,
        // builder: BotToastInit(), // 初始化提示信息
        // navigatorObservers: [BotToastNavigatorObserver()], // 注册提示信息
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
}
