import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/pages/sign_up/sign_up_screen.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/widgets/bottom_app_name.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../home/data/api_source.dart';
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Theme(
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
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SvgPicture.asset('assets/images/logo.svg'),
                  SizedBox(
                    width: 140,
                    child: Image.asset('assets/images/logo.png'),
                  ),

                  const Gap(60),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [_login(), const Gap(30), _password()],
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
                                  builder: (context) => ResetPasswordScreen()));
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
                  MainButtonWidget(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        bool isSuccess = await ApiSource.postSignIn(
                          username: _loginController.text,
                          password: _passwordController.text,
                        );
                        if (isSuccess == true) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        } else {}
                      }
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Text(
                      'Войти',
                      style: AppTextStyles.black16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Gap(20),
                  MainButtonWidget(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
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
    );
  }

  Widget _password() {
    return TextFormField(
      controller: _passwordController,
      decoration: const InputDecoration(
        label: Text("Пароль"),
        suffixIcon: Icon(Icons.visibility),
      ),
    );
  }
}
