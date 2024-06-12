import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/authorization/data/datasources/remote/authorization_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/authorization/data/repositories/authorization_repository_impl.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/usecases/send_code.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/bloc/reset_password_code_bloc/reset_password_code_bloc.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/pages/sign_in/sign_in_screen.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/widgets/app_logo_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ResetPasswordCodeScreen extends StatefulWidget {
  const ResetPasswordCodeScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordCodeScreen> createState() =>
      _ResetPasswordCodeScreenState();
}

class _ResetPasswordCodeScreenState extends State<ResetPasswordCodeScreen> {
  final TextEditingController _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCodeBloc(
        sendCodeUseCase: SendCodeUseCase(
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
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.borderColor, width: 2),
              borderRadius: BorderRadius.circular(20.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 2),
              borderRadius: BorderRadius.circular(20.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 2),
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        ),
        child: BlocConsumer<ResetPasswordCodeBloc, ResetPasswordCodeState>(
          listener: (context, state) {
            if (state is ResetPasswordCodeErrorState) {
            } else if (state is ResetPasswordCodeLoadedState) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInScreen(),
                ),
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppLogoWidget(
                          width: 140.w,
                        ),
                        Gap(50.h),
                        Text(
                          "Введите код отправленный на ваш email",
                          style: AppTextStyles.black14,
                        ),
                        Gap(20.h),
                        Form(
                          key: _formKey,
                          child: _code(),
                        ),
                        Gap(30.h),
                        Builder(builder: (context) {
                          if (state is ResetPasswordCodeLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }
                          return MainButtonWidget(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ResetPasswordCodeScreen(),
                                  ),
                                );
                              }
                            },
                            borderRadius: BorderRadius.circular(20.r),
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
                            "Назад",
                            style: AppTextStyles.black14
                                .copyWith(color: AppColors.main),
                          ),
                        ),
                      ],
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

  Widget _code() {
    return TextFormField(
      controller: _codeController,
      decoration: const InputDecoration(
        label: Text("Код"),
        hintText: "xxxxxx",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Введите код';
        }
        if (value.length != 6) {
          return 'Код должен состоять из 6 цифр';
        }
        if (int.tryParse(value) == null) {
          return 'Код должен содержать только цифры';
        }
        return null;
      },
      keyboardType: TextInputType.number,
    );
  }
}
