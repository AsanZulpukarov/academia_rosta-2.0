import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/presentation/pages/home/group_page/group_info.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: 5,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => GroupInfo()));
          },
          child: Container(
            height: 140,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: ShapeDecoration(
              shadows: [
                AppTheme.boxShadow,
              ],
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.mainGradientColor, AppColors.white],
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
                    color: AppColors.blackOpacity65,
                  ),
                ),
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
  }

  Widget _groupInfoRow(String text1, String text2) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "$text1:",
            style: AppTextStyles.black14.copyWith(
              color: AppColors.blackOpacity65,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            text2,
            style: AppTextStyles.black16.copyWith(
                color: AppColors.blackOpacity65, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
