import 'package:academia_rosta_diplom/features/home/domain/entities/group/exercise_entity.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/group/student_hw/exercise_card_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AllExerciseStudentScreen extends StatelessWidget {
  const AllExerciseStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarSecond(
        title: "Упражнения",
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.h),
        itemBuilder: (context, index) {
          return const StudentExerciseCardWidget(
            exercise: ExerciseEntity(
              id: 1,
              correct: 1,
              digitsCount: 1,
              incorrect: 1,
              numbersCount: 1,
              questionCount: 1,
              solved: 1,
              speed: 1,
              topic: "Помощь брата +1",
              type: "Трен",
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Gap(10.h);
        },
        itemCount: 4,
      ),
    );
  }
}
