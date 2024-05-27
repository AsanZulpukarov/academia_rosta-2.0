import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/constants.dart';
import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/notification/presentation/pages/notification_screen.dart';
import 'package:flutter/material.dart';

class MyAppBarMain extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBarMain({Key? key}) : super(key: key);

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
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
      actionsIconTheme: const IconThemeData(size: 30),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Привет",
            style: AppTextStyles.black20.copyWith(fontWeight: FontWeight.w400),
          ),
          Text(
            AppUtils.getGreeting(),
            style: AppTextStyles.black14.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.blackOpacity65,
            ),
          ),
        ],
      ),
      actions: [
        Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: IconButton(
                splashRadius: 20,
                icon: Icon(
                  Icons.notifications_outlined,
                  color: AppColors.blackOpacity65,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationScreen(),
                      ));
                },
              ),
            ),
            Positioned(
              right: 13,
              top: 17,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: AppColors.secondaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
