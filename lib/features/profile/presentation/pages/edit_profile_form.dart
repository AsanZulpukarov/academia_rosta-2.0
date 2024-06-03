import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/bloc/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class EditProfileForm extends StatefulWidget {
  final UserInfoEntity userInfoEntity;

  const EditProfileForm({
    super.key,
    required this.userInfoEntity,
  });

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _lastnameController.text = widget.userInfoEntity.lastname ?? "";
    _firstnameController.text = widget.userInfoEntity.firstname ?? "";
    _usernameController.text = widget.userInfoEntity.username ?? "";
    _emailController.text = widget.userInfoEntity.email ?? "";
    _phoneController.text = widget.userInfoEntity.phoneNumber ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: BlocBuilder<EditProfileBloc, EditProfileState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleAndField(
                  title: "Фамилия",
                  controller: _lastnameController,
                  validator: AppUtils.validateLastName,
                ),
                Gap(5.h),
                _titleAndField(
                  title: "Имя",
                  controller: _firstnameController,
                  validator: AppUtils.validateFirstName,
                ),
                Gap(5.h),
                _titleAndField(
                    title: "Логин",
                    controller: _usernameController,
                    validator: AppUtils.validateUsername),
                Gap(5.h),
                _titleAndField(
                  title: "Email",
                  controller: _emailController,
                  validator: AppUtils.validateEmail,
                  textInputType: TextInputType.emailAddress,
                ),
                Gap(5.h),
                _titleAndField(
                  title: "Телефон номер",
                  controller: _phoneController,
                  validator: AppUtils.validatePhone,
                  textInputType: TextInputType.number,
                ),
                Gap(20.h),
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
                              EditProfileSaveEvent(
                                UserInfoEntity(
                                  firstname: _firstnameController.text,
                                  lastname: _lastnameController.text,
                                  username: _usernameController.text,
                                  email: _emailController.text,
                                  phoneNumber: _phoneController.text,
                                ),
                              ),
                            );
                      }
                    },
                    borderRadius: BorderRadius.circular(20.r),
                    child: Text(
                      'Сохранить',
                      style: AppTextStyles.black16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  );
                }),
                Gap(10.h),
                MainButtonWidget(
                  backgroundColor: AppColors.grey,
                  onPressed: () {},
                  borderRadius: BorderRadius.circular(20.r),
                  child: Text(
                    'Отменить изменения',
                    style: AppTextStyles.black16.copyWith(
                      color: AppColors.main,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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
