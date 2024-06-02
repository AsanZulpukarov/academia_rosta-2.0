import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/group/count_example_input_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/title_description_row_widget.dart';
import 'package:academia_rosta_diplom/features/trainer/data/datasources/local/trainer_local_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/trainer/data/datasources/remote/trainer_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/trainer/data/repositories/trainer_repository_impl.dart';
import 'package:academia_rosta_diplom/features/trainer/domain/usecases/get_numbers.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/bloc/trainer_bloc/trainer_bloc.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/widgets/chacracter_exercise_col_widget.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/widgets/choose_character_theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CreateHWScreen extends StatelessWidget {
  const CreateHWScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarSecond(
        title: "Создание Д/З",
      ),
      body: BlocProvider(
        create: (context) => TrainerBloc(
          getNumbersUseCase: GetNumbersUseCase(
            TrainerRepositoryImpl(
              trainerLocalDataSource: TrainerLocalDataSourceImpl(),
              trainerRemoteDataSource: TrainerRemoteDataSourceImpl(),
            ),
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            children: [
              Column(
                children: [
                  TitleDescriptionBlackColorRowWidget(
                    titleStyle: AppTextStyles.black16,
                    descriptionStyle: AppTextStyles.black16,
                    title: "ФИО",
                    description: "Асан Зулпукаров",
                  ),
                  Gap(20.h),
                  TitleDescriptionBlackColorRowWidget(
                    titleStyle: AppTextStyles.black16,
                    descriptionStyle: AppTextStyles.black16,
                    title: "Дата завершения",
                    description: "07.04.2002",
                  ),
                  Gap(20.h),
                  const CharacterExerciseWidget(),
                  Gap(20.h),
                  Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: ChooseCharacterThemeWidget(),
                      ),
                      Gap(20.h),
                      const Expanded(
                        flex: 1,
                        child: CountExampleInputWidget(),
                      ),
                    ],
                  ),
                  Gap(20.h),
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
                      Gap(20.h),
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
                  Gap(20.h),
                ],
              ),
              Gap(10.h),
            ],
          ),
        ),
      ),
    );
  }
}
