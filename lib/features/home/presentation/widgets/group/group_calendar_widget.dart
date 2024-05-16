import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/timetable_entity.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/group_info_bloc/group_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class GroupCalendarWidget extends StatelessWidget {

  const GroupCalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupInfoBloc, GroupInfoState>(
      builder: (context, state) {
        if(state is GroupInfoLoadedState) {
          TimetableEntity? timetableEntity = state.group.timetable;
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
                    _dayNameAndTime(dayName: "ПН", time: timetableEntity?.monday),
                    _dayNameAndTime(dayName: "ВТ",time: timetableEntity?.tuesday),
                    _dayNameAndTime(dayName: "СР", time: timetableEntity?.wednesday),
                    _dayNameAndTime(dayName: "ЧТ",time: timetableEntity?.thursday),
                    _dayNameAndTime(dayName: "ПТ", time: timetableEntity?.friday),
                    _dayNameAndTime(dayName: "СБ",time: timetableEntity?.saturday),
                    _dayNameAndTime(dayName: "ВС",time: timetableEntity?.sunday),
                  ],
                ),
              ],
            ),
          );
        }
        return SizedBox();
      },
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
