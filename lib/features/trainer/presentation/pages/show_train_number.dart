import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app_text_styles.dart';

class ShowTrainNumber extends StatefulWidget {
  final List<int> number;
  const ShowTrainNumber({Key? key, required this.number}) : super(key: key);

  @override
  State<ShowTrainNumber> createState() => _ShowTrainNumberState();
}

class _ShowTrainNumberState extends State<ShowTrainNumber> {
  @override
  Widget build(BuildContext context) {
    String number = "-1";
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 360,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        number,
        style: AppTextStyles.black20Bold
            .copyWith(fontSize: (6 * (18 - number.length)).sp),
      ),
    );
  }
}
