import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/profile_avatar.dart';

class ChoosePhotoDialog extends StatefulWidget {
  final int currentPhotoIndex;
  final Color selectBackgroundColor;
  final Color backgroundColor;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double radius;
  const ChoosePhotoDialog({
    Key? key,
    required this.currentPhotoIndex,
    this.backgroundColor = AppColors.white,
    this.radius = 60,
    this.selectBackgroundColor = AppColors.main,
    this.crossAxisCount = 3,
    this.mainAxisSpacing = 10.0,
    this.crossAxisSpacing = 10.0,
  }) : super(key: key);

  @override
  State<ChoosePhotoDialog> createState() => _ChoosePhotoDialogState();
}

class _ChoosePhotoDialogState extends State<ChoosePhotoDialog> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width.w,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: ProfileAvatar.listAvatars.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount,
          mainAxisSpacing: widget.mainAxisSpacing,
          crossAxisSpacing: widget.crossAxisSpacing,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _currentIndex != index
                    ? widget.backgroundColor
                    : widget.selectBackgroundColor,
              ),
              child: ProfileAvatarItem(
                image: ProfileAvatar.listAvatars.elementAt(index),
                radius: widget.radius,
                backgroundColor: _currentIndex != index
                    ? widget.backgroundColor
                    : widget.selectBackgroundColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
