import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/exercise_entity.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/title_description_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LastExerciseCardWidget extends StatelessWidget {
  final ExerciseEntity exercise;

  const LastExerciseCardWidget({Key? key, required this.exercise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            AppColors.main.withOpacity(0.7),
            AppColors.main,
          ],
        ),
      ),
      child: Column(
        children: [
          _row2TitleAnd2Description(
            title1: "Тип",
            description1: exercise.type ?? "Пусто",
            title2: "Тема",
            description2: exercise.topic ?? "Пусто",
          ),
          const Divider(
            color: AppColors.white,
          ),
          _row2TitleAnd2Description(
            title1: "Скорость",
            description1: (exercise.speed ?? 0).toString(),
            title2: "Разрядность",
            description2: (exercise.digitsCount ?? 0).toString(),
          ),
          const Divider(
            color: AppColors.white,
          ),
          _row2TitleAnd2Description(
            title1: "Количество\nпеременных",
            description1: (exercise.numbersCount ?? 0).toString(),
            title2: "Количество\nпримеров",
            description2: (exercise.questionCount ?? 0).toString(),
          ),
          const Gap(20),
          MainButtonWidget(
            backgroundColor: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(20),
            child: Text(
              "Удалить",
              style: AppTextStyles.black14.copyWith(color: AppColors.white),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _row2TitleAnd2Description({
    required String title1,
    required String description1,
    required String title2,
    required String description2,
  }) {
    return Row(
      children: [
        Expanded(
          child: TitleDescriptionWhiteColorRowWidget(
            title: title1,
            description: description1,
            titleFlex: 4,
            descriptionFlex: 3,
            titleStyle: AppTextStyles.black12.copyWith(
              color: AppColors.white,
            ),
            descriptionStyle: AppTextStyles.black12.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Gap(30.w),
        Expanded(
          child: TitleDescriptionWhiteColorRowWidget(
            title: title2,
            description: description2,
            titleFlex: 4,
            descriptionFlex: 3,
            titleStyle: AppTextStyles.black12.copyWith(
              color: AppColors.white,
            ),
            descriptionStyle: AppTextStyles.black12.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
