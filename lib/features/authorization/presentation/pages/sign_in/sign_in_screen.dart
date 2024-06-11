import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/core/shared/shared_pref_source.dart';
import 'package:academia_rosta_diplom/features/authorization/data/datasources/remote/authorization_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/authorization/data/repositories/authorization_repository_impl.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/entities/sign_in_entity.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/usecases/sign_in.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/bloc/sing_in_bloc/sign_in_bloc.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/pages/sign_up/sign_up_screen.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/widgets/app_logo_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../home/presentation/pages/home/home_screen.dart';
import '../reset_password/reset_password_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isVisible = true;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prefs.setBool(SharedPrefSource.isOpenKey, true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(
        signInUseCase: SignInUseCase(
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
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 2),
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
        child: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {
            print(state);
            if (state is SignInLoadedState) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false,
              );
            } else if (state is SignInErrorState) {
              AppUtils.showSnackBar(
                context: context,
                description: state.message,
                backgroundColor: AppColors.mainRed,
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppLogoWidget(
                          width: 140.w,
                        ),
                        Gap(50.h),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _login(),
                              Gap(24.h),
                              _password(),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ResetPasswordScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Забыл пароль?",
                                style: AppTextStyles.black14
                                    .copyWith(color: AppColors.main),
                              ),
                            ),
                          ],
                        ),
                        Gap(20.h),
                        Builder(
                          builder: (context) {
                            if (state is SignInLoadingState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return MainButtonWidget(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  context.read<SignInBloc>().add(
                                        SingInButtonEvent(
                                          SignInEntity(
                                            username: _loginController.text,
                                            password: _passwordController.text,
                                          ),
                                        ),
                                      );
                                }
                              },
                              borderRadius: BorderRadius.circular(20.r),
                              child: Text(
                                'Войти',
                                style: AppTextStyles.black16.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            );
                          },
                        ),
                        Gap(20.h),
                        MainButtonWidget(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          backgroundColor: AppColors.grey,
                          borderRadius: BorderRadius.circular(20),
                          child: Text(
                            'Подать заявку',
                            style: AppTextStyles.black16.copyWith(
                              color: AppColors.main,
                            ),
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

  Widget _login() {
    return TextFormField(
      controller: _loginController,
      decoration: const InputDecoration(
        label: Text("Логин"),
        suffixIcon: Icon(Icons.person),
      ),
      validator: (value) => AppUtils.validateUsername(value),
    );
  }

  Widget _password() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _isVisible,
      decoration: InputDecoration(
        label: const Text("Пароль"),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isVisible = !_isVisible;
              });
            },
            icon: Icon(
              _isVisible ? Icons.visibility : Icons.visibility_off,
            )),
      ),
      validator: (value) => AppUtils.validatePassword(value),
    );
  }
}
