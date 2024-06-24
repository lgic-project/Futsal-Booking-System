import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:leo_futsal/models/orders.dart';
import 'package:leo_futsal/models/venue.dart';
import 'package:leo_futsal/repo/order_repo.dart';
import 'package:leo_futsal/repo/venue_repo.dart';
import 'package:leo_futsal/utils/colors.dart';
import 'package:leo_futsal/utils/custom_snackbar.dart';
import 'package:leo_futsal/utils/custom_text_styles.dart';
import 'package:leo_futsal/views/dashboard/dash_screen.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getAllVenue();
    getAllHistory();
    super.onInit();
  }

  final CarouselController controller = CarouselController();
// int current = 0;
  RxInt current = RxInt(0);

  final List<String> imgList = [
    'https://www.trinity.edu.np/assets/backend/uploads/Gallery/ECA/2019/futsal/IMG_9222.jpg',
    'https://www.trinity.edu.np/assets/backend/uploads/Gallery/ECA/2019/futsal/IMG_9452.jpg',
    'https://www.trinity.edu.np/assets/backend/uploads/Gallery/ECA/2019/futsal/IMG_9337.jpg',
  ];

  late List<Widget> imageSliders = imgList
      .map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(
                  item,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 136,
                )),
          ))
      .toList();
  RxBool loading = false.obs;

  RxList<Venue> venue = RxList();
  getAllVenue() async {
    log("asdasdasd yhea aayaena venue");
    loading.value = true;
    await VenueRepo.getAllVenues(
      onSuccess: (venues) {
        loading.value = false;
        venue.addAll(venues);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Venue", message: message);
      }),
    );
  }

  RxList<Order> orderHistory = RxList();
  getAllHistory() async {
    log("asdasdasd yhea aayaena venue");
    loading.value = true;
    await VenueRepo.getAllHistory(
      onSuccess: (venues) {
        loading.value = false;
        orderHistory.addAll(venues);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "History", message: message);
      }),
    );
  }

  final selectedDate = ''.obs;
  void updateSelectedDate(String chooseDate) {
    selectedDate.value = chooseDate;
  }

  var endSelectedTime = TimeOfDay.now().obs;

  TextEditingController endTimeController = TextEditingController();
  TextEditingController eTController = TextEditingController();
  late String endTime;
  endChooseTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().hour),
    );
    if (pickedTime != null) {
      endSelectedTime.value = pickedTime;
      endTime = pickedTime.format(context);
      endTimeController.text = endTime.toString();
      eTController.text =
          "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}:00";
      log('------>>>>>>>.end date ->>>>${eTController.text}');
    }
  }

  TextEditingController sTController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  var startSelectedTime = TimeOfDay.now().obs;
  late String startTime;

  startChooseTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().hour),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(),
          child: child ?? Container(),
        );
      },
    );
    if (pickedTime != null) {
      startSelectedTime.value = pickedTime;
      // ignore: use_build_context_synchronously
      startTime = pickedTime.format(context).toString();
      startTimeController.text = startTime.toString();
      sTController.text =
          "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}:00";
    }
  }

  searchBooking(String sti, String eti, BuildContext context) async {
    loading.value = true;
    await OrderRepo.searchBooking(
      // khaltiResponse: paymentSuccess,
      // amount: paymentController.amount.value.toString(),
      st: sti,
      et: eti,
      onSuccess: () {
        Get.dialog(
          AlertDialog(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Are you sure you want to proceed payment?",
                  style: CustomTextStyles.f12W600(),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: Get.width / 3.5,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.5, color: AppColors.lGrey),
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
                          Navigator.pop(context);
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
                          KhaltiScope.of(context).pay(
                            config: PaymentConfig(
                              amount: 100 * 100,
                              productIdentity: "khalti futsal ",
                              productName: "Leo Futsal",
                            ),
                            preferences: [
                              PaymentPreference.khalti,
                            ],
                            onSuccess: (success) {
                              OrderRepo.postOrder(
                                  st: sti,
                                  et: eti,
                                  payment: "khalti",
                                  total: "100",
                                  onSuccess: () {
                                    orderHistory.clear();
                                    getAllHistory();
                                    Get.offAll(() => DashScreen());
                                  },
                                  onError: (message) {
                                    loading.value = false;
                                    CustomSnackBar.error(
                                        message: message, title: "Order");
                                  });
                              CustomSnackBar.success(
                                  title: "Payment",
                                  message: "Payment Successful");
                            },
                            onFailure: (fa) {
                              CustomSnackBar.error(
                                  title: "Payment", message: "Payment Failure");
                            },
                            onCancel: () {
                              CustomSnackBar.info(
                                  title: "Payment", message: "Payment Cancel");
                            },
                          );
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
      onError: (message) {
        loading.value = false;
        CustomSnackBar.error(message: message, title: "Order");
      },
    );
  }
}
