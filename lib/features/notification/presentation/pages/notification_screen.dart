import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/notification/presentation/pages/notification_empty_screen.dart';
import 'package:academia_rosta_diplom/features/notification/presentation/widgets/notification_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../home/presentation/widgets/home/my_app_bar_second.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    bool isEmpty = true;
    return Scaffold(
      appBar: MyAppBarSecond(
        title: "Уведомления",
        action: IconButton(
          iconSize: 30,
          splashRadius: 20,
          onPressed: () {},
          icon: const Icon(
            Icons.check_circle,
            color: AppColors.secondaryColor,
          ),
        ),
      ),
      body: isEmpty
          ? ListView.separated(
              padding: const EdgeInsets.all(20),
              itemBuilder: (BuildContext context, int index) {
                return NotificationCardWidget(
                  isEven: index.isEven,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Gap(24);
              },
              itemCount: 5,
            )
          : NotificationEmptyScreen(),
    );
  }
}
