import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/data/models/subject_model.dart';
import 'package:academia_rosta_diplom/features/home/data/models/teacher_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

showBottomWindowTeacher(BuildContext context, TeacherModel teacherModel) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          height: 200.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Divider(
                color: AppColors.main,
                height: 1,
                thickness: 2,
                indent: 40,
                endIndent: 40,
              ),
              Gap(10.h),
              Text(
                "Информация об учителе",
                style: AppTextStyles.black16Medium,
                textAlign: TextAlign.center,
              ),
              Gap(40.h),
              _personInfo(
                title: "ФИО:",
                subtitle: teacherModel.getFullName(),
              ),
              Gap(20.h),
              _personInfo(
                title: "Номер тел:",
                subtitle: "${teacherModel.phoneNumber}",
              ),
            ],
          ),
        );
      });
}

showBottomWindowSubject(BuildContext context, SubjectModel subjectModel) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          height: 200.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Divider(
                color: AppColors.main,
                height: 1,
                thickness: 2,
                indent: 40,
                endIndent: 40,
              ),
              Gap(10.h),
              Text(
                "Информация о предмете",
                style: AppTextStyles.black16Medium,
                textAlign: TextAlign.center,
              ),
              Gap(40.h),
              _personInfo(
                title: "Название:",
                subtitle: "${subjectModel.name}",
              ),
              Gap(20.h),
              _personInfo(
                title: "Цена:",
                subtitle: "${subjectModel.cost}",
              ),
            ],
          ),
        );
      });
}

Widget _personInfo({required String title, required String subtitle}) {
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: Text(
          title,
          style: AppTextStyles.black14.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: Text(
          subtitle,
          style: AppTextStyles.black14.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ],
  );
}
