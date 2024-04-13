import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NotificationEmptyScreen extends StatelessWidget {
  const NotificationEmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/images/no_notification.png",
            ),
          ),
          const Gap(40),
          const Text(
            "У вас нет уведомлений!",
            style: AppTextStyles.black20,
          ),
        ],
      ),
    );
  }
}
