import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TitleDividerColumnWidget extends StatelessWidget {
  final String title;
  final Color lineColor;
  final double heightLine;
  final double thicknessLine;
  final double gap;

  const TitleDividerColumnWidget({
    Key? key,
    required this.title,
    this.lineColor = AppColors.main,
    this.heightLine = 2,
    this.thicknessLine = 2,
    this.gap = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.black16Medium,
        ),
        Gap(gap),
        Divider(
          color: lineColor,
          height: heightLine,
          thickness: thicknessLine,
        ),
      ],
    );
  }
}
