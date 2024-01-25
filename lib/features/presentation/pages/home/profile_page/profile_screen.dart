import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/features/presentation/pages/home/profile_page/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../widgets/home/profile_nav_item.dart';
import 'about_app_screen.dart';
import 'edit_profile_screen.dart';

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
          Gap(10),
          Text(
            "asanzulpukarov@gmail.com",
            style: AppTextStyles.black16Regular,
          ),
          Gap(10),
          Text(
            "+996 990 551 380",
            style: AppTextStyles.black16Regular,
          ),
          Gap(40),
          ProfileNavItem(
            icon: Icons.person_outline,
            title: 'Редактировать профиль',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()));
            },
          ),
          Gap(gap),
          ProfileNavItem(
            icon: Icons.password_outlined,
            title: 'Изменить пароль',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangePasswordScreen()));
            },
          ),
          Gap(gap),
          ProfileNavItem(
            icon: Icons.bar_chart_outlined,
            title: 'Моя статистика',
            onTap: () {},
          ),
          Gap(gap),
          ProfileNavItem(
            icon: Icons.email_outlined,
            title: 'Связаться с нами',
            onTap: () {},
          ),
          Gap(gap),
          ProfileNavItem(
            icon: Icons.info_outline,
            title: 'О приложении',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutAppScreen()));
            },
          ),
          Gap(40),
          ProfileNavItem(
            icon: Icons.exit_to_app,
            title: 'Выйти',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
