import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class GroupCalendarWidget extends StatelessWidget {
  const GroupCalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.main),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, bottom: 8),
            child: Text(
              "Расписание",
              style: AppTextStyles.black16,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _dayNameAndTime(dayName: "ПН", time: "19:00"),
              _dayNameAndTime(dayName: "ВТ"),
              _dayNameAndTime(dayName: "СР", time: "19:00"),
              _dayNameAndTime(dayName: "ЧТ"),
              _dayNameAndTime(dayName: "ПТ", time: "19:00"),
              _dayNameAndTime(dayName: "СБ"),
              _dayNameAndTime(dayName: "ВС"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dayNameAndTime({
    required String dayName,
    String? time,
  }) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: time == null ? AppColors.white : AppColors.main,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.main),
            ),
            alignment: Alignment.center,
            child: Text(
              dayName,
              style: AppTextStyles.black12Medium.copyWith(
                color: time == null ? AppColors.black : AppColors.white,
              ),
            ),
          ),
          Gap(6),
          Text(
            time ?? "",
            style: AppTextStyles.black12Medium,
          ),
        ],
      ),
    );
  }
}
