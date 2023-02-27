import 'package:atreus/app/common/constant.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // 是否为深色模式
  var isDarkMode = false;

  // 深色和浅色模式切换
  void changeDarkMode() {
    if (isDarkMode == false) {
      isDarkMode = true;
    } else {
      isDarkMode = false;
    }
    update();
  }

  // 二维码
  var qrcode = androidDownloadURL;

  // 当前显示的图片地址
  var backgroundImage = 'assets/images/2.jpg'.obs;
  // 显示图片的定位编号
  var backgroundCount = 2.obs;

  // 改变背景图片
  void changeToLeftBackgroundImage() {
    if (backgroundCount > 1) {
      backgroundCount--;
      backgroundImage.value = 'assets/images/${backgroundCount.value}.jpg';
      update();
    }
  }

  // 改变背景图片
  void changeToRightBackgroundImage() {
    if (backgroundCount < 3) {
      backgroundCount++;
      backgroundImage.value = 'assets/images/${backgroundCount.value}.jpg';
      update();
    }
  }

  // 改变为安卓扫码
  void changeAndroidDownloadImage() {
    qrcode = androidDownloadURL;
    update();
  }

  // 改变为苹果扫码
  void changeAppleDownloadImage() {
    qrcode = appleDownloadURL;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
