import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';

class MyAppBarSecond extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBarSecond({Key? key, required this.title, this.action})
      : super(key: key);
  final String title;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        side: BorderSide(color: AppColors.white, width: 2),
      ),
      forceMaterialTransparency: true,
      centerTitle: true,
      leading: IconButton(
        splashRadius: 20,
        alignment: Alignment.center,
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title,
        style: AppTextStyles.black18Medium,
      ),
      actions: [
        action ?? SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
