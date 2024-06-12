import 'package:academia_rosta_diplom/features/home/domain/entities/group/hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/student_hw/all_exercise_student_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/group/student_hw/hw_card_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AllHWStudentScreen extends StatelessWidget {
  const AllHWStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarSecond(
        title: "Домашние задания",
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.h),
        itemBuilder: (context, index) {
          return StudentHWCardWidget(
            fio: "Asan Zulpukarov",
            hw: HWEntity(
              id: 1,
              createDate: DateTime.now(),
              deadline: DateTime.now(),
              exercisesCount: 1,
            ),
            onDelete: () {

            },
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
