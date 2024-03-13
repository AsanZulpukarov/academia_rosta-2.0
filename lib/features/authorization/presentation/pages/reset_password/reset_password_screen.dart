import 'package:flutter/material.dart';
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
                    child: _login(),
                  ),
                  const Gap(30),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.main,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Отправить',
                        style: AppTextStyles.black16.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Вернуться в войти",
                      style:
                          AppTextStyles.black14.copyWith(color: AppColors.main),
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
