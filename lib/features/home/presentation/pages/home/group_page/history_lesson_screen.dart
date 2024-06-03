import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/lesson_entity.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/lesson_history_bloc/lesson_history_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/select_history_lesson_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/container_frame_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/error_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HistoryLessonScreen extends StatelessWidget {
  const HistoryLessonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarSecond(title: "История занятий"),
      body: BlocBuilder<LessonHistoryBloc, LessonHistoryState>(
        builder: (context, state) {
          if (state is LessonHistoryLoadingState) {
            return const LoadingStateWidget();
          } else if (state is LessonHistoryErrorState) {
            return ErrorStateWidget(message: state.message);
          } else if (state is LessonHistoryLoadedState) {
            List<LessonEntity> lesson = state.lessons;
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              itemBuilder: (context, index) {
                return ContainerFrameWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectHistoryLessonScreen(
                          lesson: lesson[index],
                        ),
                      ),
                    );
                  },
                  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                  blurRadius: 8.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: AppColors.black,
                        size: 30.r,
                      ),
                      Expanded(
                        child: Text(
                          AppUtils.parseDateToString(
                            lesson[index].createLesson ?? DateTime.now(),
                          ),
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
                return Gap(20.h);
              },
              itemCount: lesson.length,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
