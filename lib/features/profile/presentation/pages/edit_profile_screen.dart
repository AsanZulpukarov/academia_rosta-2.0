import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:academia_rosta_diplom/features/profile/data/datasources/remote/profile_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/get_user_info.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/update_user_info.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/bloc/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/pages/choose_photo_dialog.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/pages/edit_profile_form.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    // TODO: implement initState
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          ProfileAvatarItem(
                            image: ProfileAvatar.listAvatars
                                .elementAt(selectImageIndex),
                            radius: 60,
                            backgroundColor: AppColors.white,
                          ),
                          TextButton(
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: AppColors.white,
                                  title: const Text(
                                    "Выберите фото:",
                                    style: AppTextStyles.black16,
                                  ),
                                  content: ChoosePhotoDialog(
                                    currentPhotoIndex: selectImageIndex,
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Выбрать"))
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
                    EditProfileForm(userInfoEntity: state.userInfoEntity,),
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
