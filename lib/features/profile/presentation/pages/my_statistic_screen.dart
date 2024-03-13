import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyStatisticScreen extends StatelessWidget {
  const MyStatisticScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarSecond(
        title: "Моя статистика",
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _cardInfoTheme(
            theme: "Простое сложение и вычитание (ПСВ)",
            level: "Junior 1, Senior 1",
            percent: 91,
          ),
          Gap(40),
          _cardInfoTheme(
            theme: "Помощь брата",
            level: "Junior 1, Senior 1",
            percent: 100,
            progressIndicator: _themeProgressIndicator(
              theme: '+1',
              correct: 0,
              total: 0,
            ),
          ),
          Gap(40),
          _cardInfoTheme(
            theme: "Помощь друга",
            level: "Junior 2, Senior 2",
            percent: 20,
            progressIndicator: _themeProgressIndicator(
              theme: '-1',
              correct: 30,
              total: 30,
            ),
          ),
          Gap(40),
          _cardInfoTheme(
            theme: "Помощь друга",
            level: "Junior 3, Senior 3",
            percent: 50,
            progressIndicator: _themeProgressIndicator(
              theme: '+1',
              correct: 15,
              total: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget _themeProgressIndicator({
    required String theme,
    required int total,
    required int correct,
  }) {
    return Column(
      children: [
        Text(
          total != 0
              ? "$correct правильно из $total"
              : "Нет попыток по этой теме",
          style: AppTextStyles.black14.copyWith(
            color: total != 0 ? Colors.green : AppColors.grey,
          ),
        ),
        Gap(5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: LinearPercentIndicator(
            lineHeight: 14.0,
            percent: total == 0 ? 0 : correct / total,
            progressColor: Colors.green,
            backgroundColor: total == 0 ? Colors.grey : Colors.red,
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

  Widget _cardInfoTheme({
    required String theme,
    required String level,
    required int percent,
    Widget? progressIndicator,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            blurStyle: BlurStyle.normal,
            blurRadius: 8,
          ),
        ],
      ),
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
          progressIndicator ?? SizedBox(),
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
