import 'package:atreus/app/common/constant.dart';
import 'package:atreus/app/common/urls.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
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
            // appBar: DesktopAppBar(sizingInformation),
            body: GetBuilder<HomeController>(
              init: HomeController(),
              builder: ((controller) {
                return DesktopBody(context, controller);
              }),
            ),
          );
        }
        // 平板界面
        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return Scaffold(
            // appBar: DesktopAppBar(sizingInformation),
            body: GetBuilder<HomeController>(
              init: HomeController(),
              builder: ((controller) {
                return DesktopBody(context, controller);
              }),
            ),
          );
        }
        // 手机界面
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return Scaffold(
            // appBar: MobileAppBar(sizingInformation),
            body: GetBuilder<HomeController>(
              init: HomeController(),
              builder: ((controller) {
                return MobileBody(context, controller);
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

  // 电脑导航栏
  AppBar DesktopAppBar(SizingInformation sizingInformation) {
    return AppBar(
      elevation: 0,
      // backgroundColor: Colors.transparent,
      centerTitle: false,
      // leading: Icon(Icons.menu),
      leading: IconButton(
        onPressed: () {
          print(sizingInformation.deviceScreenType);
        },
        icon: Icon(Icons.menu),
      ),
      title: Text('Atreus'),
      actions: [
        // 跳转到电报
        IconButton(
          onPressed: () {
            openUrl(uri: telegramGroupAddress);
          },
          // hoverColor: Colors.white,
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

  // 手机导航栏
  AppBar MobileAppBar(SizingInformation sizingInformation) {
    return AppBar(
      elevation: 0,
      // backgroundColor: Colors.transparent,
      centerTitle: false,
      // leading: Icon(Icons.menu),
      leading: IconButton(
        onPressed: () {
          print(sizingInformation.deviceScreenType);
        },
        icon: Icon(Icons.menu),
      ),
      title: Text('Atreus'),
      actions: [
        // 跳转到电报
        IconButton(
          onPressed: () {
            openUrl(uri: telegramGroupAddress);
          },
          // hoverColor: Colors.white,
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

  // 电脑界面
  Container DesktopBody(BuildContext context, HomeController controller) {
    return Container(
      child: Stack(
        children: [
          // 图片背景
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.network(
                controller.backgroundImage.value,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 背景蒙版
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Opacity(
              opacity: 0.3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black,
              ),
            ),
          ),
          // 导航栏
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Opacity(
              opacity: 0.7,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 56,
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    // 菜单图标
                    IconButton(
                      onPressed: () {
                        // print(sizingInformation.deviceScreenType);
                      },
                      icon: Icon(Icons.menu),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Atreus',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    // 跳转到电报
                    IconButton(
                      onPressed: () {
                        openUrl(uri: telegramGroupAddress);
                      },
                      // hoverColor: Colors.white,
                      icon: Icon(
                        Icons.telegram,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 改变图片
          Positioned(
            left: 10,
            top: MediaQuery.of(context).size.height / 2 - 100,
            child: Opacity(
              opacity: 0.7,
              child: IconButton(
                onPressed: () {
                  controller.changeToLeftBackgroundImage();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // 改变图片
          Positioned(
            right: 10,
            top: MediaQuery.of(context).size.height / 2 - 100,
            child: Opacity(
              opacity: 0.7,
              child: IconButton(
                onPressed: () {
                  controller.changeToRightBackgroundImage();
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // 二维码
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 100,
            top: MediaQuery.of(context).size.height / 2 - 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Opacity(
                opacity: 0.7,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        color: Colors.white,
                        child: QrImage(
                          data: controller.qrcode,
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 30,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            '推荐使用手机浏览器扫码下载',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // 安卓下载
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 100,
            top: MediaQuery.of(context).size.height / 2 - 100 + 230 + 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Opacity(
                opacity: 0.7,
                child: Container(
                  width: 200,
                  height: 50,
                  color: Colors.black,
                  child: TextButton(
                    onPressed: () {
                      print('安卓下载');
                      controller.changeAndroidDownloadImage();
                    },
                    child: Text('安卓下载'),
                  ),
                ),
              ),
            ),
          ),
          // 苹果下载
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 100,
            top: MediaQuery.of(context).size.height / 2 -
                100 +
                230 +
                10 +
                50 +
                10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Opacity(
                opacity: 0.7,
                child: Container(
                  width: 200,
                  height: 50,
                  color: Colors.black,
                  child: TextButton(
                    onPressed: () {
                      print('苹果下载');
                      controller.changeAppleDownloadImage();
                    },
                    child: Text('苹果下载'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 手机界面
  Container MobileBody(BuildContext context, HomeController controller) {
    return Container(
      child: Stack(
        children: [
          // 图片背景
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.network(
                controller.backgroundImage.value,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 背景蒙版
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Opacity(
              opacity: 0.3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black,
              ),
            ),
          ),
          // 导航栏
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Opacity(
              opacity: 0.7,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 56,
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    // 菜单图标
                    IconButton(
                      onPressed: () {
                        // print(sizingInformation.deviceScreenType);
                      },
                      icon: Icon(Icons.menu),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Atreus',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    // 跳转到电报
                    IconButton(
                      onPressed: () {
                        openUrl(uri: telegramGroupAddress);
                      },
                      // hoverColor: Colors.white,
                      icon: Icon(
                        Icons.telegram,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 改变图片
          Positioned(
            left: 10,
            top: MediaQuery.of(context).size.height / 2 - 100,
            child: Opacity(
              opacity: 0.7,
              child: IconButton(
                onPressed: () {
                  controller.changeToLeftBackgroundImage();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // 改变图片
          Positioned(
            right: 10,
            top: MediaQuery.of(context).size.height / 2 - 100,
            child: Opacity(
              opacity: 0.7,
              child: IconButton(
                onPressed: () {
                  controller.changeToRightBackgroundImage();
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // 安卓下载
          Positioned(
            left: 20,
            right: 20,
            bottom: 20 + 50 + 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Opacity(
                opacity: 0.7,
                child: Container(
                  width: 200,
                  height: 50,
                  color: Colors.black,
                  child: TextButton(
                    onPressed: () {
                      print('安卓下载');
                      openUrl(uri: androidDownloadURL);
                    },
                    child: Text('安卓下载'),
                  ),
                ),
              ),
            ),
          ),
          // 苹果下载
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Opacity(
                opacity: 0.7,
                child: Container(
                  width: 200,
                  height: 50,
                  color: Colors.black,
                  child: TextButton(
                    onPressed: () {
                      print('苹果下载');
                      openUrl(uri: appleDownloadURL);
                    },
                    child: Text('苹果下载'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
