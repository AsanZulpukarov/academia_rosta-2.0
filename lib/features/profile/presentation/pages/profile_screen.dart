import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/pages/change_password_screen.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/widgets/profile_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../app_theme.dart';
import 'about_app_screen.dart';
import 'contact_screen.dart';
import 'edit_profile_screen.dart';
import 'my_statistic_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gap = 10;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                ProfileAvatarItem(
                  image: 'man_3',
                  radius: 50,
                  backgroundColor: AppColors.white,
                ),
                Gap(10),
                Text(
                  "Asan Zulpukarov",
                  style: AppTextStyles.black16,
                ),
                Text(
                  "asanzulpukarov@gmail.com",
                  style: AppTextStyles.black12.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "+996 990 551 380",
                  style: AppTextStyles.black12.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Gap(20),
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
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyStatisticScreen()));
            },
          ),
          Gap(gap),
          ProfileNavItem(
            icon: Icons.email_outlined,
            title: 'Связаться с нами',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactScreen()));
            },
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
          Gap(gap),
          ProfileNavItem(
            icon: Icons.exit_to_app,
            title: 'Выйти',
            onTap: () async {
              await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: AppColors.white,
                  title: Text(
                    'Выйти из аккаунта?',
                    textAlign: TextAlign.center,
                  ),
                  content: Text(
                    'Вы действительно хотите выйти?',
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    Row(
                      children: [
                        Expanded(
                          child: MainButtonWidget(
                            borderRadius: BorderRadius.circular(20),
                            onPressed: () => Navigator.of(context).pop(true),
                            child: Text(
                              'Выйти',
                              style: AppTextStyles.black14.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                        Gap(20),
                        Expanded(
                          child: MainButtonWidget(
                            borderRadius: BorderRadius.circular(20),
                            onPressed: () => Navigator.of(context).pop(false),
                            backgroundColor: AppColors.grey,
                            child: const Text(
                              'Остаться',
                              style: AppTextStyles.black14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
