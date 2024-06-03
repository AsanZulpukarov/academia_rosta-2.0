import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/hw_bloc/hw_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/create_hw_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/group/last_hw_card_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/container_frame_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/error_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PrevHWStudentScreen extends StatelessWidget {
  final String fio;

  const PrevHWStudentScreen({
    super.key,
    required this.fio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarSecond(title: "Прошлые домашние занятия"),
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
                      locale: Locale("ru"),
                    );
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
                        "09.06.2001",
                        style: AppTextStyles.black16Regular,
                      ),
                    ],
                  ),
                ),
                Gap(10.h),
                MainButtonWidget(
                  width: 180.w,
                  borderRadius: BorderRadius.circular(20),
                  child: Text(
                    'Создать ДЗ',
                    style: AppTextStyles.black14.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateHWScreen(),
                      ),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return LastHWCardWidget(
                        hw: hw[index],
                        fio: fio,
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
    );
  }
}
