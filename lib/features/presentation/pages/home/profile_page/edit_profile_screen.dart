import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../app_theme.dart';
import '../../../widgets/home/my_app_bar_second.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarSecond(
        title: "Редактировать профиль",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titleAndField(title: "Фамилия"),
              Gap(10),
              _titleAndField(title: "Имя"),
              Gap(10),
              _titleAndField(title: "Логин"),
              Gap(10),
              _titleAndField(title: "Email"),
              Gap(10),
              _titleAndField(title: "Телефон номер"),
              Gap(40),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Сохранить',
                      style: AppTextStyles.black16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleAndField({
    required String title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            title,
            style: AppTextStyles.black16Regular,
          ),
        ),
        Gap(6),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: AppColors.main,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: AppColors.main,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: AppColors.main,
                width: 1,
              ),
            ),
            filled: false,
          ),
          style: AppTextStyles.black14Medium.copyWith(
            fontWeight: FontWeight.normal,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
