import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/authorization/data/datasources/remote/authorization_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/authorization/data/repositories/authorization_repository_impl.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/usecases/reset_password.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/bloc/reset_password_bloc/reset_password_bloc.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/pages/reset_password/reset_password_code_screen.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/widgets/app_logo_widget.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/widgets/bottom_app_name.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../app_text_styles.dart';
import '../../../../../app_theme.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _loginController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordBloc(
        resetPasswordUseCase: ResetPasswordUseCase(
          authorizationRepository: AuthorizationRepositoryImpl(
            authorizationRemoteDataSource: AuthorizationRemoteDataSourceImpl(),
          ),
        ),
      ),
      child: Theme(
        data: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: AppTextStyles.black14.copyWith(
              color: AppColors.borderColor,
            ),
            suffixIconColor: AppColors.borderColor,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        child: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordErrorState) {
              AppUtils.showSnackBar(
                  context: context, description: state.message);
            } else if (state is ResetPasswordLoadedState) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ResetPasswordCodeScreen(),
                ),
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppLogoWidget(
                          width: 140.w,
                        ),
                        Gap(60.h),
                        Text(
                          "Для сброса пароля напишите свой логин",
                          style: AppTextStyles.black14,
                        ),
                        Gap(20.h),
                        Form(
                          key: _formKey,
                          child: _login(),
                        ),
                        Gap(30.h),
                        Builder(builder: (context) {
                          if (state is ResetPasswordLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }
                          return MainButtonWidget(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<ResetPasswordBloc>().add(
                                      ResetPasswordButtonTapEvent(
                                          username: _loginController.text),
                                    );
                              }
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Text(
                              'Отправить',
                              style: AppTextStyles.black16.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          );
                        }),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Вернуться в войти",
                            style: AppTextStyles.black14
                                .copyWith(color: AppColors.main),
                          ),
                        ),
                      ],
                    ),
                    const BottomAppName(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _login() {
    return TextFormField(
      controller: _loginController,
      decoration: const InputDecoration(
        label: Text("Логин"),
      ),
      validator: (value) => AppUtils.validateUsername(value),
    );
  }
}
