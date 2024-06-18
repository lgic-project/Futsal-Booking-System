import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leo_futsal/controller/core_controller.dart';
import 'package:leo_futsal/controller/dashboard/profile/profile_controller.dart';
import 'package:leo_futsal/utils/colors.dart';
import 'package:leo_futsal/utils/custom_text_styles.dart';
import 'package:leo_futsal/utils/image_path.dart';
import 'package:get/get.dart';
import 'package:leo_futsal/views/faq.dart';

class ProfileView extends StatelessWidget {
  final c = Get.put(ProfileController());
  final controller = Get.find<CoreController>();
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: SvgPicture.asset(
          ImagePath.logo,
          height: 35,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: CachedNetworkImage(
                    imageUrl: c.user.value?.profileImageUrl ?? "",
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
                Obx(
                  () => Text("${c.user.value?.name!.capitalize}",
                      style: CustomTextStyles.f16W400(
                          color: AppColors.primaryColor)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Text("${c.user.value?.phoneNumber!}",
                      style: CustomTextStyles.f16W400(
                          color: AppColors.primaryColor)),
                ),
                const SizedBox(
                  height: 10,
                ),

                // Obx(
                Obx(
                  () => Text("${c.user.value?.email!}",
                      style: CustomTextStyles.f16W400(
                          color: AppColors.primaryColor)),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // const Divider(thickness: 1.5),
            // Padding(
            //   padding: const EdgeInsets.only(top: 30, left: 30, right: 16),
            //   child: InkWell(
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Row(
            //             children: [
            //               const Icon(Icons.person_2_outlined),
            //               const SizedBox(width: 20),
            //               Text(
            //                 "Profile Setting",
            //                 style: CustomTextStyles.f16W400(
            //                     color: AppColors.textColor),
            //               )
            //             ],
            //           ),
            //           const Icon(Icons.arrow_forward_ios)
            //         ],
            //       ),
            //       onTap: () {
            //         // Get.to(() => EditProfileScreen());
            //       }),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //       top: 30, left: 30, right: 16, bottom: 30),
            //   child: InkWell(
            //     onTap: () {
            //       Get.to(() => const BookingHistoryScreen());
            //     },
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Row(
            //           children: [
            //             const Icon(Icons.list),
            //             const SizedBox(width: 20),
            //             Text(
            //               "Recents",
            //               style: CustomTextStyles.f16W400(
            //                   color: AppColors.textColor),
            //             )
            //           ],
            //         ),
            //         const Icon(Icons.arrow_forward_ios)
            //       ],
            //     ),
            //   ),
            // ),
            const Divider(thickness: 1.5),

            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          c.changePassword();
                        },
                        child: Text("Change Password",
                            style: CustomTextStyles.f16W400(
                                color: AppColors.textColor)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const FAQScreen());
                    },
                    child: Text("FAQ",
                        style: CustomTextStyles.f16W400(
                            color: AppColors.textColor)),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Version'),
                          content: const Text('Version 1.1'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text("Version",
                        style: CustomTextStyles.f16W400(
                            color: AppColors.textColor)),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1.5),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 40),
              child: TextButton(
                onPressed: () {
                  Get.dialog(
                    AlertDialog(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Are you sure you want to logout?",
                            style: CustomTextStyles.f12W600(),
                          ),
                        ],
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 40,
                                width: Get.width / 3.5,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5, color: AppColors.lGrey),
                                    borderRadius: BorderRadius.circular(5)),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.extraWhite,
                                    elevation: 0.0,
                                  ),
                                  child: Text('No',
                                      style: CustomTextStyles.f12W400(
                                          color: AppColors.textColor)),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: Get.width / 3.5,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    elevation: 0.0,
                                  ),
                                  child: Text('Yes',
                                      style: CustomTextStyles.f12W400(
                                          color: AppColors.extraWhite)),
                                  onPressed: () {
                                    controller.logOut();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text("Log out",
                        style: CustomTextStyles.f16W400(
                            color: AppColors.textColor)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
