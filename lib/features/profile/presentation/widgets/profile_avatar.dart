import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileAvatar {
  static const String nameImage = "assets/images/avatars/";
  static const String extensionImage = ".png";
  static const List<String> listAvatars = [
    "boy_1",
    "boy_2",
    "boy_3",
    "girl_1",
    "girl_2",
    "girl_3",
    "man_1",
    "man_2",
    "man_3",
    "woman_1",
    "woman_2",
    "woman_3",
  ];
}

class ProfileAvatarItem extends StatelessWidget {
  const ProfileAvatarItem(
      {Key? key,
      required this.image,
      required this.radius,
      required this.backgroundColor})
      : super(key: key);
  final String image;
  final double radius;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + 4,
      backgroundColor: AppColors.main,
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(
            ProfileAvatar.nameImage + image + ProfileAvatar.extensionImage),
        backgroundColor: backgroundColor,
        // child: Image.asset(
        //   ProfileAvatar.nameImage + image + ProfileAvatar.extensionImage,
        //   alignment: Alignment.center,
        // ),
      ),
    );
  }
}
