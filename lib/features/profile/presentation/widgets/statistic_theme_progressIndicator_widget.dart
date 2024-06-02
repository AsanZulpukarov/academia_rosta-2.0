import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/mark_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StatisticThemeProgressIndicatorWidget extends StatelessWidget {
  final String topic;
  final MarkEntity markEntity;
  final Color correctProgressColor;
  final Color incorrectProgressColor;
  final Color backgroundColor;
  final Radius barRadius;
  final double lineHeight;

  const StatisticThemeProgressIndicatorWidget({
    Key? key,
    required this.topic,
    required this.markEntity,
    this.correctProgressColor = AppColors.green,
    this.incorrectProgressColor = AppColors.mainRed,
    this.backgroundColor = AppColors.grey,
    this.barRadius = const Radius.circular(20),
    this.lineHeight = 14.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          markEntity.total != 0
              ? "${markEntity.correct} правильно из ${markEntity.total}"
              : "Нет попыток по этой теме",
          style: AppTextStyles.black14.copyWith(
            color:
                markEntity.total != 0 ? correctProgressColor : backgroundColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 5.h),
          child: LinearPercentIndicator(
            lineHeight: lineHeight,
            percent: markEntity.total == 0
                ? 0
                : markEntity.correct! / markEntity.total!,
            progressColor: correctProgressColor,
            backgroundColor: markEntity.total == 0
                ? backgroundColor
                : incorrectProgressColor,
            barRadius: const Radius.circular(20),
            leading: Text(
              topic ?? "Пусто",
              style: AppTextStyles.black14Medium,
            ),
          ),
        ),
      ],
    );
  }
}
