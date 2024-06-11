import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/core/platform/network_info.dart';
import 'package:academia_rosta_diplom/features/home/data/datasources/remote/group_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/home/data/repositories/group_repository_impl.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/attendance_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/student_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_all_lesson_history.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/post_attendance_students.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/attendance_bloc/attendance_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/attendance_bloc/attendance_event.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/attendance_bloc/attendance_state.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/lesson_history_bloc/lesson_history_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/history_lesson_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/container_frame_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/error_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AttendanceScreen extends StatefulWidget {
  final List<StudentEntity> students;
  final int idGroups;

  const AttendanceScreen({
    Key? key,
    required this.students,
    required this.idGroups,
  }) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  DateTime _selectDate = DateTime.now();
  AttendanceBloc bloc = AttendanceBloc(
    PostAttendanceUseCase(
      GroupRepositoryImpl(
        remoteGroupDataSource: GroupRemoteDataSourceImpl(),
        networkInfo: NetworkInfoImpl(
          connectionChecker: InternetConnectionChecker(),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: const MyAppBarSecond(
          title: "Посещения",
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              ContainerFrameWidget(
                child: Column(
                  children: [
                    Text(
                      "Выберите дату",
                      style: AppTextStyles.black14.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Gap(10.h),
                    ContainerFrameWidget(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1990),
                          lastDate: DateTime.now(),
                          locale: const Locale("ru"),
                          currentDate: _selectDate,
                        ).then((selectedDate) {
                          if (selectedDate != null &&
                              selectedDate != _selectDate) {
                            setState(() {
                              _selectDate = selectedDate;
                            });
                          }
                        });
                      },
                      width: 160.w,
                      offset: const Offset(4, 4),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: AppColors.black,
                          ),
                          Text(
                            AppUtils.parseDateToString(_selectDate),
                            style: AppTextStyles.black16Regular,
                          ),
                        ],
                      ),
                    ),
                    Gap(20.h),
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: SingleChildScrollView(
                        child: DataTable(
                          border: TableBorder(
                            horizontalInside: BorderSide(
                              color: AppColors.main.withOpacity(0.5),
                            ),
                          ),
                          columnSpacing: 0,
                          horizontalMargin: 0,
                          columns: _createColumns(),
                          rows: _createRows(),
                        ),
                      ),
                    ),
                    Gap(20.h),
                    BlocConsumer<AttendanceBloc, AttendanceState>(
                      listener: (context, state) {
                        if (state is AttendanceErrorState) {
                          AppUtils.showSnackBar(
                            context: context,
                            description: state.message,
                          );
                        } else if (state is AttendanceSavedState) {
                          AppUtils.showSnackBar(
                            context: context,
                            title: "Успешно",
                            description: "Данные сохранены",
                            backgroundColor: AppColors.green,
                          );
                        }
                      },
                      builder: (context, state) {
                        return BlocBuilder<AttendanceBloc, AttendanceState>(
                          builder: (context, state) {
                            if (state is AttendanceLoadingState) {
                              return const LoadingStateWidget();
                            }
                            return MainButtonWidget(
                              onPressed: () {
                                Map<int, bool> attendanceMap = {};
                                for (int i = 0;
                                    i < widget.students.length;
                                    i++) {
                                  attendanceMap[widget.students[i].id ?? 0] =
                                      widget.students[i].isAttended ?? false;
                                }
                                bloc.add(
                                  AttendanceTapSaveEvent(
                                    attendanceEntity: AttendanceEntity(
                                      idGroup: widget.idGroups,
                                      selectDate: _selectDate,
                                      attendance: attendanceMap,
                                    ),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(20.r),
                              child: Text(
                                'Сохранено',
                                style: AppTextStyles.black16.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DataColumn> _createColumns() {
    final double containerWidth = 20.w;
    final EdgeInsets containerPadding =
        EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w);

    return [
      DataColumn(
        label: Container(
          padding: containerPadding,
          width: containerWidth,
          alignment: Alignment.center,
          child: const Text("№"),
        ),
      ),
      DataColumn(
        label: Container(
          padding: containerPadding,
          width: 120.w,
          alignment: Alignment.centerLeft,
          child: const Text(
            "ФИО",
            maxLines: 2,
          ),
        ),
      ),
      DataColumn(
        label: GestureDetector(
          onTap: () {
            setState(() {
              for (var element in widget.students) {
                element.isAttended = true;
              }
            });
          },
          child: Container(
            padding: containerPadding,
            width: containerWidth,
            alignment: Alignment.center,
            child: Icon(
              Icons.check_circle,
              color: AppColors.blue,
              size: 20.r,
            ),
          ),
        ),
      ),
    ];
  }

  List<DataRow> _createRows() {
    return widget.students.map((student) {
      int i = 1;
      final bool isSelected = student.isAttended == true;
      return DataRow(
        cells: [
          DataCell(
            _buildDataCell((i++).toString(), 20.w),
          ),
          DataCell(
            _buildDataCell(student.getFullName(), 120.w),
          ),
          DataCell(
            GestureDetector(
              onTap: () {
                setState(() {
                  student.isAttended = !isSelected;
                });
              },
              child: _buildIconContainer(Icons.check_circle,
                  isSelected ? AppColors.blue : AppColors.grey),
            ),
          ),
        ],
      );
    }).toList();
  }

  Widget _buildDataCell(String text, double width) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
      width: width,
      alignment: Alignment.centerLeft,
      child: Text(text),
    );
  }

  Widget _buildIconContainer(IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
      width: 20.w,
      alignment: Alignment.center,
      child: Icon(
        icon,
        color: color,
        size: 20.r,
      ),
    );
  }
}
