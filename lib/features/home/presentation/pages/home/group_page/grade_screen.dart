import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../trainer/presentation/pages/choose_theme_dialog.dart';

enum GradeType { homeWork, classWork, selfWork }

class GradeScreen extends StatefulWidget {
  const GradeScreen({Key? key}) : super(key: key);

  @override
  State<GradeScreen> createState() => _GradeScreenState();
}

class _GradeScreenState extends State<GradeScreen> {
  GradeType selectGradeType = GradeType.homeWork;

  String typeGrade = "ТипОценок";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarSecond(
        title: 'Оценки',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 180.h,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Оценки группы",
                    style: AppTextStyles.black18Medium.copyWith(
                      color: AppColors.main,
                    ),
                  ),
                  Gap(10),
                  Text(
                    "Тип оценки",
                    style: AppTextStyles.black16Medium,
                  ),
                  RadioMenuButton(
                    value: "Домашная работа",
                    groupValue: typeGrade,
                    onChanged: (String? value) {
                      setState(() {
                        selectGradeType = GradeType.homeWork;
                      });
                    },
                    child: Text(
                      "Домашная работа",
                      style: AppTextStyles.black16Medium,
                    ),
                  ),
                  RadioMenuButton(
                    value: "Классная работа",
                    groupValue: typeGrade,
                    onChanged: (String? value) {
                      setState(() {
                        selectGradeType = GradeType.classWork;
                      });
                    },
                    child: Text(
                      "Классная работа",
                      style: AppTextStyles.black16Medium,
                    ),
                  ),
                  RadioMenuButton(
                    value: "Самостоятельная работа",
                    groupValue: typeGrade,
                    onChanged: (String? value) {
                      setState(() {
                        selectGradeType = GradeType.selfWork;
                      });
                    },
                    child: Text(
                      "Самостоятельная работа",
                      style: AppTextStyles.black16Medium,
                    ),
                  ),
                ],
              ),
            ),
            Gap(20),
            GestureDetector(
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    contentPadding: const EdgeInsets.all(20),
                    scrollable: true,
                    title: const Text(
                      'Выберите тему',
                      style: AppTextStyles.black20,
                    ),
                    content: ChooseThemeDialog(),
                    actionsAlignment: MainAxisAlignment.spaceAround,
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Выбрать все'),
                        child: Text(
                          'Выбрать все',
                          style: AppTextStyles.black16
                              .copyWith(color: AppColors.main),
                        ),
                      ),
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
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Выбрать студентов',
                  style: AppTextStyles.black16.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            Gap(20),
            Text(
              "Выбрано студентов: 2",
              style: AppTextStyles.black14Medium,
            ),
            Gap(10),
            Divider(
              color: AppColors.main,
              height: 2,
              thickness: 2,
            ),
            Gap(10),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                double initialRating = 0;
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.25),
                        offset: Offset(0, 0),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Text(
                            "ФИО",
                            style: AppTextStyles.black16Medium,
                          )),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: RatingBar.builder(
                                initialRating: initialRating,
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemSize: 24,
                                itemBuilder: (context, index) => Icon(
                                  index < initialRating
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: AppColors.yellow,
                                ),
                                onRatingUpdate: (rating) {
                                  initialRating = rating;
                                },
                                unratedColor: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(4),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.main.withOpacity(0.6),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.main.withOpacity(0.6),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.main.withOpacity(0.6),
                            ),
                          ),
                          hintText: "Напишите тему или комментарий",
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          alignLabelWithHint: true,
                          labelText: "Комментарий",
                          filled: false,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Gap(20);
              },
              itemCount: 4,
            ),
          ],
        ),
      ),
    );
  }
}
