import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/pages/sign_in/sign_in_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../home/data/api_source.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String maleOrFemale = "";
  DateTime birthday = DateTime.now();

  final List<String> _list = [
    'Мужчина',
    'Женщина',
  ];
  String? _dropdownValue = 'Мужчина';

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
        appBar: MyAppBarSecond(
          title: "Анкета",
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Здравствуйте! Добро пожаловать",
                    style: AppTextStyles.black18Medium,
                  ),
                  Gap(10),
                  Text(
                    "Заполните анкету и отправьте запрос.",
                    style: AppTextStyles.black14.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Gap(20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _firstname(),
                        Gap(10),
                        _lastname(),
                        Gap(10),
                        _phone(),
                        Gap(10),
                        _polPerson(),
                        Gap(10),
                        _email(),
                        Gap(10),
                        _bDay(),
                        Gap(10),
                        _login(),
                        Gap(10),
                        _password(),
                        Gap(10),
                        _confirmPassword(),
                        Gap(10),
                        _branch(),
                      ],
                    ),
                  ),
                  const Gap(30),
                  Row(
                    children: [
                      Expanded(
                        child: MainButtonWidget(
                          onPressed: () {
                            _firstnameController.clear();
                            _lastnameController.clear();
                            _phoneController.clear();
                            _emailController.clear();
                            _loginController.clear();
                            _passwordController.clear();
                            _confirmPasswordController.clear();
                            _branchController.clear();
                          },
                          backgroundColor: AppColors.grey,
                          borderRadius: BorderRadius.circular(20),
                          child: Text(
                            'Сбросить',
                            style: AppTextStyles.black16.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                      Gap(20),
                      Expanded(
                        child: MainButtonWidget(
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
                                        builder: (context) =>
                                            const SignInScreen()));
                              } else {}
                            }
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Text(
                            'Создать',
                            style: AppTextStyles.black16.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
      ),
    );
  }

  Widget _password() {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        label: Text("Пароль"),
        suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.visibility)),
      ),
    );
  }

  Widget _firstname() {
    return TextFormField(
      controller: _firstnameController,
      decoration: const InputDecoration(
        label: Text("Имя"),
      ),
    );
  }

  Widget _lastname() {
    return TextFormField(
      controller: _lastnameController,
      decoration: const InputDecoration(
        label: Text("Фамилия"),
      ),
    );
  }

  Widget _phone() {
    return TextFormField(
      controller: _phoneController,
      decoration: const InputDecoration(
        label: Text("Номер телефона"),
      ),
      keyboardType: TextInputType.phone,
    );
  }

  Widget _confirmPassword() {
    return TextFormField(
      controller: _confirmPasswordController,
      decoration: InputDecoration(
        label: Text("Повторите пароль"),
        suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.visibility)),
      ),
    );
  }

  Widget _email() {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        label: Text("E-mail"),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _branch() {
    return TextFormField(
      controller: _branchController,
      decoration: const InputDecoration(
        label: Text("Филиал"),
      ),
    );
  }

  Widget _bDay() {
    return TextFormField(
      controller: _dateController,
      onTap: _selectDate,
      enabled: true,
      readOnly: true,
      decoration: InputDecoration(labelText: 'День рождение'),
    );
  }

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      helpText: 'День рождение',
    );
    if (newDate != null) {
      setState(() {
        _dateController.text =
            "${newDate.day}.${newDate.month < 10 ? 0 : ""}${newDate.month}.${newDate.year}";
      });
    }
  }

  Widget _polPerson() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderColor, width: 2),
      ),
      child: DropdownButton(
        isExpanded: true,
        underline: SizedBox(),
        value: _dropdownValue,
        onChanged: (String? value) {
          setState(() {
            _dropdownValue = value!;
          });
        },
        items: _list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: AppTextStyles.black14.copyWith(
                color: AppColors.borderColor,
              ),
            ),
          );
        }).toList(),
        menuMaxHeight: 160,
      ),
    );
  }
}
