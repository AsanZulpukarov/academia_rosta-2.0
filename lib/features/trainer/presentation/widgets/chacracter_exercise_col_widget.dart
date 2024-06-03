import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/bloc/trainer_bloc/trainer_bloc.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/widgets/character_container_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CharacterExerciseWidget extends StatelessWidget {
  const CharacterExerciseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
              "Характеристики упражнения",
              style: AppTextStyles.black16Medium,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: CharacterContainerWidget(
                    title: "Скорость",
                    numberCharacter: state.exerciseTrainEntity.speed ?? 1.0,
                    numberIncDec: 0.2,
                    isFixDigit: false,
                    onChange: (double num) {
                      state.exerciseTrainEntity.speed = num;
                    },
                  ),
                ),
                Gap(20.h),
                Expanded(
                  child: CharacterContainerWidget(
                    title: "Разрядность",
                    numberCharacter:
                        state.exerciseTrainEntity.digitsCount?.toDouble() ??
                            1.0,
                    numberIncDec: 1.0,
                    onChange: (double num) {
                      state.exerciseTrainEntity.digitsCount = num.toInt();
                    },
                  ),
                ),
                Gap(20.h),
                Expanded(
                  child: CharacterContainerWidget(
                    title: "Количество\nпеременных",
                    numberCharacter:
                        state.exerciseTrainEntity.numberCount?.toDouble() ??
                            1.0,
                    numberIncDec: 1.0,
                    onChange: (double num) {
                      state.exerciseTrainEntity.numberCount = num.toInt();
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
