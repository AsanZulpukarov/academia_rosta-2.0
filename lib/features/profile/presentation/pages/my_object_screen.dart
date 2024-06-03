import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/subject_entity.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/container_frame_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/error_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:academia_rosta_diplom/features/profile/data/datasources/remote/profile_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/get_subjects.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/bloc/my_object_bloc/my_object_bloc.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/pages/my_statistic_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MyObjectScreen extends StatelessWidget {
  const MyObjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyObjectBloc(
        GetMySubjectsUseCase(
          ProfileRepositoryImpl(
            profileRemoteDataSource: ProfileRemoteDataSourceImpl(),
          ),
        ),
      )..add(MySubjectEmptyEvent()),
      child: Scaffold(
        appBar: const MyAppBarSecond(
          title: "Мои предметы",
        ),
        body: BlocBuilder<MyObjectBloc, MySubjectState>(
          builder: (context, state) {
            if (state is MySubjectLoadingState) {
              return const LoadingStateWidget();
            } else if (state is MySubjectErrorState) {
              return ErrorStateWidget(message: state.message);
            } else if (state is MySubjectLoadedState) {
              List<SubjectEntity> subjects = state.objects;
              if (subjects.isEmpty) {
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
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                itemBuilder: (context, index) {
                  return ContainerFrameWidget(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyStatisticScreen(
                              idSubject: subjects.elementAt(index).id ?? 1),
                        ),
                      );
                    },
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
                      title: Text(
                        subjects[index].name ?? "Предмет",
                        style: AppTextStyles.black18Medium.copyWith(
                          color: AppColors.main,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.auto_graph,
                        color: AppColors.main,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Gap(16.h);
                },
                itemCount: subjects.length,
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
