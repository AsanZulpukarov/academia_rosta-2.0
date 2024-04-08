import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CountExampleInputWidget extends StatefulWidget {
  const CountExampleInputWidget({Key? key}) : super(key: key);

  @override
  State<CountExampleInputWidget> createState() =>
      _CountExampleInputWidgetState();
}

class _CountExampleInputWidgetState extends State<CountExampleInputWidget> {
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Кол.примеров",
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(10),
        TextFormField(
          controller: _numberController,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            filled: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            hintText: "10",
          ),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
