import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:leo_futsal/controller/core_controller.dart';
import 'package:leo_futsal/utils/colors.dart';
import 'package:leo_futsal/utils/custom_text_styles.dart';
import 'package:leo_futsal/utils/image_path.dart';

import 'package:leo_futsal/widget/row/profile_list.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatelessWidget {
  final coreController = Get.find<CoreController>();
  DrawerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Drawer(
      backgroundColor: theme.colorScheme.background,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: CachedNetworkImage(
                imageUrl: "",
                fit: BoxFit.cover,
                height: 120,
                width: 120,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => Image.asset(
                  ImagePath.imagePlaceholder,
                  fit: BoxFit.cover,
                  height: 120,
                  width: 120,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Amit Amit",
              style: CustomTextStyles.f16W600(
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 1,
                color: Color(0xFFAAAAAA),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ProfileTile(
              onTap: () {
                // Get.back();
                // Get.toNamed(EditProfileScreen.routeName);
              },
              leadingIcon: Icons.person_2_outlined,
              title: "Edit Profile",
              showTrailing: false,
            ),
            ProfileTile(
              onTap: () {
                // Get.back();
                // Get.toNamed(FavoritesScreen.routeName);
              },
              leadingIcon: Icons.receipt_long_outlined,
              title: "Recent Booking",
              showTrailing: false,
            ),
            ProfileTile(
              onTap: () {
                Get.back();
                // Get.toNamed(ChangeThemeScreen.routeName);
              },
              leadingIcon: Icons.history,
              title: "History",
              showTrailing: false,
            ),
            ProfileTile(
              onTap: () {
                Get.back();
                // Get.toNamed(ChangeThemeScreen.routeName);
              },
              leadingIcon: Icons.info_outline,
              title: "About",
              showTrailing: false,
            ),
            ProfileTile(
              onTap: () {
                Get.back();
                // Get.toNamed(ChangePasswordScreen.routeName);
              },
              leadingIcon: Icons.lock_outline,
              title: "Change Password",
              showTrailing: false,
            ),
            ProfileTile(
              onTap: () {
                // coreController.logOut();
              },
              leadingIcon: Icons.logout,
              title: "Log Out",
              showTrailing: false,
              color: AppColors.errorColor,
            )
          ],
        ),
      ),
    );
  }
}
