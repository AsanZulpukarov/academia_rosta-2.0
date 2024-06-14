
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/error_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:academia_rosta_diplom/features/profile/data/datasources/remote/profile_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/get_my_statistic.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/get_student_statistic.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/bloc/my_statistic_bloc/my_statistic_bloc.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/pages/statistic_loaded_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentStatisticScreen extends StatelessWidget {
  final int studentId;
  final int subjectId;

  StudentStatisticScreen(
      {super.key, required this.studentId, required this.subjectId});

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
    return Scaffold(
      appBar: const MyAppBarSecond(
        title: "Статистика",
      ),
      body: BlocProvider.value(
        value: bloc
          ..add(
            StudentGroupStatisticEvent(
              studentId: studentId,
              subjectId: subjectId,
            ),
          ),
        child: BlocBuilder<MyStatisticBloc, MyStatisticState>(
          builder: (context, state) {
            if (state is MyStatisticErrorState) {
              return ErrorStateWidget(message: state.message);
            } else if (state is MyStatisticLoadingState) {
              return const LoadingStateWidget();
            } else if (state is MyStatisticLoadedState) {
              return StatisticLoadedScreen(
                statistics: state.statistics,
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}