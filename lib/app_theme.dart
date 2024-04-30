import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text_styles.dart';

class AppColors {
  static const Color main = Color.fromRGBO(75, 73, 172, 1); //Color(0xFF3456FB);
  static const Color customButton = main; // Color(0xffFFB951);
  static const Color mainColor = main; // Color(0xFFFFB951);
  static const Color secondaryColor = Color.fromRGBO(241, 94, 49, 1);
  static const Color customText = Colors.black;
  static const Color filColor = Color(0xffEDEDEF);
  static const Color white = Colors.white;
  static const Color blue = Color(0xFF3D8BFF);
  static const Color black = Colors.black;
  static const Color yellow = Colors.yellow;
  static Color blackOpacity65 = AppColors.black.withOpacity(0.65);
  static const Color pink = Colors.pink;
  static const Color bgColor = Color(0xFFFFFFFF);
  static const Color mainBlack = Colors.black;
  static const Color secondBlack = Color(0xFF1C1C1C);
  static const Color mainRed = Color(0xFFFF0000);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color secondBlue = Color(0xFF6DA8FF);
  static const Color dateColor = Color(0xFF989898);
  static const Color historyGrey = Color(0xFFC7C7C7);
  static const Color divider = Color(0xFFDDDDDD);
  static const Color menuNoSelected = Color(0xFFEFEFEF);
  static const Color menuDivider = Color(0xFF808080);
  static const Color tarifDivider = Color(0xFFDADADA);
  static const Color greySoftContainer = Color(0xFFF4F4F4);
  static const Color backgroundColor = Color(0xFFFFA564);
  static const Color orangeButtonBackground = Color(0xFFF8DFCC);
  static const Color pinkBorder = Color(0xFfFF8B8B);
  static const Color borderColor = Color.fromRGBO(89, 88, 88, 1);
  static const Color mainGradientColor = Color(0xE84B8EDC);
  static const Color transparent = Colors.transparent;
  static const Color green = Colors.green;
}

class AppTheme {
  static const BoxShadow boxShadow = BoxShadow(
    color: Color.fromRGBO(30, 32, 37, 0.08),
    offset: Offset(0, 1.5),
    blurRadius: 0,
    spreadRadius: 0,
    blurStyle: BlurStyle.inner,
  );
  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.mainColor,
    scaffoldBackgroundColor: AppColors.bgColor,
    useMaterial3: false,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.mainColor,
      secondary: AppColors.secondaryColor,
      onPrimary: AppColors.white,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.white,
      unselectedLabelColor: AppColors.grey,
      labelStyle: AppTextStyles.black18Semibold
          .copyWith(fontSize: 16.sp, color: AppColors.white),
      unselectedLabelStyle: AppTextStyles.black18Semibold
          .copyWith(fontSize: 16.sp, color: AppColors.grey),
    ),
    dialogTheme: const DialogTheme(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)))),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 0,
      titleTextStyle: AppTextStyles.black18Semibold,
      titleSpacing: 0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(
        color: AppColors.black,
        size: 26,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        elevation: 0,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.filColor,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
    ),
    fontFamily: 'Gilroy',
  );
}
