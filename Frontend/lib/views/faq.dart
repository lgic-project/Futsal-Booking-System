import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leo_futsal/utils/colors.dart';
import 'package:leo_futsal/utils/custom_text_styles.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          "FAQ",
          style: CustomTextStyles.f16W400(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: ListView(
        children: const [
          FaqItem(
            question: 'How can I log in to the app?',
            answer:
                'You can access the application by providing your email and password on the login screen.',
          ),
          FaqItem(
            question: 'What do I need to do to register in the system?',
            answer:
                'Registration requires filling out your name, phone number, email, and password on the registration screen.',
          ),
        ],
      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const FaqItem({super.key, required this.question, required this.answer});

  final bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: CustomTextStyles.f14W400(color: AppColors.primaryColor),
      ),
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    answer,
                    maxLines: 5,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.f14W400(color: AppColors.textColor),
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
