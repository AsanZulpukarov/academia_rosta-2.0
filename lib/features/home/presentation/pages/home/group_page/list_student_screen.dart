import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/constants.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/enums/role_enum.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/student_entity.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/group_info_bloc/group_info_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/grade/grade_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/student_info_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/teacher_hw/prev_hw_student_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ListStudentScreen extends StatelessWidget {
  final int idSubject;
  final int idGroup;

  const ListStudentScreen({
    Key? key,
    required this.idSubject,
    required this.idGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupInfoBloc, GroupInfoState>(
      builder: (context, state) {
        if (state is GroupInfoLoadedState) {
          List<StudentEntity> students = state.group.pupils ?? [];
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: students.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                height: 48.h,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  shadows: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.5),
                      offset: const Offset(4, 4),
                      blurRadius: 8,
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      AppColors.main.withOpacity(0.9),
                      AppColors.main,
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StudentInfoScreen(),
                            ),
                          );
                        },
                        child: Container(
                          color: AppColors.transparent,
                          width: double.infinity,
                          height: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                (index + 1).toString(),
                                style: AppTextStyles.black16Regular.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                              Gap(10.w),
                              Expanded(
                                child: Text(
                                  students.elementAt(index).getFullName(),
                                  style: AppTextStyles.black16Regular.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Constants.user.roleType == RoleType.student ? Container() : Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          PopupMenuButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            icon: Icon(
                              Icons.more_vert,
                              color: AppColors.white,
                              size: 24.w,
                            ),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PrevHWStudentScreen(
                                          fio: students[index].getFullName(),
                                          idGroup: idGroup,
                                          idStudent: students[index].id ?? 0,
                                          idSubject: idSubject,
                                        ),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/icons/home_work_icon.png',
                                      width: 24.w,
                                      height: 24.h,
                                      color: AppColors.black,
                                    ),
                                    Gap(10.w),
                                    Text(
                                      "ДЗ",
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.black12Medium,
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GradeScreen(
                                        student: students.elementAt(index),
                                        idSubject: idSubject,
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/icons/grade_icon.png',
                                      width: 24.w,
                                      height: 24.h,
                                      color: AppColors.black,
                                    ),
                                    Gap(10.w),
                                    Text(
                                      "Оценка",
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.black12Medium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Gap(10.h);
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
