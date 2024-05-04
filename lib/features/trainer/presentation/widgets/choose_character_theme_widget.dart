import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/constants.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/bloc/trainer_bloc/trainer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ChooseCharacterThemeWidget extends StatefulWidget {
  final double? menuMaxHeight;

  const ChooseCharacterThemeWidget({Key? key, this.menuMaxHeight = 240})
      : super(key: key);

  @override
  State<ChooseCharacterThemeWidget> createState() =>
      _ChooseCharacterThemeWidgetState();
}

class _ChooseCharacterThemeWidgetState
    extends State<ChooseCharacterThemeWidget> {
  String? _dropdownValue = Constants.topics.first['name'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text("Выбрать тему"),
            ),
            const Gap(10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
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
                  });
                },
                items: Constants.topics.map<DropdownMenuItem<String>>((value) {
                  String name = value['name'];
                  return DropdownMenuItem<String>(
                    value: name,
                    child: Text(
                      name,
                    ),
                  );
                }).toList(),
                menuMaxHeight: 240,
              ),
            ),
          ],
        );
      },
    );
  }
}
