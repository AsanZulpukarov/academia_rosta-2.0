import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/constants.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/enums/role_enum.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/pages/sign_in/sign_in_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/error_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/profile/data/datasources/remote/profile_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/get_user_info.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/pages/change_password_screen.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/pages/my_subjects_screen.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/widgets/profile_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../app_theme.dart';
import 'about_app_screen.dart';
import 'contact_screen.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileBloc = ProfileBloc(
    GetUserInfoUseCase(
      ProfileRepositoryImpl(
        profileRemoteDataSource: ProfileRemoteDataSourceImpl(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    double gap = 10.h;
    return BlocProvider.value(
      value: profileBloc..add(ProfileEmptyEvent()),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoadingState) {
                    return const LoadingStateWidget();
                  } else if (state is ProfileErrorState) {
                    return ErrorStateWidget(message: state.message);
                  } else if (state is ProfileLoadedState) {
                    UserInfoEntity user = state.user;
                    return Column(
                      children: [
                        ProfileAvatarItem(
                          image: ProfileAvatar
                              .listAvatars[Constants.user.avatar ?? 0],
                          radius: 50.r,
                          backgroundColor: AppColors.white,
                        ),
                        Gap(10.h),
                        Text(
                          user.getFIO(),
                          style: AppTextStyles.black16,
                        ),
                        Text(
                          user.email ?? "Empty",
                          style: AppTextStyles.black12.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          user.phoneNumber ?? "Empty",
                          style: AppTextStyles.black12.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
            Gap(20.h),
            ProfileNavItem(
              icon: Icons.person_outline,
              title: 'Редактировать профиль',
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfileScreen(),
                  ),
                );
                setState(() {});
              },
            ),
            Gap(gap),
            ProfileNavItem(
              icon: Icons.password_outlined,
              title: 'Изменить пароль',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePasswordScreen(),
                  ),
                );
              },
            ),
            Constants.user.roleType == RoleType.teacher
                ? const SizedBox()
                : Column(
                    children: [
                      Gap(gap),
                      ProfileNavItem(
                        icon: Icons.bar_chart_outlined,
                        title: 'Моя статистика',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyObjectScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
            Gap(gap),
            ProfileNavItem(
              icon: Icons.email_outlined,
              title: 'Связаться с нами',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactScreen(),
                  ),
                );
              },
            ),
            Gap(gap),
            ProfileNavItem(
              icon: Icons.info_outline,
              title: 'О приложении',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutAppScreen(),
                  ),
                );
              },
            ),
            Gap(gap),
            ProfileNavItem(
              icon: Icons.exit_to_app,
              title: 'Выйти',
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    backgroundColor: AppColors.white,
                    title: const Text(
                      'Выйти из аккаунта?',
                      textAlign: TextAlign.center,
                    ),
                    content: const Text(
                      'Вы действительно хотите выйти?',
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      Row(
                        children: [
                          Expanded(
                            child: MainButtonWidget(
                              borderRadius: BorderRadius.circular(20.r),
                              onPressed: () async {
                                profileBloc.add(ProfileExitAccountEvent());
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInScreen(),),
                                  (Route<dynamic> route) => false,
                                );
                              },
                              child: Text(
                                'Выйти',
                                style: AppTextStyles.black14.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          Gap(20.w),
                          Expanded(
                            child: MainButtonWidget(
                              borderRadius: BorderRadius.circular(20.r),
                              onPressed: () => Navigator.of(context).pop(false),
                              backgroundColor: AppColors.grey,
                              child: Text(
                                'Остаться',
                                style: AppTextStyles.black14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
