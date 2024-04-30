import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileBloc(),
      child: Scaffold(
        appBar: const MyAppBarSecond(
          title: "Редактировать профиль",
        ),
        body: BlocConsumer<EditProfileBloc, EditProfileState>(
          listener: (context, state) {
            if (state is EditProfileErrorState) {
              AppUtils.showSnackBar(
                  context: context, description: state.message);
            } else if (state is EditProfileLoadedState) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
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
                                  title: Text(
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
                        return Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      return MainButtonWidget(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<EditProfileBloc>()
                                .add(EditProfileSaveEvent());
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
              borderSide: BorderSide(
                color: AppColors.main,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: AppColors.main,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
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
