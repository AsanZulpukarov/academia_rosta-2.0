import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/student_entity.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/grade_bloc/grade_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseStudentsDialog extends StatefulWidget {
  final List<StudentEntity> students;

  const ChooseStudentsDialog({Key? key, required this.students})
      : super(key: key);

  @override
  State<ChooseStudentsDialog> createState() => _ChooseStudentsDialogState();
}

class _ChooseStudentsDialogState extends State<ChooseStudentsDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GradeBloc, GradeState>(
      builder: (context, state) {
        return SizedBox(
          height: 360.h,
          width: 300.w,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: widget.students.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    widget.students[index].isAttended =
                        !(widget.students[index].isAttended ?? false);
                  });
                },
                child: ListTile(
                  title: Text(
                    widget.students[index].getFullName(),
                    style: AppTextStyles.black16,
                  ),
                  trailing: Icon(
                    Icons.check_circle,
                    color: widget.students[index].isAttended == true
                        ? AppColors.blue
                        : AppColors.grey,
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 2.5,
              );
            },
          ),
        );
      },
    );
  }
}
