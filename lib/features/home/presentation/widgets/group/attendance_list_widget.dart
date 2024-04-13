import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttendanceListWidget extends StatefulWidget {
  const AttendanceListWidget({Key? key}) : super(key: key);

  @override
  State<AttendanceListWidget> createState() => _AttendanceListWidgetState();
}

class _AttendanceListWidgetState extends State<AttendanceListWidget> {
  final List<Map> _students = [
    {
      'id': 1,
      'name': 'Talgarbek Tilekmatov',
      'isSelect': false,
    },
    {
      'id': 2,
      'name': 'Asan Zulpukarov',
      'isSelect': true,
    },
    {
      'id': 3,
      'name': 'Asan Zulpukarov',
      'isSelect': false,
    },
    {
      'id': 4,
      'name': 'Марсел Маданбеков',
      'isSelect': true,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          leading: Text((index + 1).toString()),
          title: Text(
            _students.elementAt(index)["name"],
          ),
          trailing: IconButton(
            splashRadius: 16,
            onPressed: () {
              setState(() {
                for (var element in _students) {
                  element["isSelect"] = true;
                }
              });
            },
            icon: const Icon(
              Icons.check_circle,
              color: AppColors.blue,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          color: AppColors.main,
        );
      },
      itemCount: _students.length,
    );
  }
}
