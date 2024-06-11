import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/core/platform/network_info.dart';
import 'package:academia_rosta_diplom/features/home/data/datasources/remote/group_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/home/data/models/subject_model.dart';
import 'package:academia_rosta_diplom/features/home/data/models/teacher_model.dart';
import 'package:academia_rosta_diplom/features/home/data/repositories/group_repository_impl.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_by_id_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_all_lesson_history.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/group_info_bloc/group_info_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/lesson_history_bloc/lesson_history_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/attendance_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/grade_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/list_student_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/group/group_calendar_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/group/show_bottom_window.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/container_frame_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../widgets/home/my_app_bar_second.dart';
import 'history_lesson_screen.dart';

class GroupInfoScreen extends StatefulWidget {
  final String groupName;

  const GroupInfoScreen({Key? key, required this.groupName}) : super(key: key);

  @override
  State<GroupInfoScreen> createState() => _GroupInfoScreenState();
}

class _GroupInfoScreenState extends State<GroupInfoScreen> {
  GroupInfoByIdEntity? groupInfoByIdEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarSecond(
        title: widget.groupName,
      ),
      body: BlocConsumer<GroupInfoBloc, GroupInfoState>(
        listener: (context, state) {
          if (state is GroupInfoErrorState) {
            AppUtils.showSnackBar(context: context, description: state.message);
          }
        },
        builder: (context, state) {
          if (state is GroupInfoLoadingState) {
            return const LoadingStateWidget();
          } else if (state is GroupInfoLoadedState) {
            groupInfoByIdEntity = state.group;
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                children: [
                  Column(
                    children: [
                      _row2Text(
                        title: "Предмет:",
                        subtitle: groupInfoByIdEntity?.subject?.name ??
                            "Название предмета",
                        function: () {
                          showBottomWindowSubject(
                            context,
                            SubjectModel(
                              id: groupInfoByIdEntity?.subject?.id,
                              name: groupInfoByIdEntity?.subject?.name,
                              cost: groupInfoByIdEntity?.subject?.cost,
                            ),
                          );
                        },
                      ),
                      Gap(5.h),
                      _row2Text(
                        title: "Учитель:",
                        subtitle: groupInfoByIdEntity?.teacher?.getFullName() ??
                            "Пусто",
                        function: () {
                          showBottomWindowTeacher(
                            context,
                            TeacherModel(
                              id: groupInfoByIdEntity?.teacher?.id,
                              firstname:
                                  groupInfoByIdEntity?.teacher?.firstname ??
                                      "Пусто",
                              lastname: groupInfoByIdEntity?.teacher?.lastname ??
                                  "Пусто",
                              phoneNumber:
                                  groupInfoByIdEntity?.teacher?.phoneNumber ??
                                      "Пусто",
                            ),
                          );
                        },
                      ),
                      Gap(16.h),
                      _actionButton(context),
                      Gap(16.h),
                      GroupCalendarWidget(),
                    ],
                  ),
                  Gap(20.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    decoration: ShapeDecoration(
                      shadows: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.5),
                          offset: const Offset(4, 4),
                          blurRadius: 8,
                        ),
                      ],
                      color: AppColors.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "№",
                          style: AppTextStyles.black16Regular.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        Gap(10.w),
                        Expanded(
                          child: Text(
                            "Студенты",
                            style: AppTextStyles.black16Regular.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(10.h),
                  ListStudentScreen(
                    idSubject: state.group.subject?.id ?? 0,
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _row2Text(
      {required String title,
      required String subtitle,
      required Function function}) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: AppTextStyles.black16.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: TextButton(
            onPressed: () {
              function();
            },
            style: const ButtonStyle(
              alignment: Alignment.centerLeft,
            ),
            child: Text(
              subtitle,
              style: AppTextStyles.black16.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _actionButton(BuildContext context) {
    return Row(
      children: [
        _actionButtonAndName(
          nameIcon: 'attendance_icon.png',
          nameButton: 'Посещения',
          function: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AttendanceScreen(
                  students: groupInfoByIdEntity?.pupils ?? [],
                  idGroups: groupInfoByIdEntity?.id ?? 0,
                ),
              ),
            );
          },
        ),
        Gap(10.w),
        _actionButtonAndName(
          nameIcon: 'history_lesson_icon.png',
          nameButton: 'Занятия',
          function: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => LessonHistoryBloc(
                    GetAllLessonHistoryUseCase(
                      GroupRepositoryImpl(
                        remoteGroupDataSource: GroupRemoteDataSourceImpl(),
                        networkInfo: NetworkInfoImpl(
                          connectionChecker: InternetConnectionChecker(),
                        ),
                      ),
                    ),
                  )..add(LessonHistoryEmptyEvent(id: groupInfoByIdEntity?.id ?? 0)),
                  child: const HistoryLessonScreen(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _actionButtonAndName({
    required String nameIcon,
    required String nameButton,
    required Function()? function,
  }) {
    return Expanded(
      child: ContainerFrameWidget(
        onTap: function,
        offset: const Offset(2, 2),
        blurRadius: 2.0,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(8.h),
            SizedBox(
              width: 40.r,
              height: 40.r,
              child: Image.asset("assets/icons/$nameIcon"),
            ),
            Gap(8.h),
            Text(
              nameButton,
              textAlign: TextAlign.center,
              style: AppTextStyles.black12Medium,
              overflow: TextOverflow.ellipsis,
            ),
            Gap(8.h),
          ],
        ),
      ),
    );
  }
}
