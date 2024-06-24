import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:leo_futsal/models/auth/access_token.dart';
import 'package:leo_futsal/models/auth/user_model.dart';
import 'package:leo_futsal/utils/storage_helper.dart';
import 'package:leo_futsal/utils/storage_keys.dart';
import 'package:leo_futsal/views/auth/login_screen.dart';

class CoreController extends GetxController {
  RxBool darkTheme = RxBool(false);

  Rx<User?> currentUser = Rxn<User>();
  Accesstoken? accesstoken;

  bool isFirstTimeUser() {
    var appLoadDate = StorageHelper.getAppLoadedDate();
    return appLoadDate == null;
  }

  @override
  void onInit() async {
    loadCurrentUser();
    super.onInit();
  }

  void loadCurrentUser() async {
    currentUser.value = StorageHelper.getUser();
    log("current user----------------------- ${currentUser.value?.email}-");
    log("current user----------------${currentUser.value}--------");
  }

  bool isUserLoggedIn() {
    loadCurrentUser();
    return currentUser.value != null;
  }

  void logOut() async {
    final box = GetStorage();
    await box.remove(StorageKeys.ACCESS_TOKEN);
    await box.remove(StorageKeys.USER);
    loadCurrentUser();
    Get.offAll(() => LoginScreen());
  }
}
