import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/delete_hw_bloc/delete_hw_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/title_description_row_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LastHWCardWidget extends StatelessWidget {
  final HWEntity hw;
  final String fio;
  final Function() onDelete;

  const LastHWCardWidget({
    Key? key,
    required this.hw,
    required this.fio,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            AppColors.main.withOpacity(0.7),
            AppColors.main,
          ],
        ),
      ),
      child: Column(
        children: [
          Column(
            children: [
              TitleDescriptionWhiteColorRowWidget(
                titleStyle: AppTextStyles.black16,
                descriptionStyle: AppTextStyles.black16,
                title: 'ФИО',
                description: fio,
              ),
              const Divider(),
              TitleDescriptionWhiteColorRowWidget(
                titleStyle: AppTextStyles.black16,
                descriptionStyle: AppTextStyles.black16,
                title: 'Дата создания',
                description: AppUtils.parseDateToString(
                    hw.createDate ?? DateTime.now()),
              ),
              const Divider(),
              TitleDescriptionWhiteColorRowWidget(
                titleStyle: AppTextStyles.black16,
                descriptionStyle: AppTextStyles.black16,
                title: 'Дата завершения',
                description:
                    AppUtils.parseDateToString(hw.deadline ?? DateTime.now()),
              ),
              const Divider(),
              TitleDescriptionWhiteColorRowWidget(
                titleStyle: AppTextStyles.black16,
                descriptionStyle: AppTextStyles.black16,
                title: 'Количество упражнений',
                description: (hw.exercisesCount ?? 1).toString(),
              ),
              Gap(10.h),
            ],
          ),
          BlocConsumer<DeleteHwBloc, DeleteHwState>(
            listener: (context, state) {
              if (state is DeleteHwErrorState) {
                AppUtils.showSnackBar(
                    context: context, description: state.message);
              } else if (state is DeleteHwLoadedState) {
                AppUtils.showSnackBar(
                  context: context,
                  title: "Успешно",
                  description: "Домашнее задание удалено",
                  backgroundColor: AppColors.green,
                );
                onDelete();
              }
            },
            builder: (context, state) {
              if (state is DeleteHwLoadingState) {
                return const LoadingStateWidget();
              }
              return MainButtonWidget(
                backgroundColor: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(20.r),
                child: Text(
                  "Удалить",
                  style: AppTextStyles.black14.copyWith(color: AppColors.white),
                ),
                onPressed: () {
                  BlocProvider.of<DeleteHwBloc>(context)
                      .add(HWDeleteEvent(idHW: hw.id ?? 0));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
