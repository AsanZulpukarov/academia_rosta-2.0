import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';
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
  final List<String> _list = [
    'One',
    'Two',
    'Three',
    'Four',
  ];

  String? _dropdownValue = "One";

  @override
  Widget build(BuildContext context) {
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
                ),
              );
            }).toList(),
            menuMaxHeight: 240,
          ),
        ),
      ],
    );
  }
}
