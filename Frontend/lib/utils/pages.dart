
import 'package:leo_futsal/controller/auth/login_controller.dart';

import 'package:leo_futsal/controller/auth/signup_controller.dart';
import 'package:leo_futsal/controller/dashboard/dash_controller.dart';
import 'package:leo_futsal/controller/dashboard/history_controller.dart';
import 'package:leo_futsal/controller/dashboard/home_controller.dart';
import 'package:leo_futsal/controller/dashboard/profile/profile_controller.dart';
import 'package:leo_futsal/controller/splash_controller.dart';
import 'package:leo_futsal/views/auth/login_screen.dart';
import 'package:leo_futsal/views/auth/signup_screen.dart';
import 'package:leo_futsal/views/dashboard/dash_screen.dart';
import 'package:leo_futsal/views/splash_screen.dart';
import 'package:get/get.dart';

var pages = [
  GetPage(
    name: SplashScreen.routeName,
    page: () => SplashScreen(),
    binding: BindingsBuilder(() => Get.lazyPut(
          () => SplashController(),
        )),
  ),
  GetPage(
    name: LoginScreen.routeName,
    page: () => LoginScreen(),
    binding: BindingsBuilder(() => Get.lazyPut(
          () => LoginController(),
        )),
  ),
  GetPage(
    name: SignupScreen.routeName,
    page: () => SignupScreen(),
    binding: BindingsBuilder(() => Get.lazyPut(
          () => SignupController(),
        )),
  ),
  // GetPage(
  //   name: ForgetPasswordScreen.routeName,
  //   page: () => ForgetPasswordScreen(),
  //   binding: BindingsBuilder(() => Get.lazyPut(
  //         () => ForgetPasswordController(),
  //       )),
  // ),
  // GetPage(
  //   name: OTPScreen.routeName,
  //   page: () {
  //     var data = Get.arguments;
  //     var email = data[0];
  //     return OTPScreen(
  //       email: email,
  //     );
  //   },
  //   binding: BindingsBuilder(() => Get.lazyPut(
  //         () => OTPController(),
  //       )),
  // ),
  // GetPage(
  //   name: ResetPasswordScreen.routeName,
  //   page: () {
  //     var data = Get.arguments;
  //     var email = data[0];
  //     return ResetPasswordScreen(
  //       email: email,
  //     );
  //   },
  //   binding: BindingsBuilder(() => Get.lazyPut(
  //         () => ResetPasswordController(),
  //       )),
  // ),
  GetPage(
    name: DashScreen.routeName,
    page: () => DashScreen(),
    binding: BindingsBuilder(() {
      Get.lazyPut(
        () => DashController(),
      );
      Get.lazyPut(
        () => HomeController(),
      );
      Get.lazyPut(
        () => HistoryController(),
      );
      Get.lazyPut(
        () => ProfileController(),
      );
    }),
  ),
 
];
