import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseStudentsDialog extends StatefulWidget {
  const ChooseStudentsDialog({Key? key}) : super(key: key);

  @override
  State<ChooseStudentsDialog> createState() => _ChooseStudentsDialogState();
}

class _ChooseStudentsDialogState extends State<ChooseStudentsDialog> {
  int selectIndex = 1;

  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360.h,
      width: 300.w,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                isSelect = !isSelect;
              });
            },
            child: ListTile(
              title: Text(
                "ФИО",
                style: AppTextStyles.black16,
              ),
              trailing: Icon(
                Icons.check_circle,
                color: isSelect == true ? AppColors.blue : AppColors.grey,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 2.5,
          );
        },
      ),
    );
  }
}
