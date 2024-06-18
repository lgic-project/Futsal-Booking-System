import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leo_futsal/utils/colors.dart';
import 'package:leo_futsal/utils/custom_text_styles.dart';

class BookingHistoryScreen extends StatelessWidget {
  static const String routeName = "/booking_history";
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            backgroundColor: Colors.white,
            leading: InkWell(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: Text("Booking History",
                style: CustomTextStyles.f16W600(color: AppColors.textColor))),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    // Get.to(() => const BookingDetailScreen());
                  },
                  child: const BookingWidget(
                      profileImage:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Bachelor%27s_button%2C_Basket_flower%2C_Boutonniere_flower%2C_Cornflower_-_3.jpg/1200px-Bachelor%27s_button%2C_Basket_flower%2C_Boutonniere_flower%2C_Cornflower_-_3.jpg",
                      name: "Santosh Gurung",
                      phoneNo: "Contact: 283439849",
                      gameTypeImage:
                          "https://cdn2.iconfinder.com/data/icons/activity-5/50/1F3C0-basketball-512.png",
                      gameType: "Basketball",
                      time: "1PM - 2PM"));
            }));
  }
}

class BookingWidget extends StatelessWidget {
  const BookingWidget({
    super.key,
    required this.profileImage,
    required this.name,
    required this.phoneNo,
    required this.gameTypeImage,
    required this.gameType,
    required this.time,
  });
  final String profileImage;
  final String name;
  final String phoneNo;
  final String gameTypeImage;
  final String gameType;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
      child: Container(
        height: 112,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.extraWhite,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1.2, color: AppColors.lGrey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(profileImage),
                radius: 28,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: CustomTextStyles.f16W600()),
                    Text(phoneNo, style: CustomTextStyles.f12W300()),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: Get.width / 3.4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Image.network(gameTypeImage)),
                                Text(
                                  gameType,
                                  style: CustomTextStyles.f12W400(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(time, style: CustomTextStyles.f12W400())
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
