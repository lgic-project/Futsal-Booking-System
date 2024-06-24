import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:leo_futsal/controller/core_controller.dart';
import 'package:leo_futsal/models/auth/user_model.dart';
import 'package:leo_futsal/repo/auth_repo.dart';
import 'package:leo_futsal/utils/custom_snackbar.dart';
import 'package:leo_futsal/utils/storage_keys.dart';
import 'package:get/get.dart';
import 'package:leo_futsal/views/welcome_screen.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool passwordObscure = true.obs;

  void onEyeCLick() {
    passwordObscure.value = !passwordObscure.value;
  }

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "signing up ...");
      User user = User(
        name: nameController.text,
        email: emailController.text,
        phoneNumber: phoneController.text,
      );
      await AuthRepo.registerUser(
        user: user,
        password: passwordController.text,
        onSuccess: (user, token) async {
          loading.hide();
          final box = GetStorage();
          await box.write(
              StorageKeys.ACCESS_TOKEN, json.encode(token.toJson()));
          await box.write(StorageKeys.USER, json.encode(user.toJson()));
          // print("on submit ma aayo ${user.name}");
          Get.find<CoreController>().loadCurrentUser();

          // print("on submit ma aayo ${user.email}");
          Get.offAll(() => const WelcomeScreen());
          CustomSnackBar.success(title: "Sign up succesful");
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Signup", message: message);
        },
      );
    }
  }
}
