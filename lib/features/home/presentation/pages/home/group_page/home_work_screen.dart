import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/create_hw_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/group/last_hw_card_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/container_frame_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/title_divider_column_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeWorkScreen extends StatelessWidget {
  const HomeWorkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarSecond(
        title: "Домашнее задание",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "Выберите дату завершения",
                    style: AppTextStyles.black14,
                  ),
                  Gap(4),
                  ContainerFrameWidget(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(
                            DateTime.now().year, DateTime.now().month + 2),
                        locale: Locale("ru"),
                      );
                    },
                    width: 180.w,
                    offset: const Offset(4, 4),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: AppColors.black,
                        ),
                        Text(
                          "09.06.2001",
                          style: AppTextStyles.black16Regular,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(20),
            ContainerFrameWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ФИО",
                    style: AppTextStyles.black18Medium.copyWith(
                      color: AppColors.main,
                    ),
                  ),
                  Gap(20),
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Text(
                                "Asan Zulpukarov",
                                style: AppTextStyles.black16Medium,
                              )),
                          Expanded(
                            flex: 1,
                            child: MainButtonWidget(
                              borderRadius: BorderRadius.circular(20),
                              child: Text(
                                "Создать",
                                style: AppTextStyles.black12.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreateHWScreen()));
                              },
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: AppColors.main,
                      );
                    },
                    itemCount: 5,
                  ),
                ],
              ),
            ),
            Gap(20),
            TitleDividerColumnWidget(
              title: "Прошлые домашние занятия",
            ),
            Gap(20),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const LastHWCardWidget();
              },
              separatorBuilder: (context, index) {
                return const Gap(10);
              },
              itemCount: 4,
            ),
          ],
        ),
      ),
    );
  }
}
