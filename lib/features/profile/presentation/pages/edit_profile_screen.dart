import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../app_theme.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarSecond(
        title: "Редактировать профиль",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    ProfileAvatarItem(
                      image: "boy_1",
                      radius: 60,
                      backgroundColor: AppColors.white,
                    ),
                    TextButton(
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Выберите фото:"),
                            content: Container(
                              width: MediaQuery.sizeOf(context).width.w,
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: ProfileAvatar.listAvatars.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      _currentIndex = index;
                                    },
                                    child: ProfileAvatarItem(
                                      image: ProfileAvatar.listAvatars
                                          .elementAt(index),
                                      radius: 60,
                                      backgroundColor: _currentIndex == index
                                          ? AppColors.main
                                          : AppColors.white,
                                    ),
                                  );
                                },
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Выбрать"))
                            ],
                          ),
                        );
                      },
                      child: Text(
                        "Изменить фото",
                        style: AppTextStyles.black14.copyWith(
                          color: AppColors.main,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _titleAndField(title: "Фамилия"),
              Gap(10),
              _titleAndField(title: "Имя"),
              Gap(10),
              _titleAndField(title: "Логин"),
              Gap(10),
              _titleAndField(title: "Email"),
              Gap(10),
              _titleAndField(title: "Телефон номер"),
              Gap(30),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Сохранить',
                      style: AppTextStyles.black16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleAndField({
    required String title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            title,
            style: AppTextStyles.black16Regular,
          ),
        ),
        Gap(6),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: AppColors.main,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: AppColors.main,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: AppColors.main,
                width: 1,
              ),
            ),
            filled: false,
          ),
          style: AppTextStyles.black14Medium.copyWith(
            fontWeight: FontWeight.normal,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
