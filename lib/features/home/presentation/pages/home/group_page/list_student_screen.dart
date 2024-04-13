import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/student_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ListStudentScreen extends StatelessWidget {
  const ListStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 7,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StudentInfoScreen()));
          },
          child: Container(
            decoration: ShapeDecoration(
              shadows: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.5),
                  offset: Offset(4, 4),
                  blurRadius: 8,
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  AppColors.main.withOpacity(0.9),
                  AppColors.main,
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: ListTile(
              title: Text(
                "Asan Zulpukarov",
                style: AppTextStyles.black16Regular.copyWith(
                  color: AppColors.white,
                ),
              ),
              leading: Text(
                (index + 1).toString(),
                style: AppTextStyles.black16Regular.copyWith(
                  color: AppColors.white,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.white,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Gap(10);
      },
    );
  }
}
