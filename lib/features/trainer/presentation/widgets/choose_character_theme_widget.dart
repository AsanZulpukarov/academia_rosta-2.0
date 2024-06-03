import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/constants.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/bloc/trainer_bloc/trainer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ChooseCharacterThemeWidget extends StatefulWidget {
  final double? menuMaxHeight;

  const ChooseCharacterThemeWidget({
    Key? key,
    this.menuMaxHeight = 240,
  }) : super(key: key);

  @override
  State<ChooseCharacterThemeWidget> createState() =>
      _ChooseCharacterThemeWidgetState();
}

class _ChooseCharacterThemeWidgetState
    extends State<ChooseCharacterThemeWidget> {
  String? _dropdownValue = Constants.topics.first.code;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const Text("Выбрать тему"),
            ),
            const Gap(10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: AppColors.black),
              ),
              child: DropdownButton(
                dropdownColor: AppColors.white,
                isExpanded: true,
                underline: const SizedBox(),
                value: _dropdownValue,
                onChanged: (String? value) {
                  setState(() {
                    _dropdownValue = value!;
                    state.exerciseTrainEntity.topic = _dropdownValue;
                  });
                },
                items: Constants.topics.map<DropdownMenuItem<String>>((value) {
                  String code = value.code;
                  return DropdownMenuItem<String>(
                    value: code,
                    child: Text(
                      value.name,
                    ),
                  );
                }).toList(),
                menuMaxHeight: widget.menuMaxHeight,
              ),
            ),
          ],
        );
      },
    );
  }
}
