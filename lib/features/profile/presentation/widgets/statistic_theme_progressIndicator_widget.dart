import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StatisticThemeProgressIndicatorWidget extends StatelessWidget {
  final String theme;
  final int total;
  final int correct;
  final Color correctProgressColor;
  final Color incorrectProgressColor;
  final Color backgroundColor;
  final Radius barRadius;
  final double lineHeight;
  const StatisticThemeProgressIndicatorWidget({
    Key? key,
    required this.theme,
    required this.total,
    required this.correct,
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
          total != 0
              ? "$correct правильно из $total"
              : "Нет попыток по этой теме",
          style: AppTextStyles.black14.copyWith(
            color: total != 0 ? correctProgressColor : backgroundColor,
          ),
        ),
        Gap(5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: LinearPercentIndicator(
            lineHeight: lineHeight,
            percent: total == 0 ? 0 : correct / total,
            progressColor: correctProgressColor,
            backgroundColor:
                total == 0 ? backgroundColor : incorrectProgressColor,
            barRadius: const Radius.circular(20),
            leading: Text(
              theme,
              style: AppTextStyles.black14Medium,
            ),
          ),
        ),
      ],
    );
  }
}
