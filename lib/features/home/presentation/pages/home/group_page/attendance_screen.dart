import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/select_history_lesson_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/container_frame_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
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
      appBar: MyAppBarSecond(
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
                  Gap(10),
                  ContainerFrameWidget(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime.now(),
                        locale: Locale("ru"),
                      );
                    },
                    width: 160.w,
                    offset: Offset(4, 4),
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
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
                  DataTable(
                    headingRowHeight: 30.h,
                    border: TableBorder(
                      horizontalInside: BorderSide(
                        color: AppColors.main.withOpacity(0.5),
                      ),
                    ),
                    columns: _createColumns(),
                    rows: _createRows(),
                  ),
                  Gap(20),
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
                builder: (context) => SelectHistoryLessonScreen()));
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
    return [
      DataColumn(
        label: Expanded(child: Text("№")),
      ),
      DataColumn(
        label: Expanded(child: Text("ФИО")),
      ),
      DataColumn(
        label: Expanded(
          child: IconButton(
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
        ),
      ),
    ];
  }

  List<DataRow> _createRows() {
    return _students
        .map(
          (student) => DataRow(
            cells: [
              DataCell(Text(student['id'].toString())),
              DataCell(Text(student['name'])),
              DataCell(
                IconButton(
                  splashRadius: 16,
                  onPressed: () {
                    setState(() {
                      student['isSelect'] = !student['isSelect'];
                    });
                  },
                  icon: Icon(
                    Icons.check_circle,
                    color: student['isSelect'] == true
                        ? AppColors.blue
                        : AppColors.grey,
                  ),
                ),
              ),
            ],
          ),
        )
        .toList();
  }
}
