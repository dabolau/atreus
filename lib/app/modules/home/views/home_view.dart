import 'package:atreus/app/modules/home/views/appbar/desktop_appbar_view.dart';
import 'package:atreus/app/modules/home/views/body/desktop_body_view.dart';
import 'package:atreus/app/modules/home/views/appbar/mobile_appbar_view.dart';
import 'package:atreus/app/modules/home/views/body/mobile_body_view.dart';
import 'package:atreus/app/modules/home/views/appbar/tablet_appbar_view.dart';
import 'package:atreus/app/modules/home/views/body/tablet_body_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // 电脑界面
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return Scaffold(
            // 电脑导航界面
            // appBar: DesktopAppBarView(sizingInformation),
            // 电脑界面
            body: GetBuilder<HomeController>(
              init: HomeController(),
              builder: ((controller) {
                return DesktopBodyView(context, controller);
              }),
            ),
          );
        }
        // 平板界面
        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return Scaffold(
            // 平板导航界面
            // appBar: TabletAppBarView(sizingInformation),
            // 平板界面
            body: GetBuilder<HomeController>(
              init: HomeController(),
              builder: ((controller) {
                return TabletBodyView(context, controller);
              }),
            ),
          );
        }
        // 手机界面
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return Scaffold(
            // 手机导航界面
            // appBar: MobileAppBarView(sizingInformation),
            // 手机界面
            body: GetBuilder<HomeController>(
              init: HomeController(),
              builder: ((controller) {
                return MobileBodyView(context, controller);
              }),
            ),
          );
        }
        // 其它界面
        return Scaffold(
          body: Container(
            child: Center(
              child: Text('网站建设中'),
            ),
          ),
        );
      },
    );
  }
}
