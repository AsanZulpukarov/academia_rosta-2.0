import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/container_frame_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StatisticCardInfoWidget extends StatelessWidget {
  final String theme;
  final String level;
  final int percent;
  final List<Widget> progressIndicator;
  const StatisticCardInfoWidget({
    Key? key,
    required this.theme,
    required this.level,
    required this.percent,
    required this.progressIndicator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerFrameWidget(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      blurRadius: 8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Статистика раздела:",
            style: AppTextStyles.black14,
          ),
          Gap(10),
          Text(
            theme,
            style: AppTextStyles.black16.copyWith(
              color: AppColors.main,
            ),
          ),
          Gap(16),
          Text(
            "Темы из первых книг по Ментальной арифметике:",
            style: AppTextStyles.black14,
          ),
          Gap(10),
          Text(
            level,
            style: AppTextStyles.black16.copyWith(
              color: AppColors.main,
            ),
          ),
          Gap(30),
          Column(
            children: progressIndicator,
          ),
          Gap(30),
          Center(
            child: CircularPercentIndicator(
              radius: 120.r,
              percent: percent / 100.0,
              center: Text(
                "$percent%",
                style: AppTextStyles.black26.copyWith(
                  fontSize: 48.sp,
                ),
              ),
              backgroundColor: Colors.red,
              progressColor: Colors.green,
              lineWidth: 30.w,
            ),
          ),
        ],
      ),
    );
  }
}
