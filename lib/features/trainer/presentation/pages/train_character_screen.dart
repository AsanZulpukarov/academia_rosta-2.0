import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/pages/choose_theme_dialog.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/pages/show_train_number.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/pages/show_train_number_screen.dart';
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
  final List<String> _list = [
    'One',
    'Two',
    'Three',
    'Four',
  ];
  String? _dropdownValue = "One";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: _containerCharacter(title: "Скорость"),
                ),
                Gap(30),
                Expanded(
                  child: _containerCharacter(title: "Разрядность"),
                ),
                Gap(30),
                Expanded(
                  child: _containerCharacter(title: "Количество\nпеременных"),
                ),
              ],
            ),
            Gap(10),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Выбрать тему:"),
                  Gap(10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.black),
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      value: _dropdownValue,
                      onChanged: (String? value) {
                        setState(() {
                          _dropdownValue = value!;
                        });
                      },
                      items:
                          _list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                      menuMaxHeight: 240,
                    ),
                  ),
                ],
              ),
            ),
            Gap(10),
            ShowTrainNumber(),
            Gap(20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowTrainNumberScreen()));
              },
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

  Widget _containerCharacter({required String title}) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.black14.copyWith(fontSize: 15),
        ),
        Gap(10),
        Container(
          height: 100,
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.black,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Center(
                  child: Text(
                    "1.00",
                    style: AppTextStyles.black26,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.main,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,
                      color: AppColors.black,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      VerticalDivider(
                        color: AppColors.black,
                        width: 1,
                        thickness: 1,
                      ),
                      Expanded(
                        child: IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: AppColors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
