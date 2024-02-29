import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/features/presentation/pages/home/profile_page/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../app_theme.dart';
import '../../../widgets/home/profile_avatar.dart';
import '../../../widgets/home/profile_nav_item.dart';
import 'about_app_screen.dart';
import 'contact_screen.dart';
import 'edit_profile_screen.dart';
import 'my_statistic_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gap = 20;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                ProfileAvatarItem(
                  image: 'man_3',
                  radius: 60,
                  backgroundColor: AppColors.white,
                ),
                Gap(10),
                Text(
                  "Asan Zulpukarov",
                  style: AppTextStyles.black20,
                ),
                Text(
                  "asanzulpukarov@gmail.com",
                  style: AppTextStyles.black14,
                ),
                Text(
                  "+996 990 551 380",
                  style: AppTextStyles.black14,
                ),
              ],
            ),
          ),
          Gap(30),
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
                        Gap(10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: Text('Выйти'),
                          ),
                        ),
                        Gap(20),
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(AppColors.grey),
                            ),
                            onPressed: () => Navigator.of(context).pop(false),
                            child: Text(
                              'Остаться',
                              style: AppTextStyles.black14,
                            ),
                          ),
                        ),
                        Gap(10),
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
