import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/authorization/data/datasources/remote/authorization_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/authorization/data/repositories/authorization_repository_impl.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/entities/sign_in_entity.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/usecases/sign_in.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/bloc/sing_in_bloc/sign_in_bloc.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/pages/sign_up/sign_up_screen.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/widgets/app_logo_widget.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/widgets/bottom_app_name.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(
          signInUseCase: SignInUseCase(
              authorizationRepository: AuthorizationRepositoryImpl(
                authorizationRemoteDataSource: AuthorizationRemoteDataSourceImpl(),
              ),),),
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
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {
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
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AppLogoWidget(
                          width: 140,
                        ),
                        const Gap(60),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _login(),
                              const Gap(30),
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
                                        builder: (context) =>
                                            ResetPasswordScreen()));
                              },
                              child: Text(
                                "Забыл пароль?",
                                style: AppTextStyles.black14
                                    .copyWith(color: AppColors.main),
                              ),
                            ),
                          ],
                        ),
                        const Gap(30),
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
                              borderRadius: BorderRadius.circular(20),
                              child: Text(
                                'Войти',
                                style: AppTextStyles.black16.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            );
                          },
                        ),
                        Gap(20),
                        MainButtonWidget(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()),
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
                    BottomAppName(),
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
