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
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: [
            BoxShadow(
              color: AppColors.main.withOpacity(0.46),
              blurRadius: 6,
              offset: Offset(0, 0),
              spreadRadius: 2,
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
          title: Text(title),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
