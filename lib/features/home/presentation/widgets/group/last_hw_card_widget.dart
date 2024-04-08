import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/title_description_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LastHWCardWidget extends StatelessWidget {
  const LastHWCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
          TitleDescriptionWhiteColorRowWidget(
            title: 'ФИО',
            description: "Асанбай Зулпукаров",
          ),
          Divider(),
          TitleDescriptionWhiteColorRowWidget(
            title: 'Дата создания',
            description: "09.09.2020",
          ),
          Divider(),
          TitleDescriptionWhiteColorRowWidget(
            title: 'Дата завершения',
            description: "10.10.2020",
          ),
          Divider(),
          TitleDescriptionWhiteColorRowWidget(
            title: 'Количество упражнений',
            description: "10",
          ),
          Gap(10),
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
}
