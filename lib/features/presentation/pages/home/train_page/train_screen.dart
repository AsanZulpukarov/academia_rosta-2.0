import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/features/presentation/pages/home/train_page/choose_theme_dialog.dart';
import 'package:academia_rosta_diplom/features/presentation/pages/home/train_page/show_train_number.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../app_theme.dart';

class TrainScreen extends StatefulWidget {
  const TrainScreen({Key? key}) : super(key: key);

  @override
  State<TrainScreen> createState() => _TrainScreenState();
}

class _TrainScreenState extends State<TrainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
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
                                  onPressed: () =>
                                      Navigator.pop(context, 'Выбрать'),
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
                                colors: [
                                  AppColors.mainGradientColor,
                                  AppColors.white
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
            ),
            Gap(30),
            ShowTrainNumber(),
            Gap(30),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 100,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Начать',
                  style: AppTextStyles.black16.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
}
