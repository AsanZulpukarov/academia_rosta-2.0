
import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_entity.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/student_info/loaded_student_statistics.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/container_frame_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class GroupsLoadedScreen extends StatelessWidget {
  final List<GroupInfoEntity> groups;
  final int studentId;

  const GroupsLoadedScreen({
    super.key,
    required this.groups,
    required this.studentId,
  });

  @override
  Widget build(BuildContext context) {
    if (groups.isEmpty) {
      return Center(
        child: Text(
          "Нет предметов",
          style: AppTextStyles.black26.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemBuilder: (context, index) {
        return ContainerFrameWidget(
          onTap: groups[index].isMentalGroup ?? false
              ? () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentStatisticScreen(
                  studentId: studentId,
                  subjectId: groups[index].subjectId ?? 0,
                ),
              ),
            );
          }
              : null,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
            title: Text(
              groups[index].name ?? "Предмет",
              style: AppTextStyles.black18Medium.copyWith(
                color: AppColors.main,
              ),
            ),
            trailing: groups[index].isMentalGroup ?? false
                ? const Icon(
              Icons.auto_graph,
              color: AppColors.main,
            )
                : const SizedBox(),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Gap(16.h);
      },
      itemCount: groups.length,
    );
  }
}