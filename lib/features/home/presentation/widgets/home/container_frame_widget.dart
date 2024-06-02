import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';

class ContainerFrameWidget extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Offset offset;
  final Color backgroundColor;
  final Color shadowColor;
  final double shadowColorOpacity;
  final double borderRadius;
  final EdgeInsets padding;
  final double? width;
  final double? height;
  final Alignment alignment;
  final double blurRadius;

  const ContainerFrameWidget({
    Key? key,
    required this.child,
    this.offset = const Offset(0, 0),
    this.backgroundColor = AppColors.white,
    this.onTap,
    this.shadowColor = AppColors.main,
    this.borderRadius = 20.0,
    this.padding = const EdgeInsets.all(20.0),
    this.shadowColorOpacity = 0.25,
    this.width,
    this.height,
    this.alignment = Alignment.center,
    this.blurRadius = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        alignment: alignment,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(shadowColorOpacity),
              blurRadius: blurRadius,
              offset: offset,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
