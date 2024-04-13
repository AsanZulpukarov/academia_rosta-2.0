import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/core/platform/network_info.dart';
import 'package:academia_rosta_diplom/features/home/data/datasources/remote/group_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/home/data/repositories/group_repository_impl.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_all_groups.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/groups_bloc/groups_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/group_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupsBloc(
        getAllGroupsUseCase: GetAllGroupsUseCase(
          GroupRepositoryImpl(
            remoteGroupDataSource: GroupRemoteDataSourceImplFake(),
            networkInfo: NetworkInfoImpl(
              connectionChecker: InternetConnectionChecker(),
            ),
          ),
        ),
      )..add(GroupsEmptyEvent()),
      child: BlocBuilder<GroupsBloc, GroupsState>(
        builder: (context, state) {
          if (state is GroupsLoadingState) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is GroupsErrorState) {
            Center(
              child: Text("Вышла ошибка"),
            );
          } else if (state is GroupsLoadedState) {
            List<GroupInfoEntity> groupList = state.groups;
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: groupList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GroupInfoScreen(
                                  groupName: groupList.elementAt(index).name ??
                                      "Название группы",
                                )));
                  },
                  child: Container(
                    height: 140.h,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.5),
                          offset: Offset(4, 4),
                          blurRadius: 8,
                        ),
                      ],
                      // color: AppColors.main,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          groupList.elementAt(index).name ?? "Название группы",
                          style: AppTextStyles.black26.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Gap(10),
                        _groupInfoRow('Предмет',
                            groupList.elementAt(index).subject ?? "Предмет"),
                        _groupInfoRow('Учитель',
                            groupList.elementAt(index).teacher ?? "Учитель"),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Gap(20);
              },
            );
          }
          return const Center(
            child: Text(
              "Нет групп",
              style: AppTextStyles.black14,
            ),
          );
        },
      ),
    );
  }

  Widget _groupInfoRow(String text1, String text2) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "$text1:",
            style: AppTextStyles.black16.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            text2,
            style: AppTextStyles.black14.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
