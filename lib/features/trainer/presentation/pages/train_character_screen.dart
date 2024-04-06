import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/pages/show_train_number.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/pages/show_train_number_screen.dart';
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: CharacterContainerWidget(
                    title: "Скорость",
                    numberCharacter: 1.00,
                    numberIncDec: 0.2,
                    isFixDigit: false,
                  ),
                ),
                Gap(30),
                Expanded(
                  child: CharacterContainerWidget(
                    title: "Разрядность",
                    numberCharacter: 1.0,
                    numberIncDec: 1.0,
                  ),
                ),
                Gap(30),
                Expanded(
                  child: CharacterContainerWidget(
                    title: "Количество\nпеременных",
                    numberCharacter: 1.0,
                    numberIncDec: 1.0,
                  ),
                ),
              ],
            ),
            Gap(10),
            ChooseCharacterThemeWidget(title: "Выбрать тему"),
            Gap(10),
            ShowTrainNumber(),
            Gap(20),
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
                        builder: (context) => ShowTrainNumberScreen()));
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
