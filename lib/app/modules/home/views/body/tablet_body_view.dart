import 'package:atreus/app/common/constant.dart';
import 'package:atreus/app/common/urls.dart';
import 'package:atreus/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

// 平板界面
Container TabletBodyView(BuildContext context, HomeController controller) {
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
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 56,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                // 菜单
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: controller.isDarkMode ? Colors.black : Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                // 标题
                Text(
                  applicationName,
                  style: TextStyle(
                    fontSize: 18,
                    color: controller.isDarkMode ? Colors.black : Colors.white,
                  ),
                ),
                Spacer(),
                // 图标
                IconButton(
                  onPressed: () {
                    // 跳转到电报群
                    openUrl(uri: telegramGroupAddress);
                  },
                  icon: Icon(
                    Icons.telegram,
                    color: controller.isDarkMode ? Colors.black : Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                // 深色和浅色模式切换
                controller.isDarkMode == false
                    ?
                    // 深色模式
                    IconButton(
                        onPressed: () {
                          controller.changeDarkMode();
                        },
                        icon: Icon(
                          Icons.light_mode,
                          color: controller.isDarkMode
                              ? Colors.black
                              : Colors.white,
                        ),
                      )
                    :
                    // 浅色模式
                    IconButton(
                        onPressed: () {
                          controller.changeDarkMode();
                        },
                        icon: Icon(
                          Icons.dark_mode,
                          color: controller.isDarkMode
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                SizedBox(
                  width: 10,
                ),
              ],
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
                color: controller.isDarkMode ? Colors.black : Colors.white,
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
                color: controller.isDarkMode ? Colors.black : Colors.white,
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
                      color:
                          controller.isDarkMode ? Colors.black : Colors.white,
                      child: QrImage(
                        foregroundColor:
                            controller.isDarkMode ? Colors.white : Colors.black,
                        data: controller.qrcode,
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 30,
                      color:
                          controller.isDarkMode ? Colors.black : Colors.white,
                      child: Center(
                        child: Text(
                          '推荐使用手机浏览器扫码下载',
                          style: TextStyle(
                            fontSize: 12,
                            color: controller.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          ),
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
                child: TextButton(
                  onPressed: () {
                    // 切换下载图片
                    controller.changeAndroidDownloadImage();
                  },
                  child: Text('安卓下载'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        controller.isDarkMode ? Colors.white : Colors.black),
                    overlayColor: MaterialStateProperty.all(
                        controller.isDarkMode ? Colors.black : Colors.white),
                    backgroundColor: MaterialStateProperty.all(
                        controller.isDarkMode ? Colors.black : Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        // 苹果下载
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 100,
          top:
              MediaQuery.of(context).size.height / 2 - 100 + 230 + 10 + 50 + 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Opacity(
              opacity: 0.7,
              child: Container(
                width: 200,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    // 切换下载图片
                    controller.changeAppleDownloadImage();
                  },
                  child: Text('苹果下载'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        controller.isDarkMode ? Colors.white : Colors.black),
                    overlayColor: MaterialStateProperty.all(
                        controller.isDarkMode ? Colors.black : Colors.white),
                    backgroundColor: MaterialStateProperty.all(
                        controller.isDarkMode ? Colors.black : Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
