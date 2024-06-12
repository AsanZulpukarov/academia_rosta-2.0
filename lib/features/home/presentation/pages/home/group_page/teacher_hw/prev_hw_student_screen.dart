import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/core/platform/network_info.dart';
import 'package:academia_rosta_diplom/features/home/data/datasources/remote/group_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/home/data/repositories/group_repository_impl.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/create_hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/create_hw.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/delete_hw_by_id.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_all_hw_by_student_id.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/create_hw_bloc/create_hw_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/delete_hw_bloc/delete_hw_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/hw_bloc/hw_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/group/teacher_hw/last_hw_card_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/container_frame_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/error_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class PrevHWStudentScreen extends StatefulWidget {
  final String fio;
  final int idGroup;
  final int idStudent;
  final int idSubject;

  const PrevHWStudentScreen({
    super.key,
    required this.fio,
    required this.idGroup,
    required this.idStudent,
    required this.idSubject,
  });

  @override
  State<PrevHWStudentScreen> createState() => _PrevHWStudentScreenState();
}

class _PrevHWStudentScreenState extends State<PrevHWStudentScreen> {
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HWBloc(
            GetAllHWByStudentIdUseCase(
              GroupRepositoryImpl(
                remoteGroupDataSource: GroupRemoteDataSourceImpl(),
                networkInfo: NetworkInfoImpl(
                  connectionChecker: InternetConnectionChecker(),
                ),
              ),
            ),
          )..add(
              HWEmptyEvent(
                idSubject: widget.idSubject,
                idStudent: widget.idStudent,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => CreateHwBloc(
            CreateHWUseCase(
              GroupRepositoryImpl(
                remoteGroupDataSource: GroupRemoteDataSourceImpl(),
                networkInfo: NetworkInfoImpl(
                  connectionChecker: InternetConnectionChecker(),
                ),
              ),
            ),
          ),
        ),
      ],
      child: Scaffold(
        appBar: const MyAppBarSecond(title: "Домашние задания"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    "Выберите дату завершения\nдомашнего задания",
                    style: AppTextStyles.black14,
                    textAlign: TextAlign.center,
                  ),
                  Gap(4.h),
                  ContainerFrameWidget(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(
                            DateTime.now().year, DateTime.now().month + 2),
                        locale: const Locale("ru"),
                      ).then((selectedDate) {
                        if (selectedDate != null &&
                            selectedDate != selectDate) {
                          setState(() {
                            selectDate = selectedDate;
                          });
                        }
                      });
                    },
                    width: 180.w,
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
                          AppUtils.parseDateToString(selectDate),
                          style: AppTextStyles.black16Regular,
                        ),
                      ],
                    ),
                  ),
                  Gap(10.h),
                  BlocConsumer<CreateHwBloc, CreateHwState>(
                    listener: (context, state) {
                      if (state is CreateHWErrorState) {
                        AppUtils.showSnackBar(
                          context: context,
                          description: state.message,
                        );
                      } else if (state is CreateHWLoadedState) {
                        AppUtils.showSnackBar(
                          context: context,
                          title: "Успешно",
                          description: "Домашнее задание создано",
                          backgroundColor: AppColors.green,
                        );
                        BlocProvider.of<HWBloc>(context).add(
                          HWEmptyEvent(
                            idSubject: widget.idSubject,
                            idStudent: widget.idStudent,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is CreateHWLoadingState) {
                        return const LoadingStateWidget();
                      }
                      return MainButtonWidget(
                        width: 180.w,
                        borderRadius: BorderRadius.circular(20),
                        child: Text(
                          'Создать ДЗ',
                          style: AppTextStyles.black14.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        onPressed: () {
                          BlocProvider.of<CreateHwBloc>(context).add(
                            CreateHWSaveEvent(
                              createHWEntity: CreateHWEntity(
                                pupilId: widget.idStudent,
                                groupId: widget.idGroup,
                                deadline: selectDate,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              BlocBuilder<HWBloc, HWState>(
                builder: (context, state) {
                  if (state is HWLoadingState) {
                    return const LoadingStateWidget();
                  } else if (state is HWErrorState) {
                    return ErrorStateWidget(message: state.message);
                  } else if (state is HWLoadedState) {
                    List<HWEntity> hw = state.hw;
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 20.h),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return BlocProvider(
                          create: (context) => DeleteHwBloc(
                            DeleteHWByIdUseCase(
                              GroupRepositoryImpl(
                                remoteGroupDataSource:
                                    GroupRemoteDataSourceImpl(),
                                networkInfo: NetworkInfoImpl(
                                  connectionChecker:
                                      InternetConnectionChecker(),
                                ),
                              ),
                            ),
                          ),
                          child: LastHWCardWidget(
                            hw: hw[index],
                            fio: widget.fio,
                            onDelete: () {
                              BlocProvider.of<HWBloc>(context).add(
                                HWEmptyEvent(
                                  idSubject: widget.idSubject,
                                  idStudent: widget.idStudent,
                                ),
                              );
                            },
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Gap(10.h);
                      },
                      itemCount: hw.length,
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
