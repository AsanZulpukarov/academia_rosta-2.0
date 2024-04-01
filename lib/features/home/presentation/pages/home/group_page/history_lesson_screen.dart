import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/select_history_lesson_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/container_frame_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HistoryLessonScreen extends StatelessWidget {
  const HistoryLessonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarSecond(title: "История занятий"),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          return ContainerFrameWidget(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectHistoryLessonScreen()));
            },
            padding: const EdgeInsets.all(10),
            blurRadius: 8.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.access_time_rounded,
                  color: AppColors.black,
                  size: 30,
                ),
                Expanded(
                  child: Text(
                    "02.04.2024",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.black18Medium.copyWith(
                      color: AppColors.main,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Gap(20);
        },
        itemCount: 10,
      ),
    );
  }
}
