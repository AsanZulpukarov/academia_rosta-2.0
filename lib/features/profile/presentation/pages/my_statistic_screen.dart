import 'package:academia_rosta_diplom/constants.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/error_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:academia_rosta_diplom/features/profile/data/datasources/remote/profile_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/mark_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/get_my_statistic.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/bloc/my_statistic_bloc/my_statistic_bloc.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/widgets/statistic_card_info_widget.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/widgets/statistic_theme_progressIndicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MyStatisticScreen extends StatelessWidget {
  final int idSubject;

  const MyStatisticScreen({super.key, required this.idSubject});

  @override
  Widget build(BuildContext context) {
    final bloc = MyStatisticBloc(
      GetMyStatisticUseCase(
        ProfileRepositoryImpl(
          profileRemoteDataSource: ProfileRemoteDataSourceImpl(),
        ),
      ),
    );
    return BlocProvider.value(
      value: bloc
        ..add(
          MyStatisticEmptyEvent(
            id: idSubject,
          ),
        ),
      child: Scaffold(
        appBar: const MyAppBarSecond(
          title: "Моя статистика",
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            bloc.add(
              MyStatisticEmptyEvent(
                id: idSubject,
              ),
            );
          },
          child: BlocBuilder<MyStatisticBloc, MyStatisticState>(
            builder: (context, state) {
              if (state is MyStatisticLoadingState) {
                return const LoadingStateWidget();
              } else if (state is MyStatisticErrorState) {
                return ErrorStateWidget(message: state.message);
              } else if (state is MyStatisticLoadedState) {
                Map<String, MarkEntity> statistics = state.statistics;
                List<MarkEntity> pb = [];
                List<MarkEntity> pd2 = [];
                List<MarkEntity> pd3 = [];
                for (int i = 1; i < Constants.topics.length; i++) {
                  MarkEntity topicItem = statistics[Constants.topics[i].code] ??
                      MarkEntity(
                        topic: Constants.topics[i].code,
                        correct: 0,
                        incorrect: 0,
                        total: 0,
                      );
                  if (i < 9) {
                    pb.add(topicItem);
                  } else if (i % 2 == 0) {
                    pd2.add(topicItem);
                  } else {
                    pd3.add(topicItem);
                  }
                }
                print(statistics);
                return ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  children: [
                    StatisticCardInfoWidget(
                      theme: "Простое сложение и вычитание (ПСВ)",
                      level: "Junior 1, Senior 1",
                      percent: ((statistics[Constants.topics[0].code]?.correct ??
                              0) * 100) /
                          (statistics[Constants.topics[0].code]?.total ?? 1),
                      progressIndicator: [
                        StatisticThemeProgressIndicatorWidget(
                          topic: Constants.topics[0].code,
                          markEntity: statistics[Constants.topics[0].code] ??
                              MarkEntity(
                                topic: Constants.topics[0].code,
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
                      percent: (statistics["ПБ"]?.correct ?? 0 * 100) /
                          (statistics["ПБ"]?.total ?? 1),
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
                      theme: "Помощь друга",
                      level: "Junior 2, Senior 2",
                      percent: (statistics["ПБ"]?.correct ?? 0 * 100) /
                          (statistics["ПБ"]?.total ?? 1),
                      progressIndicator: pd2.map((e) {
                        return StatisticThemeProgressIndicatorWidget(
                          topic: e.topic?.substring(e.topic!.length - 2) ??
                              "Пусто",
                          markEntity: e,
                        );
                      }).toList(),
                    ),
                    Gap(40.h),
                    StatisticCardInfoWidget(
                      theme: "Помощь друга",
                      level: "Junior 3, Senior 3",
                      percent: (statistics["ПБ"]?.correct ?? 0 * 100) /
                          (statistics["ПБ"]?.total ?? 1),
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
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
