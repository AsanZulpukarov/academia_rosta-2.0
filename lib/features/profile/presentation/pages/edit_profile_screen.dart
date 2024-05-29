import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/constants.dart';
import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:academia_rosta_diplom/features/profile/data/datasources/remote/profile_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/change_avatar.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/get_user_info.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/update_user_info.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/bloc/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/pages/choose_photo_dialog.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/pages/edit_profile_form.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app_theme.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  int selectImageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileBloc(
        getUserInfoUseCase: GetUserInfoUseCase(
          ProfileRepositoryImpl(
            profileRemoteDataSource: ProfileRemoteDataSourceImpl(),
          ),
        ),
        updateUserInfoUseCase: UpdateUserInfoUseCase(
          ProfileRepositoryImpl(
            profileRemoteDataSource: ProfileRemoteDataSourceImpl(),
          ),
        ),
        changeAvatarUseCase: ChangeAvatarUseCase(
          ProfileRepositoryImpl(
            profileRemoteDataSource: ProfileRemoteDataSourceImpl(),
          ),
        ),
      )..add(const EditProfileEmptyEvent()),
      child: Scaffold(
        appBar: const MyAppBarSecond(
          title: "Редактировать профиль",
        ),
        body: BlocConsumer<EditProfileBloc, EditProfileState>(
          listener: (context, state) {
            if (state is EditProfileErrorState) {
              AppUtils.showSnackBar(
                context: context,
                description: state.message,
              );
            } else if (state is EditProfileSavedState) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            if (state is EditProfileLoadingState) {
              return const LoadingStateWidget();
            } else if (state is EditProfileLoadedState) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          ProfileAvatarItem(
                            image: ProfileAvatar.listAvatars
                                .elementAt(Constants.user.avatar ?? 0),
                            radius: 50.r,
                            backgroundColor: AppColors.white,
                          ),
                          TextButton(
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (c) => AlertDialog(
                                  backgroundColor: AppColors.white,
                                  title: Text(
                                    "Выберите фото:",
                                    style: AppTextStyles.black16,
                                  ),
                                  content: ChoosePhotoDialog(
                                    currentPhotoIndex: Constants.user.avatar ?? 0,
                                    onTap:(value){
                                      selectImageIndex = value;
                                    }
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        BlocProvider.of<EditProfileBloc>(
                                                context)
                                            .add(
                                          EditProfileChangeImageEvent(
                                              selectImageIndex),
                                        );
                                        setState(() {
                                          selectImageIndex = Constants.user.avatar ?? 0;
                                        });
                                          Navigator.pop(c);
                                      },
                                      child: Text(
                                        "Выбрать",
                                        style: AppTextStyles.black16.copyWith(
                                          color: AppColors.main,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text(
                              "Изменить фото",
                              style: AppTextStyles.black14.copyWith(
                                color: AppColors.main,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    EditProfileForm(
                      userInfoEntity: state.userInfoEntity,
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
