import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChooseThemeDialog extends StatefulWidget {
  const ChooseThemeDialog({Key? key}) : super(key: key);

  @override
  State<ChooseThemeDialog> createState() => _ChooseThemeDialogState();
}

class _ChooseThemeDialogState extends State<ChooseThemeDialog> {
  int selectIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 360,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectIndex = index;
              });
            },
            child: ListTile(
              title: Text(
                "ФИО",
                style: AppTextStyles.black16,
              ),
              trailing: Icon(Icons.check_circle),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 2.5,
          );
        },
      ),
    );
  }
}
