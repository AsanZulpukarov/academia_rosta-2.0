import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TitleDescriptionBlackColorRowWidget extends StatelessWidget {
  final String title;
  final String description;
  final TextAlign titleTextAlign;
  final TextAlign descriptionTextAlign;
  final TextStyle titleStyle;
  final TextStyle descriptionStyle;
  const TitleDescriptionBlackColorRowWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.titleStyle,
    required this.descriptionStyle,
    this.titleTextAlign = TextAlign.start,
    this.descriptionTextAlign = TextAlign.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            textAlign: titleTextAlign,
            style: titleStyle,
          ),
        ),
        Expanded(
          child: Text(
            description,
            textAlign: descriptionTextAlign,
            style: descriptionStyle,
          ),
        ),
      ],
    );
  }
}

class TitleDescriptionWhiteColorRowWidget extends StatelessWidget {
  final String title;
  final String description;
  final TextAlign titleTextAlign;
  final TextAlign descriptionTextAlign;
  final TextStyle titleStyle;
  final TextStyle descriptionStyle;
  final int titleFlex;
  final int descriptionFlex;
  const TitleDescriptionWhiteColorRowWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.titleStyle,
    required this.descriptionStyle ,
    this.titleTextAlign = TextAlign.start,
    this.descriptionTextAlign = TextAlign.end,
    this.titleFlex = 5,
    this.descriptionFlex = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: titleFlex,
          child: Text(
            title,
            textAlign: titleTextAlign,
            style: titleStyle.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          flex: descriptionFlex,
          child: Text(
            description,
            textAlign: descriptionTextAlign,
            style: descriptionStyle.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
