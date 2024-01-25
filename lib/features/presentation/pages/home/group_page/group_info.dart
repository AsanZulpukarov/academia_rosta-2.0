import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../app_text_styles.dart';
import '../../../widgets/home/my_app_bar_second.dart';

class GroupInfo extends StatelessWidget {
  const GroupInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarSecond(
        title: "Название группы",
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 300,
              color: AppColors.customButton,
              child: Text("group info"),
            ),
            Gap(20),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.secondaryColor.withOpacity(0.5),
                    AppColors.white,
                  ],
                ),
                boxShadow: const [
                  AppTheme.boxShadow,
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                title: Text(
                  "Студенты",
                  style: AppTextStyles.black16Regular,
                ),
                leading: Text(
                  "№",
                  style: AppTextStyles.black16Regular,
                ),
              ),
            ),
            Gap(10),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 7,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.main.withOpacity(0.5),
                        AppColors.white,
                      ],
                    ),
                    boxShadow: const [
                      AppTheme.boxShadow,
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    title: Text(
                      "Asan Zulpukarov",
                      style: AppTextStyles.black16Regular
                          .copyWith(color: AppColors.blackOpacity65),
                    ),
                    leading: Text(
                      (index + 1).toString(),
                      style: AppTextStyles.black16Regular
                          .copyWith(color: AppColors.blackOpacity65),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.blackOpacity65,
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Gap(10);
              },
            ),
          ],
        ),
      ),
    );
  }
}
