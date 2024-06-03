import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:academia_rosta_diplom/features/profile/data/datasources/remote/profile_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/edit_password_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/change_password.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/bloc/change_password/change_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../app_text_styles.dart';
import '../../../../../app_theme.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordBloc(
        changePasswordUseCase: ChangePasswordUseCase(
          ProfileRepositoryImpl(
            profileRemoteDataSource: ProfileRemoteDataSourceImpl(),
          ),
        ),
      ),
      child: Scaffold(
        appBar: const MyAppBarSecond(
          title: 'Изменить пароль',
        ),
        body: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
          listener: (BuildContext context, ChangePasswordState state) {
            if (state is ChangePasswordErrorState) {
              AppUtils.showSnackBar(
                  context: context, description: state.message);
            } else if (state is ChangePasswordLoadedState) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: Text(
                        "Новый пароль",
                        style: AppTextStyles.black14,
                      ),
                    ),
                    _passwordField(context),
                    Gap(5.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: Text(
                        "Потверждение пароля",
                        style: AppTextStyles.black14,
                      ),
                    ),
                    _confirmPasswordField(context),
                    Gap(20.h),
                    Builder(
                      builder: (context) {
                        if (state is ChangePasswordLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                        return MainButtonWidget(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<ChangePasswordBloc>().add(
                                    ChangePasswordSaveEvent(
                                      editPasswordEntity: EditPasswordEntity(
                                        password: _newPassword.text,
                                        confirmPassword: _confirmPassword.text,
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
                      },
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

  Widget _passwordField(BuildContext context) {
    return TextFormField(
      controller: _newPassword,
      obscureText: isVisible,
      validator: (value) => AppUtils.validatePassword(value),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          splashRadius: 20.r,
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: AppColors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(
            color: AppColors.main,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(
            color: AppColors.main,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(
            color: AppColors.main,
            width: 1,
          ),
        ),
        filled: false,
      ),
      style: AppTextStyles.black12Medium.copyWith(
        fontWeight: FontWeight.normal,
        color: AppColors.black,
      ),
    );
  }

  Widget _confirmPasswordField(BuildContext context) {
    return TextFormField(
      controller: _confirmPassword,
      obscureText: isVisible,
      validator: (value) =>
          AppUtils.validateConfirmPassword(value, _newPassword.text),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          splashRadius: 20.r,
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: AppColors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(
            color: AppColors.main,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(
            color: AppColors.main,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(
            color: AppColors.main,
            width: 1,
          ),
        ),
        filled: false,
      ),
      style: AppTextStyles.black12Medium.copyWith(
        fontWeight: FontWeight.normal,
        color: AppColors.black,
      ),
    );
  }
}
