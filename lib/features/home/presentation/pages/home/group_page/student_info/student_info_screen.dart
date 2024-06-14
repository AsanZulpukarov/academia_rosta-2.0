import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/data/datasources/remote/group_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/home/data/repositories/group_repository_impl.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/student_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_all_groups.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_groups_student_id.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/groups_bloc/groups_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/student_info/loaded_student_groups.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/container_frame_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/error_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class StudentInfoScreen extends StatelessWidget {
  final StudentEntity studentEntity;

  const StudentInfoScreen({Key? key, required this.studentEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarSecond(
        title: 'Информация о студенте',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ContainerFrameWidget(
                child: Column(
                  children: [
                    _rowTitleAndText(
                      title: "ФИО",
                      subtitle: studentEntity.getFullName(),
                    ),
                    Divider(
                      color: AppColors.mainColor,
                      height: 20.h,
                    ),
                    _rowTitleAndText(
                      title: "E-mail",
                      subtitle: studentEntity.email ?? "Пусто",
                    ),
                    Divider(
                      color: AppColors.mainColor,
                      height: 20.h,
                    ),
                    _rowTitleAndText(
                      title: "Ном тел.",
                      subtitle: studentEntity.phoneNumber ?? "Пусто",
                    ),
                    Divider(
                      color: AppColors.mainColor,
                      height: 20.h,
                    ),
                    _rowTitleAndText(
                      title: "День рождение",
                      subtitle: studentEntity.birthday == null
                          ? "Пусто"
                          : AppUtils.parseDateToString(
                              studentEntity.birthday ?? DateTime.now()),
                    ),
                  ],
                ),
              ),
            ),
            Gap(20.h),
            Text(
              'Группы',
              style: AppTextStyles.black16,
            ),
            BlocProvider(
              create: (context) => GroupsBloc(
                getAllGroupsUseCase: GetAllGroupsUseCase(
                  GroupRepositoryImpl(
                    remoteGroupDataSource: GroupRemoteDataSourceImpl(),
                  ),
                ),
                getGroupsStudentIdUseCase: GetGroupsStudentIdUseCase(
                  GroupRepositoryImpl(
                    remoteGroupDataSource: GroupRemoteDataSourceImpl(),
                  ),
                ),
              )..add(GetGroupsStudentIdEvent(id: studentEntity.id ?? 0)),
              child: BlocBuilder<GroupsBloc, GroupsState>(
                builder: (context, state) {
                  if (state is GroupsLoadingState) {
                    return const LoadingStateWidget();
                  } else if (state is GroupsErrorState) {
                    return ErrorStateWidget(message: state.message);
                  } else if (state is GroupsLoadedState) {
                    return GroupsLoadedScreen(
                      groups: state.groups,
                      studentId: studentEntity.id ?? 0,
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowTitleAndText({required String title, required String subtitle}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: AppTextStyles.black12,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            subtitle,
            style: AppTextStyles.black12,
            maxLines: 2,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}


