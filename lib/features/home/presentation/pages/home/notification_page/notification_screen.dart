import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../widgets/home/my_app_bar_second.dart';
import 'notification_info_screen.dart';

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
          splashRadius: 20,
          onPressed: () {},
          icon: const Icon(
            Icons.check_circle_outline,
            color: AppColors.black,
          ),
        ),
      ),
      body: isEmpty
          ? ListView.separated(
              padding: const EdgeInsets.all(20),
              itemBuilder: (BuildContext context, int index) {
                bool isEven = index.isEven;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationInfoScreen()));
                  },
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          height: 76.h,
                          decoration: ShapeDecoration(
                            color: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadows: [
                              BoxShadow(
                                color: isEven
                                    ? AppColors.main.withOpacity(0.46)
                                    : AppColors.main.withOpacity(0.3),
                                blurRadius: 6,
                                offset: const Offset(0, 0),
                                spreadRadius: 2.5,
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Theme",
                                      style:
                                          AppTextStyles.black18Medium.copyWith(
                                        color: isEven
                                            ? AppColors.black
                                            : AppColors.black.withOpacity(0.6),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      textAlign: TextAlign.end,
                                      "20.01.2024 23:37",
                                      style: AppTextStyles.black14.copyWith(
                                        color: isEven
                                            ? AppColors.black
                                            : AppColors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Gap(10),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Lorem Ipsum lorem ipsum ipsum lorem lorem ipsumLorem "
                                      "Ipsum lorem ipsum ipsum lorem lorem ipsumLorem"
                                      "Ipsum lorem ipsum ipsum lorem lorem ipsum",
                                      style: AppTextStyles.black14.copyWith(
                                        color: isEven
                                            ? AppColors.black
                                            : AppColors.black.withOpacity(0.6),
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Expanded(flex: 1, child: SizedBox()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      isEven
                          ? Positioned(
                              bottom: 12,
                              right: 12,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                  color: AppColors.secondaryColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Gap(24);
              },
              itemCount: 5,
            )
          : Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/no_notification.png",
                    ),
                  ),
                  Gap(70),
                  Text(
                    "У вас нет уведомлений!",
                    style: AppTextStyles.black20,
                  ),
                ],
              ),
            ),
    );
  }
}
