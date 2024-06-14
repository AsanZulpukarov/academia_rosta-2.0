import 'package:academia_rosta_diplom/features/home/data/datasources/remote/group_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/home/data/repositories/group_repository_impl.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_all_hw_by_student_id.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_hw_student.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/hw_bloc/hw_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/group/student_hw/hw_card_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/error_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AllHWStudentScreen extends StatelessWidget {
  final int subjectId;

  const AllHWStudentScreen({
    super.key,
    required this.subjectId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HWBloc(
        GetAllHWByStudentIdUseCase(
          GroupRepositoryImpl(
            remoteGroupDataSource: GroupRemoteDataSourceImpl(),
          ),
        ),
        GetHWStudentUseCase(
          GroupRepositoryImpl(
            remoteGroupDataSource: GroupRemoteDataSourceImpl(),
          ),
        ),
      )..add(StudentHWGetEvent(idSubject: subjectId)),
      child: Scaffold(
        appBar: const MyAppBarSecond(
          title: "Домашние задания",
        ),
        body: BlocBuilder<HWBloc, HWState>(
          builder: (context, state) {
            if (state is HWLoadingState) {
              return const LoadingStateWidget();
            } else if (state is HWErrorState) {
              return ErrorStateWidget(message: state.message);
            } else if (state is HWLoadedState) {
              List<HWEntity> hw = state.hw;
              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.h),
                itemBuilder: (context, index) {
                  return StudentHWCardWidget(
                    fio: null,
                    hw: hw[index],
                    onDelete: () {},
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
      ),
    );
  }
}
