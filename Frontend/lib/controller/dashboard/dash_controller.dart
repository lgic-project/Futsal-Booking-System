import 'package:flutter/material.dart';
import 'package:leo_futsal/views/dashboard/home_view.dart';
import 'package:leo_futsal/views/dashboard/profile/profile_view.dart';
import 'package:get/get.dart';

class DashController extends GetxController {
  final key = GlobalKey<ScaffoldState>();
  RxList<Widget> pages = RxList([
    HomeView(),
    ProfileView(),
  ]);

  RxInt currentIndex = RxInt(0);
  void onItemTapped(int index) {
    currentIndex.value = index;
  }
}
