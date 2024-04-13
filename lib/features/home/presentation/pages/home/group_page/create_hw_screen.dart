import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/group/count_example_input_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/group/last_exercise_card_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/title_description_row_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/title_divider_column_widget.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/widgets/chacracter_exercise_col_widget.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/widgets/choose_character_theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateHWScreen extends StatelessWidget {
  const CreateHWScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarSecond(
        title: "Создание Д/З",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Column(
              children: [
                const TitleDescriptionBlackColorRowWidget(
                  title: "ФИО",
                  description: "Асан Зулпукаров",
                ),
                const Gap(20),
                const TitleDescriptionBlackColorRowWidget(
                  title: "Дата завершения",
                  description: "07.04.2002",
                ),
                const Gap(20),
                CharacterExerciseWidget(),
                const Gap(20),
                const Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ChooseCharacterThemeWidget(),
                    ),
                    Gap(20),
                    Expanded(
                      flex: 1,
                      child: CountExampleInputWidget(),
                    ),
                  ],
                ),
                const Gap(20),
                Row(
                  children: [
                    Expanded(
                      child: MainButtonWidget(
                        borderRadius: BorderRadius.circular(20),
                        child: Text(
                          "Создать как\nтест",
                          style: AppTextStyles.black14.copyWith(
                            color: AppColors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Gap(20),
                    Expanded(
                      child: MainButtonWidget(
                        borderRadius: BorderRadius.circular(20),
                        child: Text(
                          "Создать как\nтренажер",
                          style: AppTextStyles.black14.copyWith(
                            color: AppColors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Gap(20),
                TitleDividerColumnWidget(
                  title: "Прошлые упражнения",
                ),
              ],
            ),
            Gap(10),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return LastExerciseCardWidget();
              },
              separatorBuilder: (context, index) {
                return const Gap(10);
              },
              itemCount: 4,
            ),
          ],
        ),
      ),
    );
  }
}
