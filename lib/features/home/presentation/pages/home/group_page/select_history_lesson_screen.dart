import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/lesson_entity.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/container_frame_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectHistoryLessonScreen extends StatelessWidget {
  final LessonEntity lesson;

  const SelectHistoryLessonScreen({Key? key, required this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarSecond(
        title: "Посещаемость",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ContainerFrameWidget(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "02.02.2024",
                style: AppTextStyles.black18Medium.copyWith(
                  color: AppColors.main,
                ),
              ),
              Container(
                width: double.infinity,
                child: DataTable(
                  dataTextStyle: AppTextStyles.black12,
                  headingTextStyle: AppTextStyles.black14Medium,
                  columns: _createColumns(),
                  rows: _createRows(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DataColumn> _createColumns() {
    final double containerWidth = 20.w;
    final EdgeInsets containerPadding =
        EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w);

    return [
      DataColumn(
        label: Container(
          width: 120.w,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          alignment: Alignment.centerLeft,
          child: Text("ФИО"),
        ),
      ),
      DataColumn(
        label: Container(
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          alignment: Alignment.centerLeft,
          child: Text("Был/Не был"),
        ),
      ),
    ];
  }

  List<DataRow> _createRows() {
    return lesson.students!.map((student) {
      return DataRow(
        cells: [
          DataCell(
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
              width: 120.w,
              alignment: Alignment.centerLeft,
              child: Text(
                student.getFullName(),
                style: AppTextStyles.black14,
              ),
            ),
          ),
          DataCell(
            _buildDataCell(student.isAttended ?? false, 100.w),
          ),
        ],
      );
    }).toList();
  }

  Widget _buildDataCell(bool attendance, double width) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
      width: width,
      alignment: Alignment.center,
      child: Text(
        attendance ? "Был" : "Не был",
        style: AppTextStyles.black14.copyWith(
          color: attendance ? AppColors.green : AppColors.mainRed,
        ),
      ),
    );
  }
}
