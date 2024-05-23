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
import 'package:academia_rosta_diplom/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../app_theme.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
              _lastnameController.text = state.userInfoEntity.lastname ?? "";
              _firstnameController.text = state.userInfoEntity.firstname ?? "";
              _usernameController.text = state.userInfoEntity.username ?? "";
              _emailController.text = state.userInfoEntity.email ?? "";
              _phoneController.text = state.userInfoEntity.phoneNumber ?? "";
              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Form(
                  key: _formKey,
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
                      _titleAndField(
                        title: "Фамилия",
                        controller: _lastnameController,
                        validator: AppUtils.validateLastName,
                      ),
                      Gap(5),
                      _titleAndField(
                        title: "Имя",
                        controller: _firstnameController,
                        validator: AppUtils.validateFirstName,
                      ),
                      Gap(5),
                      _titleAndField(
                          title: "Логин",
                          controller: _usernameController,
                          validator: AppUtils.validateUsername),
                      Gap(5),
                      _titleAndField(
                        title: "Email",
                        controller: _emailController,
                        validator: AppUtils.validateEmail,
                        textInputType: TextInputType.emailAddress,
                      ),
                      Gap(5),
                      _titleAndField(
                        title: "Телефон номер",
                        controller: _phoneController,
                        validator: AppUtils.validatePhone,
                        textInputType: TextInputType.number,
                      ),
                      Gap(20),
                      Builder(builder: (context) {
                        if (state is EditProfileLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                        return MainButtonWidget(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<EditProfileBloc>().add(
                                    EditProfileSaveEvent(UserInfoEntity(
                                      firstname: _firstnameController.text,
                                      lastname: _lastnameController.text,
                                      username: _usernameController.text,
                                      email: _emailController.text,
                                      phoneNumber: _phoneController.text,
                                    )),
                                  );
                            }
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Text(
                            'Сохранить',
                            style: AppTextStyles.black16.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        );
                      }),
                      Gap(10),
                      MainButtonWidget(
                        backgroundColor: AppColors.grey,
                        onPressed: () {},
                        borderRadius: BorderRadius.circular(20),
                        child: Text(
                          'Отменить изменения',
                          style: AppTextStyles.black16.copyWith(
                            color: AppColors.main,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _titleAndField({
    required String title,
    required TextEditingController controller,
    required Function(String? value) validator,
    TextInputType textInputType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            title,
            style: AppTextStyles.black14,
          ),
        ),
        TextFormField(
          controller: controller,
          validator: (value) => validator(value),
          keyboardType: textInputType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: AppColors.main,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: AppColors.main,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: AppColors.main,
                width: 1,
              ),
            ),
            filled: false,
          ),
          style: AppTextStyles.black14Medium.copyWith(
            fontWeight: FontWeight.normal,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
