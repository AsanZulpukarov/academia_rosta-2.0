import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/core/platform/network_info.dart';
import 'package:academia_rosta_diplom/features/home/data/datasources/remote/group_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/home/data/repositories/group_repository_impl.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_exercise_by_hw_id.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/exercise_bloc/exercise_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/hw_item_exersices_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/title_description_row_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class LastHWCardWidget extends StatelessWidget {
  final HWEntity hw;
  final String fio;

  const LastHWCardWidget({
    Key? key,
    required this.hw,
    required this.fio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => ExerciseBloc(
                      GetExerciseByHWIdUseCase(
                        GroupRepositoryImpl(
                          remoteGroupDataSource: GroupRemoteDataSourceImpl(),
                          networkInfo: NetworkInfoImpl(
                            connectionChecker: InternetConnectionChecker(),
                          ),
                        ),
                      ),
                    )..add(ExerciseGetEvent(id: hw.id ?? 0)),
                    child: const HWItemExercisesScreen(),
                  ),
                ),
              );
            },
            child: Column(
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
                const Gap(10),
              ],
            ),
          ),
          MainButtonWidget(
            backgroundColor: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(20),
            child: Text(
              "Удалить",
              style: AppTextStyles.black14.copyWith(color: AppColors.white),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
