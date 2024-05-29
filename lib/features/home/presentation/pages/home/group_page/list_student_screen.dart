import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/core/platform/network_info.dart';
import 'package:academia_rosta_diplom/features/home/data/datasources/remote/group_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/home/data/repositories/group_repository_impl.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/student_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_all_hw_by_student_id.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/group_info_bloc/group_info_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/hw_bloc/hw_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/prev_hw_student_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/student_info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ListStudentScreen extends StatelessWidget {
  final int idSubject;

  const ListStudentScreen({Key? key, required this.idSubject})
      : super(key: key);

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
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
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
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
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
                    Gap(10.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => HWBloc(
                                    GetAllHWByStudentIdUseCase(
                                      GroupRepositoryImpl(
                                        remoteGroupDataSource: GroupRemoteDataSourceImpl(),
                                        networkInfo: NetworkInfoImpl(
                                          connectionChecker: InternetConnectionChecker(),
                                        ),
                                      ),
                                    ),
                                  )
                                    ..add(
                                      HWEmptyEvent(
                                        idSubject: idSubject,
                                        idStudent: students[index].id ?? 0,
                                      ),
                                    ),
                                  child: PrevHWStudentScreen(
                                    fio: students[index].getFullName(),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/icons/home_work_icon.png',
                            width: 24.w,
                            height: 24.h,
                            color: AppColors.white,
                          ),
                        ),
                        Gap(10.w),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const StudentInfoScreen(),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.white,
                            size: 24.w,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Gap(10);
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
