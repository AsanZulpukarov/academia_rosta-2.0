import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/select_history_lesson_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/container_frame_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
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
    return Scaffold(
      appBar: const MyAppBarSecond(
        title: "Посещения",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ContainerFrameWidget(
              child: Column(
                children: [
                  Text(
                    "Выберите дату",
                    style: AppTextStyles.black14.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Gap(10),
                  ContainerFrameWidget(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime.now(),
                        locale: const Locale("ru"),
                      );
                    },
                    width: 160.w,
                    offset: const Offset(4, 4),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: AppColors.black,
                        ),
                        Text(
                          "09.06.2001",
                          style: AppTextStyles.black16Regular,
                        ),
                      ],
                    ),
                  ),
                  Gap(20),
                  Container(
                    width: double.infinity,
                    height: 200.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: SingleChildScrollView(
                      child: DataTable(
                        border: TableBorder(
                          horizontalInside: BorderSide(
                            color: AppColors.main.withOpacity(0.5),
                          ),
                        ),
                        columnSpacing: 0,
                        horizontalMargin: 0,

                        columns: _createColumns(),
                        rows: _createRows(),
                      ),
                    ),
                  ),
                  const Gap(20),
                  MainButtonWidget(
                    onPressed: () {},
                    borderRadius: BorderRadius.circular(20),
                    child: Text(
                      'Сохранить',
                      style: AppTextStyles.black16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(50),
            Text(
              "Последние посещения",
              style: AppTextStyles.black16Medium,
            ),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _lastLessonContainer(date: "01.01.2022"),
                _lastLessonContainer(date: "02.01.2022"),
                _lastLessonContainer(date: "03.01.2022"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _lastLessonContainer({required String date}) {
    return ContainerFrameWidget(
      height: 90.h,
      width: 100.w,
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SelectHistoryLessonScreen(),),);
      },
      offset: const Offset(4, 4),
      child: Text(
        date,
        style: AppTextStyles.black14Medium.copyWith(
          color: AppColors.main,
        ),
      ),
    );
  }
  List<DataColumn> _createColumns() {
    final double containerWidth = 20.w;
    final EdgeInsets containerPadding = EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w);

    return [
      DataColumn(
        label: Container(
          padding: containerPadding,
          width: containerWidth,
          alignment: Alignment.center,
          child: const Text("№"),
        ),
      ),
      DataColumn(
        label: Container(
          padding: containerPadding,
          width: 120.w,
          alignment: Alignment.centerLeft,
          child: const Text(
            "ФИО",
            maxLines: 2,
          ),
        ),
      ),
      DataColumn(
        label: GestureDetector(
          onTap: () {
            setState(() {
              for (var element in _students) {
                element["isSelect"] = true;
              }
            });
          },
          child: Container(
            padding: containerPadding,
            width: containerWidth,
            alignment: Alignment.center,
            child: const Icon(
              Icons.check_circle,
              color: AppColors.blue,
              size: 20,
            ),
          ),
        ),
      ),
    ];
  }

  List<DataRow> _createRows() {
    return _students.map((student) {
      final bool isSelected = student['isSelect'] == true;
      return DataRow(
        cells: [
          DataCell(
            _buildDataCell(student['id'].toString(),20.w),
          ),
          DataCell(
            _buildDataCell(student['name'],120.w),
          ),
          DataCell(
            GestureDetector(
              onTap: () {
                setState(() {
                  student["isSelect"] = !isSelected;
                });
              },
              child: _buildIconContainer(Icons.check_circle, isSelected ? AppColors.blue : AppColors.grey),
            ),
          ),
        ],
      );
    }).toList();
  }

  Widget _buildDataCell(String text,double width) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
      width: width,
      alignment: Alignment.centerLeft,
      child: Text(text),
    );
  }

  Widget _buildIconContainer(IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
      width: 20.w,
      alignment: Alignment.center,
      child: Icon(
        icon,
        color: color,
        size: 20,
      ),
    );
  }

}
