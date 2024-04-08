import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/widgets/statistic_card_info_widget.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/widgets/statistic_theme_progressIndicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyStatisticScreen extends StatelessWidget {
  const MyStatisticScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarSecond(
        title: "Моя статистика",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          StatisticCardInfoWidget(
            theme: "Простое сложение и вычитание (ПСВ)",
            level: "Junior 1, Senior 1",
            percent: 91,
            progressIndicator: null,
          ),
          Gap(40),
          StatisticCardInfoWidget(
            theme: "Помощь брата",
            level: "Junior 1, Senior 1",
            percent: 100,
            progressIndicator: StatisticThemeProgressIndicatorWidget(
              theme: '+1',
              correct: 0,
              total: 0,
            ),
          ),
          Gap(40),
          StatisticCardInfoWidget(
            theme: "Помощь друга",
            level: "Junior 2, Senior 2",
            percent: 20,
            progressIndicator: StatisticThemeProgressIndicatorWidget(
              theme: '-1',
              correct: 30,
              total: 30,
            ),
          ),
          Gap(40),
          StatisticCardInfoWidget(
            theme: "Помощь друга",
            level: "Junior 3, Senior 3",
            percent: 50,
            progressIndicator: StatisticThemeProgressIndicatorWidget(
              theme: '+1',
              correct: 15,
              total: 30,
            ),
          ),
        ],
      ),
    );
  }
}
