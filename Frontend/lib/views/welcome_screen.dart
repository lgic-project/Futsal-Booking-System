import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:leo_futsal/utils/custom_text_styles.dart';
import 'package:leo_futsal/views/dashboard/dash_screen.dart';
import 'package:leo_futsal/widget/custom/elevated_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = "/welcomescreen";
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://i.pinimg.com/originals/4b/39/a9/4b39a94252cddcc7d20326c140278c4e.png', // Provide your image path here
              height: MediaQuery.of(context).size.height / 2,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text('Welcome to Our App', style: CustomTextStyles.f16W400()),
            const SizedBox(
              height: 8,
            ),
            Text('Continue your journey with us',
                style: CustomTextStyles.f16W400()),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
          child: CustomElevatedButton(
            onTap: () {
              Get.offAllNamed(DashScreen.routeName);
            },
            title: "Continue",
          ),
        ),
      ),
    );
  }
}
