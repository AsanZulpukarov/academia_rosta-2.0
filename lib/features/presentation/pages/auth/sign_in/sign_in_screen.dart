import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../learn_app_screen.dart';

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
                        onPressed: () {},
                        child: Text(
                          "Забыл пароль?",
                          style: AppTextStyles.black14
                              .copyWith(color: AppColors.main),
                        ),
                      ),
                    ],
                  ),
                  const Gap(30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LearnAppScreen()));
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.main,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Войти',
                        style: AppTextStyles.black16.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'АКАДЕМИЯ РОСТА',
                  style: AppTextStyles.black16Medium,
                ),
              ),
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
