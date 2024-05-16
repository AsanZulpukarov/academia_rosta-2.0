import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/data/models/subject_model.dart';
import 'package:academia_rosta_diplom/features/home/data/models/teacher_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

showBottomWindowTeacher(BuildContext context, TeacherModel teacherModel) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height / 3.5,
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
              const Gap(10),
              Text(
                "Информация об учителе",
                style: AppTextStyles.black16Medium,
                textAlign: TextAlign.center,
              ),
              const Gap(40),
              _personInfo(
                title: "ФИО:",
                subtitle: teacherModel.getFullName(),
              ),
              const Gap(20),
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height / 3.5,
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
              const Gap(10),
              Text(
                "Информация о предмете",
                style: AppTextStyles.black16Medium,
                textAlign: TextAlign.center,
              ),
              const Gap(40),
              _personInfo(
                title: "Название:",
                subtitle: "${subjectModel.name}",
              ),
              const Gap(20),
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
