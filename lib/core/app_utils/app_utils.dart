import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static DateFormat dateFormat = DateFormat('dd.MM.yyyy');
  static DateFormat time = DateFormat('HH:mm');

  static getFormattedDate({
    required DateTime dateTime,
    bool withYearLabel = false,
    bool withHour = false,
    String yearLabel = 'г',
  }) {
    if (withYearLabel) {
      if (withHour) {
        return '${dateFormat.format(dateTime)}$yearLabel ${time.format(dateTime)}';
      } else {
        return dateFormat.format(dateTime) + yearLabel;
      }
    } else {
      if (withHour) {
        return '${dateFormat.format(dateTime)} ${time.format(dateTime)}';
      } else {
        return dateFormat.format(dateTime);
      }
    }
  }

  static toDoceDate({
    required DateTime? dateTime,
  }) {
    if (dateTime == null) return null;

    final format = DateFormat('yyyy-MM-ddTHH:mm:ss', 'en-US');
    return format.format(dateTime);
  }

  static fromDoceDate({
    required String? dateTime,
  }) {
    if (dateTime == null) return null;

    final format = DateFormat('yyyy-MM-ddTHH:mm:ssZ', 'en-US');
    return format.parse(dateTime);
  }

  static getDateTimeWithSeparator({
    required DateTime dateTime,
    String separator = ', ',
  }) {
    return dateFormat.format(dateTime) + separator + time.format(dateTime);
  }

  static showSnackBar({
    required BuildContext context,
    String title = "Ошибка",
    required String description,
    Duration duration = const Duration(seconds: 2),
    Color backgroundColor = AppColors.mainColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppTextStyles.black14Extrabold.copyWith(
                color: AppColors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              description,
              style:
                  AppTextStyles.black16Regular.copyWith(color: AppColors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  static String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Ошибка сервера";
      case InternetFailure:
        return "Интернет не работает";
      default:
        return 'Неизвестная ошибка';
    }
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите логин';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите пароль';
    } else if (value.length > 5) {
      return "Пароль должен быть не менее 6 символов";
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Введите пароль повторно';
    }
    if (value != password) {
      return 'Пароли не совпадают';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите E-mail';
    }
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Введите корректный E-mail';
    }
    return null;
  }

  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите имя';
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите фамилию';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите номер телефона';
    }
    return null;
  }

  static String? validateBranch(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите название филиала';
    }
    return null;
  }

  static String? validateBirthDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите дату рождения';
    }
    return null;
  }
}
