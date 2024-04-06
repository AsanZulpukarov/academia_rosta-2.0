import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:flutter/material.dart';

class BottomAppName extends StatelessWidget {
  const BottomAppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        'АКАДЕМИЯ РОСТА',
        style: AppTextStyles.black16Medium,
      ),
    );
  }
}
