import 'package:academia_rosta_diplom/constants.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/error_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:academia_rosta_diplom/features/profile/data/datasources/remote/profile_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/mark_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/get_my_statistic.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/get_student_statistic.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/bloc/my_statistic_bloc/my_statistic_bloc.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/pages/statistic_loaded_screen.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/widgets/statistic_card_info_widget.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/widgets/statistic_theme_progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MyStatisticScreen extends StatelessWidget {
  final int idSubject;

  MyStatisticScreen({
    super.key,
    required this.idSubject,
  });

  final bloc = MyStatisticBloc(
    GetMyStatisticUseCase(
      ProfileRepositoryImpl(
        profileRemoteDataSource: ProfileRemoteDataSourceImpl(),
      ),
    ),
    GetStudentStatisticUseCase(
      ProfileRepositoryImpl(
        profileRemoteDataSource: ProfileRemoteDataSourceImpl(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
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
                return StatisticLoadedScreen(statistics: state.statistics);
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
