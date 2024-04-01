import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../app_text_styles.dart';
import '../../../../../app_theme.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarSecond(
        title: 'Изменить пароль',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titleAndField(title: "Текущий пароль"),
              Gap(10),
              _titleAndField(title: "Новый пароль"),
              Gap(10),
              _titleAndField(title: "Потверждение пароля"),
              Gap(40),
              MainButtonWidget(
                onPressed: () {},
                borderRadius: BorderRadius.circular(20),
                child: Text(
                  'Сохранить',
                  style: AppTextStyles.black16.copyWith(
                    color: AppColors.white,
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
          obscuringCharacter: "*",
          obscureText: true,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              splashRadius: 20,
              onPressed: () {},
              icon: Icon(
                Icons.visibility,
                color: AppColors.black,
              ),
            ),
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
