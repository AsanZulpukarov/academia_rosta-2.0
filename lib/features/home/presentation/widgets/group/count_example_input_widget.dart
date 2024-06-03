import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        Gap(10.h),
        TextFormField(
          controller: _numberController,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
            filled: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            hintText: "10",
          ),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
