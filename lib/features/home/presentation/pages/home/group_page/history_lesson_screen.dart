import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/core/platform/network_info.dart';
import 'package:academia_rosta_diplom/features/home/data/datasources/remote/group_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/home/data/repositories/group_repository_impl.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_all_lesson_history.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/lesson_history_bloc/lesson_history_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/select_history_lesson_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/container_frame_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HistoryLessonScreen extends StatelessWidget {
  final int id;
  const HistoryLessonScreen({Key? key,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarSecond(title: "История занятий"),
      body: BlocProvider(
        create: (context) => LessonHistoryBloc(
          GetAllLessonHistoryUseCase(
            GroupRepositoryImpl(
              remoteGroupDataSource: GroupRemoteDataSourceImpl(),
              networkInfo: NetworkInfoImpl(
                connectionChecker: InternetConnectionChecker(),
              ),
            ),
          ),
        )..add(LessonHistoryEmptyEvent(id: id)),
        child: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return ContainerFrameWidget(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectHistoryLessonScreen()));
              },
              padding: const EdgeInsets.all(10),
              blurRadius: 8.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.access_time_rounded,
                    color: AppColors.black,
                    size: 30,
                  ),
                  Expanded(
                    child: Text(
                      "02.04.2024",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.black18Medium.copyWith(
                        color: AppColors.main,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Gap(20);
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
