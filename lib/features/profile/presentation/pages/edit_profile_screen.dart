import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/pages/choose_photo_dialog.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../app_theme.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  int _selectImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarSecond(
        title: "Редактировать профиль",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    ProfileAvatarItem(
                      image: ProfileAvatar.listAvatars
                          .elementAt(_selectImageIndex),
                      radius: 60,
                      backgroundColor: AppColors.white,
                    ),
                    TextButton(
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: AppColors.white,
                            title: Text(
                              "Выберите фото:",
                              style: AppTextStyles.black16,
                            ),
                            content: ChoosePhotoDialog(
                              currentPhotoIndex: _selectImageIndex,
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
              Gap(5),
              _titleAndField(title: "Имя"),
              Gap(5),
              _titleAndField(title: "Логин"),
              Gap(5),
              _titleAndField(title: "Email"),
              Gap(5),
              _titleAndField(title: "Телефон номер"),
              Gap(20),
              MainButtonWidget(
                onPressed: () {},
                borderRadius: BorderRadius.circular(20),
                child: Text(
                  'Сохранить',
                  style: AppTextStyles.black16.copyWith(
                    color: AppColors.white,
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
            style: AppTextStyles.black14,
          ),
        ),
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
