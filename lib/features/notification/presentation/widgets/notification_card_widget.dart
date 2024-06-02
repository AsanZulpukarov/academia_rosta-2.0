import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/notification/presentation/pages/notification_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NotificationCardWidget extends StatelessWidget {
  final bool isEven;

  const NotificationCardWidget({Key? key, required this.isEven})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NotificationInfoScreen()));
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                          style: AppTextStyles.black18Medium.copyWith(
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
  }
}
