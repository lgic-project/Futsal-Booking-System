import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:leo_futsal/controller/dashboard/home_controller.dart';
import 'package:leo_futsal/utils/colors.dart';
import 'package:leo_futsal/utils/custom_snackbar.dart';
import 'package:leo_futsal/widget/custom/custome_textfield.dart';
import 'package:leo_futsal/widget/custom/elevated_button.dart';

class DateFormScreen extends StatelessWidget {
  DateFormScreen({super.key});

  final c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          const Text(
            "Please fill the details below to proceed",
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Choose date",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Text(c.selectedDate.value),
                Obx(
                  () => Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      SizeButton(
                        name: 'Today',
                        isSelected: c.selectedDate.value == 'Today',
                        onTap: () => c.updateSelectedDate('Today'),
                      ),
                      SizeButton(
                        name: 'Tomorrow',
                        isSelected: c.selectedDate.value == 'Tomorrow',
                        onTap: () => c.updateSelectedDate('Tomorrow'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Start Date and Time ",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  readOnly: true,
                  controller: c.startTimeController,
                  onTap: () => c.startChooseTime(context),
                  hint: "Start Time",
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "End Date and Time ",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  readOnly: true,
                  controller: c.endTimeController,
                  onTap: () => c.endChooseTime(context),
                  hint: "End Time",
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
          height: 60,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: CustomElevatedButton(
            onTap: () {
              if (c.selectedDate.value == "") {
                CustomSnackBar.error(
                    title: "Date",
                    message: "Choose the Date before you proceed");
              } else {
                if (c.selectedDate.value == "Today") {
                  DateTime date = DateTime.now();

                  // Construct DateTime objects using the selected date and time values
                  DateTime startDate = DateTime(
                    date.year,
                    date.month,
                    date.day,
                    c.startSelectedTime.value.hour,
                    c.startSelectedTime.value.minute,
                  );

                  DateTime endDate = DateTime(
                    date.year,
                    date.month,
                    date.day,
                    c.endSelectedTime.value.hour,
                    c.endSelectedTime.value.minute,
                  );

                  // Format the dates without milliseconds
                  DateFormat formatter = DateFormat("yyyy-MM-dd HH:mm:ss");

                  print(formatter.format(startDate));
                  print(formatter.format(endDate));

                  if (startDate.isBefore(DateTime.now())) {
                    // ignore: void_checks
                    return CustomSnackBar.error(
                        title: "Date Time", message: "Time has already passed");
                  }
                  if (endDate.isBefore(startDate)) {
                    // ignore: void_checks
                    return CustomSnackBar.error(
                        title: "End date",
                        message: "End date cannot be before start date");
                  }
                  if (endDate.isAtSameMomentAs(startDate)) {
                    // ignore: void_checks
                    return CustomSnackBar.error(
                        title: "End time",
                        message: "End time cannot be the same as start time");
                  }
                  if (endDate
                      .isBefore(startDate.add(const Duration(hours: 1)))) {
                    // ignore: void_checks
                    return CustomSnackBar.error(
                        title: "End time",
                        message:
                            "End time must be at least 1 hour after start time");
                  }
                  print(formatter.format(startDate));
                  print(formatter.format(endDate));
                  c.searchBooking(formatter.format(startDate).toString(),
                      formatter.format(endDate), context);
                } else {
                  DateTime date = DateTime.now().add(const Duration(days: 1));

                  // Construct DateTime objects using the selected date and time values
                  DateTime startDate = DateTime(
                    date.year,
                    date.month,
                    date.day,
                    c.startSelectedTime.value.hour,
                    c.startSelectedTime.value.minute,
                  );

                  DateTime endDate = DateTime(
                    date.year,
                    date.month,
                    date.day,
                    c.endSelectedTime.value.hour,
                    c.endSelectedTime.value.minute,
                  );

                  // Format the dates without milliseconds
                  DateFormat formatter = DateFormat("yyyy-MM-dd HH:mm:ss");

                  print(formatter.format(startDate));
                  print(formatter.format(endDate));

                  if (startDate.isBefore(DateTime.now())) {
                    // ignore: void_checks
                    return CustomSnackBar.error(
                        title: "Date Time", message: "Time has already passed");
                  }
                  if (endDate.isBefore(startDate)) {
                    // ignore: void_checks
                    return CustomSnackBar.error(
                        title: "End date",
                        message: "End date cannot be before start date");
                  }
                  if (endDate.isAtSameMomentAs(startDate)) {
                    // ignore: void_checks
                    return CustomSnackBar.error(
                        title: "End time",
                        message: "End time cannot be the same as start time");
                  }
                  if (endDate
                      .isBefore(startDate.add(const Duration(hours: 1)))) {
                    // ignore: void_checks
                    return CustomSnackBar.error(
                        title: "End time",
                        message:
                            "End time must be at least 1 hour after start time");
                  }
                  print("hello success");
                  print(formatter.format(startDate));
                  print(formatter.format(endDate));
                  c.searchBooking(formatter.format(startDate).toString(),
                      formatter.format(endDate), context);
                }
              }
            },
            title: 'Search Venue',
          )),
    );
  }
}

class SizeButton extends StatelessWidget {
  const SizeButton({
    Key? key,
    required this.name,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final String name;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width / 2.5,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.grey,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(name),
        ),
      ),
    );
  }
}
