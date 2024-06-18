import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:leo_futsal/controller/core_controller.dart';
import 'package:leo_futsal/controller/dashboard/home_controller.dart';
import 'package:leo_futsal/controller/dashboard/profile/profile_controller.dart';
import 'package:leo_futsal/models/orders.dart';
import 'package:leo_futsal/models/venue.dart';
import 'package:leo_futsal/utils/colors.dart';
import 'package:leo_futsal/utils/custom_text_styles.dart';
import 'package:leo_futsal/utils/image_path.dart';
import 'package:get/get.dart';
import 'package:leo_futsal/views/single_page.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final c = Get.put(HomeController());
  final co = Get.put(ProfileController());

  final coreController = Get.find<CoreController>();
  @override
  Widget build(BuildContext context) {
    var hour = DateTime.now().hour;
    String greeting;
    if (hour <= 12) {
      greeting = ('Good Morning');
    } else if ((hour > 12) && (hour <= 16)) {
      greeting = ('Good Afternoon');
    } else if ((hour > 16) && (hour < 20)) {
      greeting = ('Good Evening');
    } else {
      greeting = ('Good Night');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(greeting, style: CustomTextStyles.f14W400()),
                  Obx(
                    () => Text("${co.user.value?.name!.capitalize}",
                        style: CustomTextStyles.f16W400()),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: CachedNetworkImage(
                  imageUrl: co.user.value?.profileImageUrl ?? "",
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Image.asset(
                    ImagePath.logo,
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // drawer: DrawerScreen(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 19.0),
                child: Text(
                  "Join With Us",
                  style: CustomTextStyles.f16W400(),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Column(
                children: [
                  CarouselSlider(
                    items: c.imageSliders,
                    carouselController: c.controller,
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.5,
                        onPageChanged: (index, reason) {
                          c.current.value = index;
                        }),
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: c.imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => c.controller.animateToPage(entry.key),
                          child: Container(
                            width: 5,
                            height: 5,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(c.current.value == entry.key
                                        ? 0.9
                                        : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Book Game ",
                  style: CustomTextStyles.f16W400(),
                ),
              ),
              // BookFutsalCard(),
              Obx(
                () => (c.loading.value)
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: 140,
                        child: ListView.builder(
                            // scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: c.venue.length,
                            itemBuilder: (context, index) {
                              Venue ven = c.venue[index];
                              return BookFutsalCard(
                                ven: ven,
                              );
                            }),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                child: Text(
                  "History",
                  style: CustomTextStyles.f16W400(),
                ),
              ),
              Obx(
                () => (c.loading.value)
                    ? Center(child: const CircularProgressIndicator())
                    : c.orderHistory.isEmpty
                        ? const Center(child: Text("No history"))
                        : SizedBox(
                            height: 140,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: c.orderHistory.length,
                                itemBuilder: (context, index) {
                                  Order history = c.orderHistory[index];
                                  return HistoryCard(
                                    orderHistory: history,
                                    color: index % 2 == 0
                                        ? AppColors.primaryColor
                                        : Colors.amber,
                                  );
                                }),
                          ),
              ),

              // ListView.builder(
              //   shrinkWrap: true,
              //   itemCount: 2,
              //   itemBuilder: ((context, index) {
              //     return HistoryCard(
              //       color:
              //           index % 2 == 0 ? AppColors.primaryColor : Colors.amber,
              //     );
              //   }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class SportsListCard extends StatelessWidget {
  const SportsListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        // height: 128,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
              offset: const Offset(4, 4),
              blurRadius: 9,
              color: const Color(0xFF494949).withOpacity(0.1),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Booking Time",
                        style: CustomTextStyles.f16W400(),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Booking Status",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                    width: 120,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: Text(
                          "View Details",
                          style: CustomTextStyles.f14W400(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookFutsalCard extends StatelessWidget {
  BookFutsalCard({
    super.key,
    required this.ven,
  });

  final Venue ven;
  final c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => SinglePage(
              ven: ven,
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15, left: 16, right: 16),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        // height: 128,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
              offset: const Offset(4, 4),
              blurRadius: 9,
              color: const Color(0xFF494949).withOpacity(0.1),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    fit: BoxFit.fill,
                    height: 80,
                    width: 80,
                    imageUrl: "",
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/logo.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Book Your Game Now ",
                        style: CustomTextStyles.f16W400(),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Enjoy your game",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    c.getAllVenue();
                    Get.to(() => SinglePage(
                          ven: ven,
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 220, 215, 215)),
                    height: 40,
                    width: 40,
                    child: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    Key? key,
    required this.color,
    required this.orderHistory,
  }) : super(key: key);

  // final String content;
  final Order orderHistory;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 19,
        right: 19,
        top: 19,
      ),
      child: InkWell(
        onTap: () {},
        child: IntrinsicHeight(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                // boxShadow: [
                //   BoxShadow(
                //     offset: const Offset(4, 4),
                //     blurRadius: 9,
                //              color: AppColors.shadowColor,
                //   ),
                // ],
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: color,
                    ),
                    width: 8,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 13, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          orderHistory.startDate!,
                          style: CustomTextStyles.f14W400(),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            orderHistory.endDate!,
                            style: CustomTextStyles.f14W400(),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            orderHistory.total!.toString(),
                            style: CustomTextStyles.f14W400(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
