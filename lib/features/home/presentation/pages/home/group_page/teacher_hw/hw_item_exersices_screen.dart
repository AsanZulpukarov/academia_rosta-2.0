import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/exercise_entity.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/exercise_bloc/exercise_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/teacher_hw/create_exercise_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/group/teacher_hw/last_exercise_card_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/error_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  "Добавить упражнение",
                  style: AppTextStyles.black14,
                  textAlign: TextAlign.center,
                ),
                Gap(10.h),
                MainButtonWidget(
                  width: 180.w,
                  borderRadius: BorderRadius.circular(20),
                  child: Text(
                    'Добавить',
                    style: AppTextStyles.black14.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateExerciseScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            BlocBuilder<ExerciseBloc, ExerciseState>(
              builder: (context, state) {
                if (state is ExerciseErrorState) {
                  return const LoadingStateWidget();
                } else if (state is ExerciseErrorState) {
                  return ErrorStateWidget(message: state.message);
                } else if (state is ExerciseLoadedState) {
                  final List<ExerciseEntity> exercises = state.exercise;
                  return ListView.separated(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return LastExerciseCardWidget(
                        exercise: exercises[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Gap(10.h);
                    },
                    itemCount: exercises.length,
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
