import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';

class MainButtonWidget extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final Color backgroundColor;
  final EdgeInsets padding;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final Function()? onPressed;

  const MainButtonWidget({
    super.key,
    required this.child,
    required this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor = AppColors.main,
    this.padding = const EdgeInsets.all(10),
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: padding,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
            border: border,
          ),
          child: child,
        ),
      ),
    );
  }
}
