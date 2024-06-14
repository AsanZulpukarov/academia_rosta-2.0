import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/features/home/data/datasources/remote/group_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/home/data/repositories/group_repository_impl.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/exercise_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_exercise_by_hw_id.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/exercise_bloc/exercise_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/group/student_hw/exercise_card_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/error_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AllExerciseStudentScreen extends StatelessWidget {
  final int id;

  const AllExerciseStudentScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExerciseBloc(
        GetExerciseByHWIdUseCase(
          GroupRepositoryImpl(
            remoteGroupDataSource: GroupRemoteDataSourceImpl(),
          ),
        ),
      )..add(ExerciseGetEvent(id: id)),
      child: Scaffold(
        appBar: const MyAppBarSecond(
          title: "Упражнения",
        ),
        body: BlocBuilder<ExerciseBloc, ExerciseState>(
          builder: (context, state) {
            if (state is ExerciseLoadingState) {
              return const LoadingStateWidget();
            } else if (state is ExerciseErrorState) {
              return ErrorStateWidget(message: state.message);
            } else if (state is ExerciseLoadedState) {
              if(state.exercise.isEmpty){
                return Center(child: Text("Нет упражнений",style: AppTextStyles.black14,));
              }
              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.h),
                itemBuilder: (context, index) {
                  return StudentExerciseCardWidget(
                    exercise: state.exercise[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return Gap(10.h);
                },
                itemCount: state.exercise.length,
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
