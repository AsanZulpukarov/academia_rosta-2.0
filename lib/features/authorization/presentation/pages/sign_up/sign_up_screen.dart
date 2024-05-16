import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/authorization/data/datasources/remote/authorization_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/authorization/data/repositories/authorization_repository_impl.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/entities/sign_up_entity.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/usecases/sign_up.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/bloc/sing_up_bloc/sign_up_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
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
  bool _isVisible = true;

  final List<String> _list = [
    'Мужчина',
    'Женщина',
  ];
  String? _polPersonValue = 'Мужчина';

  final _formKey = GlobalKey<FormState>();

  final _usernameFocusNode = FocusNode();
  final _firstnameFocusNode = FocusNode();
  final _lastnameFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _branchFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _firstnameFocusNode.dispose();
    _lastnameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    _branchFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(
        signUpUseCase: SignUpUseCase(
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
        child: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpLoadedState) {
              AppUtils.showSnackBar(
                context: context,
                title: "Регистрация",
                description: "Ваша заявка принята!",
              );
              Navigator.pop(context);
            } else if (state is SignUpErrorState) {
              AppUtils.showSnackBar(
                context: context,
                description: state.message,
                backgroundColor: AppColors.mainRed,
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: const MyAppBarSecond(
                title: "Анкета",
              ),
              body: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Здравствуйте! Добро пожаловать",
                          style: AppTextStyles.black18Medium,
                        ),
                        const Gap(10),
                        Text(
                          "Заполните анкету и отправьте запрос.",
                          style: AppTextStyles.black14.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const Gap(20),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _firstname(),
                              const Gap(10),
                              _lastname(),
                              const Gap(10),
                              _phone(),
                              const Gap(10),
                              _polPerson(),
                              const Gap(10),
                              _email(),
                              const Gap(10),
                              _bDay(),
                              const Gap(10),
                              _login(),
                              const Gap(10),
                              _password(),
                              const Gap(10),
                              _confirmPassword(),
                              const Gap(10),
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
                                  _usernameController.clear();
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
                            const Gap(20),
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  if (state is SignUpLoadingState) {
                                    return const Center(
                                      child:
                                          CircularProgressIndicator.adaptive(),
                                    );
                                  }
                                  return MainButtonWidget(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<SignUpBloc>().add(
                                              SingInButtonEvent(
                                                signUpEntity: SignUpEntity(
                                                  username:
                                                      _usernameController.text,
                                                  firstname:
                                                      _firstnameController.text,
                                                  lastname:
                                                      _lastnameController.text,
                                                  email: _emailController.text,
                                                  password:
                                                      _passwordController.text,
                                                  confirmPassword:
                                                      _confirmPasswordController
                                                          .text,
                                                  polPerson: _polPersonValue,
                                                  branch:
                                                      _branchController.text,
                                                  bDay: DateTime.parse(
                                                      _dateController.text),
                                                  phone: _phoneController.text,
                                                ),
                                              ),
                                            );
                                      }
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    child: Text(
                                      'Создать',
                                      style: AppTextStyles.black16.copyWith(
                                        color: AppColors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
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
      controller: _usernameController,
      focusNode: _usernameFocusNode,
      decoration: const InputDecoration(
        label: Text("Логин"),
      ),
      validator: (value) => AppUtils.validateUsername(value),
      onFieldSubmitted: (_) {
        _fieldFocusChange(context, _usernameFocusNode, _passwordFocusNode);
      },
    );
  }

  Widget _password() {
    return TextFormField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
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
          ),
        ),
      ),
      validator: (value) => AppUtils.validatePassword(value),
      onFieldSubmitted: (_) {
        _fieldFocusChange(
            context, _passwordFocusNode, _confirmPasswordFocusNode);
      },
    );
  }

  Widget _firstname() {
    return TextFormField(
      controller: _firstnameController,
      focusNode: _firstnameFocusNode,
      decoration: const InputDecoration(
        label: Text("Имя"),
      ),
      validator: (value) => AppUtils.validateFirstName(value),
      onFieldSubmitted: (_) {
        _fieldFocusChange(context, _firstnameFocusNode, _lastnameFocusNode);
      },
    );
  }

  Widget _lastname() {
    return TextFormField(
      controller: _lastnameController,
      focusNode: _lastnameFocusNode,
      decoration: const InputDecoration(
        label: Text("Фамилия"),
      ),
      validator: (value) => AppUtils.validateLastName(value),
      onFieldSubmitted: (_) {
        _fieldFocusChange(context, _lastnameFocusNode, _phoneFocusNode);
      },
    );
  }

  Widget _phone() {
    return TextFormField(
      controller: _phoneController,
      focusNode: _phoneFocusNode,
      decoration: const InputDecoration(
        label: Text("Номер телефона"),
      ),
      keyboardType: TextInputType.phone,
      validator: (value) => AppUtils.validatePhone(value),
      onFieldSubmitted: (_) {
        _fieldFocusChange(context, _phoneFocusNode, _emailFocusNode);
      },
    );
  }

  Widget _confirmPassword() {
    return TextFormField(
      controller: _confirmPasswordController,
      focusNode: _confirmPasswordFocusNode,
      obscureText: _isVisible,
      decoration: InputDecoration(
        label: const Text("Повторите пароль"),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          icon: Icon(
            _isVisible ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      validator: (value) =>
          AppUtils.validateConfirmPassword(value, _passwordController.text),
      onFieldSubmitted: (_) {
        _fieldFocusChange(context, _confirmPasswordFocusNode, _branchFocusNode);
      },
    );
  }

  Widget _email() {
    return TextFormField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration: const InputDecoration(
        label: Text("E-mail"),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) => AppUtils.validateEmail(value),
      onFieldSubmitted: (_) {
        _fieldFocusChange(context, _emailFocusNode, _usernameFocusNode);
      },
    );
  }

  Widget _branch() {
    return TextFormField(
      controller: _branchController,
      focusNode: _branchFocusNode,
      decoration: const InputDecoration(
        label: Text("Филиал"),
      ),
      validator: (value) => AppUtils.validateBranch(value),
    );
  }

  Widget _bDay() {
    return TextFormField(
      controller: _dateController,
      onTap: _selectDate,
      enabled: true,
      readOnly: true,
      validator: (value) => AppUtils.validateBirthDate(value),
      decoration: const InputDecoration(labelText: 'День рождение'),
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
        underline: const SizedBox(),
        value: _polPersonValue,
        onChanged: (String? value) {
          setState(() {
            _polPersonValue = value!;
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
