import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/title_description_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LastExerciseCardWidget extends StatelessWidget {
  const LastExerciseCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            description1: "Тренажер",
            title2: "Тема",
            description2: "Пд +4",
          ),
          Divider(),
          _row2TitleAnd2Description(
            title1: "Скорость",
            description1: "2",
            title2: "Разрядность",
            description2: "2",
          ),
          Divider(),
          _row2TitleAnd2Description(
            title1: "Количество\nпеременных",
            description1: "2",
            title2: "Количество\nпримеров",
            description2: "4",
          ),
          Gap(20),
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
        Gap(10),
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
