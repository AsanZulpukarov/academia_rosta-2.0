import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class NotificationEmptyScreen extends StatelessWidget {
  const NotificationEmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/images/no_notification.png",
            ),
          ),
          Gap(40.h),
          Text(
            "У вас нет уведомлений!",
            style: AppTextStyles.black20,
          ),
        ],
      ),
    );
  }
}
