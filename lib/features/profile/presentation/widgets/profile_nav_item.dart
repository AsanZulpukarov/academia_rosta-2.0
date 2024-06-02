import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileNavItem extends StatelessWidget {
  const ProfileNavItem(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);
  final IconData icon;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
            BoxShadow(
              color: AppColors.main.withOpacity(0.25),
              blurRadius: 8,
              offset: const Offset(4, 4),
            )
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.greySoftContainer,
            child: Icon(
              icon,
              color: AppColors.black,
            ),
          ),
          title: Text(
            title,
            style: AppTextStyles.black14,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.black,
            size: 20,
          ),
        ),
      ),
    );
  }
}
