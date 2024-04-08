import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/pages/show_train_number.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/pages/show_train_number_screen.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/widgets/chacracter_exercise_col_widget.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/widgets/character_container_widget.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/widgets/choose_character_theme_widget.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const CharacterExerciseWidget(),
            const Gap(10),
            const ChooseCharacterThemeWidget(),
            const Gap(10),
            const ShowTrainNumber(),
            const Gap(20),
            MainButtonWidget(
              borderRadius: BorderRadius.circular(20),
              width: 120.w,
              child: Text(
                'Начать',
                style: AppTextStyles.black16.copyWith(
                  color: AppColors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShowTrainNumberScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
  /*
  Widget _trainThemeContainer({required String title}) {
    return Flexible(
      child: DecoratedBox(
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.mainGradientColor,
              AppColors.white,
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
            AppTheme.boxShadow,
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: AppTextStyles.black12Medium.copyWith(
              fontSize: 12.sp,
            ),
          ),
          trailing: Container(
            width: 30.w,
            height: 30.h,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.blackOpacity65),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.blackOpacity65),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.blackOpacity65),
                ),
                contentPadding: EdgeInsets.zero,
                filled: false,
              ),
              style: TextStyle(color: AppColors.blackOpacity65),
              keyboardType: TextInputType.number,
            ),
          ),
        ),
      ),
    );
  }
  */
  /*

  Widget _characterGradient() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              _trainThemeContainer(title: "Скорость"),
              Gap(20),
              _trainThemeContainer(title: "Разрядность"),
            ],
          ),
          Gap(20),
          Row(
            children: [
              _trainThemeContainer(title: "Количество\nпеременных"),
              Gap(20),
              Flexible(
                child: GestureDetector(
                  onTap: () => showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      scrollable: true,
                      title: const Text(
                        'Выберите тему',
                        style: AppTextStyles.black20,
                      ),
                      content: ChooseThemeDialog(),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Выбрать'),
                          child: Text(
                            'Выбрать',
                            style: AppTextStyles.black16
                                .copyWith(color: AppColors.main),
                          ),
                        ),
                      ],
                    ),
                  ),
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.mainGradientColor, AppColors.white],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: [
                        AppTheme.boxShadow,
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        "Выбрать тему",
                        style: AppTextStyles.black12Medium.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                      trailing: Icon(
                        Icons.touch_app,
                        color: AppColors.blackOpacity65,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  */
}
