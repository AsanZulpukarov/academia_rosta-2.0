import 'package:academia_rosta_diplom/features/home/domain/entities/group/exercise_entity.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/exercise_bloc/exercise_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/group/last_exercise_card_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/error_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HWItemExercisesScreen extends StatelessWidget {
  const HWItemExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarSecond(title: 'Упражнения'),
      body: BlocBuilder<ExerciseBloc, ExerciseState>(
        builder: (context, state) {
          if(state is ExerciseErrorState){
            return const LoadingStateWidget();
          }
          else if(state is ExerciseErrorState){
            return ErrorStateWidget(message: state.message);
          }
          else if(state is ExerciseLoadedState){
            final List<ExerciseEntity> exercises = state.exercise;
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            itemBuilder: (context, index) {
              return LastExerciseCardWidget(exercise: exercises[index],);
            },
            separatorBuilder: (context, index) {
              return const Gap(10);
            },
            itemCount: exercises.length,
          );}
          return const SizedBox();
        },
      ),
    );
  }
}
