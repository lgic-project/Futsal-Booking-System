import 'package:leo_futsal/controller/core_controller.dart';
import 'package:leo_futsal/views/auth/login_screen.dart';
import 'package:get/get.dart';
import 'package:leo_futsal/views/dashboard/dash_screen.dart';

class SplashController extends GetxController {
  final coreController = Get.find<CoreController>();

  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (coreController.isUserLoggedIn()) {
          Get.offAndToNamed(DashScreen.routeName);
        } else {
          Get.offAllNamed(LoginScreen.routeName);
        }
        // Get.offAllNamed(LoginScreen.routeName);
      },
    );
    super.onInit();
  }
}
