import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/trainer/data/datasources/local/trainer_local_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/trainer/data/datasources/remote/trainer_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/trainer/data/repositories/trainer_repository_impl.dart';
import 'package:academia_rosta_diplom/features/trainer/domain/usecases/get_numbers.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/bloc/trainer_bloc/trainer_bloc.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/pages/show_train_number_screen.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/widgets/chacracter_exercise_col_widget.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/widgets/choose_character_theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../app_theme.dart';

class TrainCharacterScreen extends StatefulWidget {
  const TrainCharacterScreen({Key? key}) : super(key: key);

  @override
  State<TrainCharacterScreen> createState() => _TrainCharacterScreenState();
}

class _TrainCharacterScreenState extends State<TrainCharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrainerBloc(
        getNumbersUseCase: GetNumbersUseCase(
          TrainerRepositoryImpl(
            trainerLocalDataSource: TrainerLocalDataSourceImpl(),
            trainerRemoteDataSource: TrainerRemoteDataSourceImpl(),
          ),
        ),
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CharacterExerciseWidget(),
              Gap(10.h),
              const ChooseCharacterThemeWidget(),
              // const Gap(10),
              // const ShowTrainNumber(),
              const Gap(20),
              BlocConsumer<TrainerBloc, TrainerState>(
                listener: (context, state) {
                  if (state is TrainerErrorState) {
                    AppUtils.showSnackBar(
                      context: context,
                      description: state.message,
                    );
                  } else if (state is TrainerLoadedState) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowTrainNumberScreen(
                          list: state.numbers,
                          speed: state.exerciseTrainEntity.speed ?? 1.0,
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is TrainerLoadingState) {
                    return const LoadingStateWidget();
                  }
                  return MainButtonWidget(
                    borderRadius: BorderRadius.circular(20),
                    width: 120.w,
                    child: Text(
                      'Начать',
                      style: AppTextStyles.black16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    onPressed: () {
                      BlocProvider.of<TrainerBloc>(context)
                          .add(TrainerSelectThemeEvent());

                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
