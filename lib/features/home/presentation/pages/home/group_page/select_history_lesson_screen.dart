import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/container_frame_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';

class SelectHistoryLessonScreen extends StatelessWidget {
  const SelectHistoryLessonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarSecond(
        title: "Посещаемость",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
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
              DataTable(
                columns: [
                  DataColumn(
                    label: Text("ФИО"),
                  ),
                  DataColumn(
                    label: Text("Был / Не был"),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text("Асан Зулпукаров")),
                      DataCell(
                        Center(
                          child: Text(
                            "был",
                            style: AppTextStyles.black14.copyWith(
                              color: AppColors.green,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text("Марсел Маданбеков")),
                      DataCell(
                        Center(
                          child: Text(
                            "Не был",
                            style: AppTextStyles.black14.copyWith(
                              color: AppColors.mainRed,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
