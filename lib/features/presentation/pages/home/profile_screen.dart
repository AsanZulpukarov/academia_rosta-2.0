import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/home/profile_nav_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gap = 20;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Asan Zulpukarov",
            style: AppTextStyles.black26,
          ),
          Gap(gap),
          Text(
            "asanzulpukarov@gmail.com",
            style: AppTextStyles.black16Regular,
          ),
          Gap(gap),
          Text(
            "+996 990 551 380",
            style: AppTextStyles.black16Regular,
          ),
          Gap(40),
          ProfileNavItem(
            icon: '',
            title: 'Редактировать профиль',
            onTap: () {},
          ),
          Gap(gap),
          ProfileNavItem(
            icon: '',
            title: 'Изменить пароль',
            onTap: () {},
          ),
          Gap(gap),
          ProfileNavItem(
            icon: '',
            title: 'Моя статистика',
            onTap: () {},
          ),
          Gap(gap),
          ProfileNavItem(
            icon: '',
            title: 'Связатся с нами',
            onTap: () {},
          ),
          Gap(gap),
          ProfileNavItem(
            icon: '',
            title: 'О прилодении',
            onTap: () {},
          ),
          Gap(40),
          ProfileNavItem(
            icon: '',
            title: 'Выйти',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
