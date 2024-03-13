import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/data/api_source.dart';
import 'package:academia_rosta_diplom/features/presentation/pages/home/group_page/group_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiSource.getGroups(),
        builder: (context, snapshot) {
          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GroupInfoScreen()));
                },
                child: Container(
                  height: 120.h,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: ShapeDecoration(
                    shadows: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.5),
                        offset: Offset(4, 4),
                        blurRadius: 8,
                      ),
                    ],
                    // color: AppColors.main,
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        AppColors.main.withOpacity(0.7),
                        AppColors.main,
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Group Name",
                        style: AppTextStyles.black26.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Gap(10),
                      _groupInfoRow('Предмет', 'Математика'),
                      _groupInfoRow('Учитель', 'Асан Зулпукаров'),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Gap(20);
            },
          );
        });
  }

  Widget _groupInfoRow(String text1, String text2) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "$text1:",
            style: AppTextStyles.black16.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            text2,
            style: AppTextStyles.black14.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
