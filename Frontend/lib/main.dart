import 'package:flutter/material.dart';
import 'package:leo_futsal/controller/core_controller.dart';
import 'package:leo_futsal/utils/config.dart';
import 'package:leo_futsal/utils/theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:leo_futsal/views/welcome_screen.dart';

import 'utils/pages.dart';
import 'views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const LeoFutsalApp());
}

class LeoFutsalApp extends StatelessWidget {
  const LeoFutsalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: Config.khaltiPublicKeyTest,
      builder: (context, navigatorKey) {
        return GetBuilder<CoreController>(
          init: Get.put(CoreController()),
          builder: (controller) {
            return GetMaterialApp(
              localizationsDelegates: const [KhaltiLocalizations.delegate],
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              getPages: pages,
              theme: basicTheme(),
              initialRoute: SplashScreen.routeName,
              // home: const WelcomeScreen(),
            );
          },
        );
      },
    );
  }
}