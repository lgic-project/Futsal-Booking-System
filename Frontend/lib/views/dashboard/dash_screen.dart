
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leo_futsal/controller/dashboard/dash_controller.dart';
import 'package:leo_futsal/utils/colors.dart';
import 'package:get/get.dart';
import 'package:leo_futsal/utils/image_path.dart';

class DashScreen extends StatelessWidget {
  static const String routeName = "/dash-screen";
  final c = Get.put(DashController());
  DashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: c.key,
      body: Obx(
        () => c.pages[c.currentIndex.value],
      ),
      // drawer: DrawerScreen(),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 3,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryColor,
          unselectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedItemColor: AppColors.lGrey,
          type: BottomNavigationBarType.fixed,
          currentIndex: c.currentIndex.value,
          onTap: c.onItemTapped,
          iconSize: 24,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(
                  top: 9,
                ),
                child: SvgPicture.asset(
                  ImagePath.home,
                  color: c.currentIndex.value == 0
                      ? AppColors.primaryColor
                      : AppColors.lGrey,
                  height: 20,
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(
                  top: 9,
                ),
                child: SvgPicture.asset(
                  ImagePath.person,
                  color: c.currentIndex.value == 1
                      ? AppColors.primaryColor
                      : AppColors.lGrey,
                  height: 20,
                ),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
