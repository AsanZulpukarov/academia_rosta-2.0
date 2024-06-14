import 'package:academia_rosta_diplom/constants.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/mark_entity.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/widgets/statistic_card_info_widget.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/widgets/statistic_theme_progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class StatisticLoadedScreen extends StatelessWidget {
  final Map<String, MarkEntity> statistics;
  const StatisticLoadedScreen({super.key,required this.statistics});

  @override
  Widget build(BuildContext context) {
    List<MarkEntity> pb = [];
    List<MarkEntity> pd2 = [];
    List<MarkEntity> pd3 = [];
    int totalPB = 0;
    int correctPB = 0;
    int totalPD2 = 0;
    int correctPD2 = 0;
    int totalPD3 = 0;
    int correctPD3 = 0;
    for (int i = 1; i < Constants.topics.length; i++) {
      MarkEntity topicItem = MarkEntity(
        topic: Constants.topics[i].code,
        correct: statistics[Constants.topics[i].json]?.correct ?? 0,
        incorrect:
        statistics[Constants.topics[i].json]?.incorrect ?? 0,
        total: statistics[Constants.topics[i].json]?.total ?? 0,
      );
      if (i < 9) {
        pb.add(topicItem);
        totalPB += topicItem.total ?? 0;
        correctPB += topicItem.correct ?? 0;
      } else if (i % 2 == 0) {
        pd2.add(topicItem);
        totalPD2 += topicItem.total ?? 0;
        correctPD2 += topicItem.correct ?? 0;
      } else {
        pd3.add(topicItem);
        totalPD3 += topicItem.total ?? 0;
        correctPD3 += topicItem.correct ?? 0;
      }
    }
    if (totalPB == 0) {
      totalPB = 1;
    }
    if (totalPD2 == 0) {
      totalPD2 = 1;
    }
    if (totalPD3 == 0) {
      totalPD3 = 1;
    }
    return ListView(
      padding:
      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      children: [
        StatisticCardInfoWidget(
          theme: "Простое сложение и вычитание (ПСВ)",
          level: "Junior 1, Senior 1",
          percent: ((statistics[Constants.topics[0].json]
              ?.correct ??
              0) *
              100) /
              (statistics[Constants.topics[0].json]?.total ?? 1),
          progressIndicator: [
            StatisticThemeProgressIndicatorWidget(
              topic: Constants.topics[0].code,
              markEntity: statistics[Constants.topics[0].json] ??
                  MarkEntity(
                    topic: Constants.topics[0].json,
                    correct: 0,
                    incorrect: 0,
                    total: 0,
                  ),
            ),
          ],
        ),
        Gap(40.h),
        StatisticCardInfoWidget(
          theme: "Помощь брата",
          level: "Junior 1, Senior 1",
          percent: (correctPB * 100) / totalPB,
          progressIndicator: pb.map((e) {
            return StatisticThemeProgressIndicatorWidget(
              topic: e.topic?.substring(e.topic!.length - 2) ??
                  "Пусто",
              markEntity: e,
            );
          }).toList(),
        ),
        Gap(40.h),
        StatisticCardInfoWidget(
          theme: "Помощь друга сложение",
          level: "Junior 2, Senior 2",
          percent: (correctPD3 * 100) / totalPD3,
          progressIndicator: pd3.map((e) {
            return StatisticThemeProgressIndicatorWidget(
              topic: e.topic?.substring(e.topic!.length - 2) ??
                  "Пусто",
              markEntity: e,
            );
          }).toList(),
        ),
        Gap(40.h),
        StatisticCardInfoWidget(
          theme: "Помощь друга вычитание",
          level: "Junior 3, Senior 3",
          percent: (correctPD2 * 100) / totalPD2,
          progressIndicator: pd2.map((e) {
            return StatisticThemeProgressIndicatorWidget(
              topic: e.topic?.substring(e.topic!.length - 2) ??
                  "Пусто",
              markEntity: e,
            );
          }).toList(),
        ),
      ],
    );
  }
}
