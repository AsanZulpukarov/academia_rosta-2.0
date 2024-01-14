import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../app_theme.dart';

class TrainScreen extends StatelessWidget {
  const TrainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String number = "123";
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
                          child: DecoratedBox(
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
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
                            ),
                            child: ListTile(
                              title: Text(
                                "Выбрать тему",
                                style: AppTextStyles.black14Medium,
                              ),
                              trailing: Icon(
                                Icons.touch_app,
                                color: AppColors.borderColor,
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
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 360,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                number,
                style: AppTextStyles.black20Bold
                    .copyWith(fontSize: (46 - number.length).sp),
              ),
            ),
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
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.mainGradientColor, AppColors.white],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: ListTile(
          title: Text(
            title,
            style: AppTextStyles.black14Medium,
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
