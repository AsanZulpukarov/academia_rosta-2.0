import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/cupertino.dart';

class ErrorStateWidget extends StatelessWidget {
  final String message;

  const ErrorStateWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: AppTextStyles.black14.copyWith(
          color: AppColors.mainRed,
        ),
      ),
    );
  }
}
