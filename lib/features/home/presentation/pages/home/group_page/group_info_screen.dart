import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/data/models/subject_model.dart';
import 'package:academia_rosta_diplom/features/home/data/models/teacher_model.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/attendance_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/grade_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/home_work_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/student_info_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/group/show_bottom_window.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/container_frame_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../widgets/home/my_app_bar_second.dart';
import 'history_lesson_screen.dart';

class GroupInfoScreen extends StatelessWidget {
  const GroupInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarSecond(
        title: "Название группы",
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Column(
              children: [
                _row2Text(
                  title: "Предмет:",
                  subtitle: "Ментальная арифметика",
                  function: () {
                    showBottomWindowSubject(
                      context,
                      SubjectModel(
                        id: 1,
                        name: "Менталька",
                        cost: 200,
                      ),
                    );
                  },
                ),
                Gap(10),
                _row2Text(
                  title: "Учитель:",
                  subtitle: "Маданбеков Марсел",
                  function: () {
                    showBottomWindowTeacher(
                      context,
                      TeacherModel(
                          id: 1,
                          firstname: "Марсел",
                          lastname: "Маданбеков",
                          phoneNumber: "+996990551380"),
                    );
                  },
                ),
                Gap(30),
                _actionButton(context),
                Gap(30),
                _groupCalendar(),
              ],
            ),
            Gap(30),
            Container(
              decoration: ShapeDecoration(
                shadows: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.5),
                    offset: Offset(4, 4),
                    blurRadius: 8,
                  ),
                ],
                color: AppColors.secondaryColor,
                // gradient: LinearGradient(
                //   begin: Alignment.bottomRight,
                //   end: Alignment.topLeft,
                //   colors: [
                //     AppColors.secondaryColor,
                //     AppColors.secondaryColor,
                //   ],
                // ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: ListTile(
                title: Text(
                  "Студенты",
                  style: AppTextStyles.black16Regular.copyWith(
                    color: AppColors.white,
                  ),
                ),
                leading: Text(
                  "№",
                  style: AppTextStyles.black16Regular.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            Gap(10),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 7,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentInfoScreen()));
                  },
                  child: Container(
                    decoration: ShapeDecoration(
                      shadows: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.5),
                          offset: Offset(4, 4),
                          blurRadius: 8,
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [
                          AppColors.main.withOpacity(0.9),
                          AppColors.main,
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        "Asan Zulpukarov",
                        style: AppTextStyles.black16Regular.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      leading: Text(
                        (index + 1).toString(),
                        style: AppTextStyles.black16Regular.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Gap(10);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _row2Text(
      {required String title,
      required String subtitle,
      required Function function}) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: AppTextStyles.black16.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: TextButton(
            onPressed: () {
              function();
            },
            style: const ButtonStyle(
              alignment: Alignment.centerLeft,
            ),
            child: Text(
              subtitle,
              style: AppTextStyles.black16.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _actionButton(BuildContext context) {
    return Row(
      children: [
        _actionButtonAndName(
          nameIcon: 'attendance_icon.png',
          nameButton: 'Посещения',
          function: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AttendanceScreen()));
          },
        ),
        Gap(10),
        _actionButtonAndName(
          nameIcon: 'history_lesson_icon.png',
          nameButton: 'Занятия',
          function: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HistoryLessonScreen()));
          },
        ),
        Gap(10),
        _actionButtonAndName(
          nameIcon: 'home_work_icon.png',
          nameButton: 'Д/З',
          function: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeWorkScreen()));
          },
        ),
        Gap(10),
        _actionButtonAndName(
          nameIcon: 'grade_icon.png',
          nameButton: 'Оценки',
          function: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GradeScreen()));
          },
        ),
      ],
    );
  }

  Widget _actionButtonAndName({
    required String nameIcon,
    required String nameButton,
    required Function()? function,
  }) {
    return Expanded(
      child: ContainerFrameWidget(
        onTap: function,
        offset: const Offset(2, 2),
        blurRadius: 2.0,
        padding: const EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(8),
            Container(
              width: 40,
              height: 40,
              child: Image.asset("assets/icons/$nameIcon"),
            ),
            Gap(8),
            Text(
              nameButton,
              textAlign: TextAlign.center,
              style: AppTextStyles.black12Medium,
              overflow: TextOverflow.ellipsis,
            ),
            Gap(8),
          ],
        ),
      ),
    );
  }

  Widget _groupCalendar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.main),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, bottom: 8),
            child: Text(
              "Расписание",
              style: AppTextStyles.black16,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _dayNameAndTime(dayName: "ПН", time: "19:00"),
              _dayNameAndTime(dayName: "ВТ"),
              _dayNameAndTime(dayName: "СР", time: "19:00"),
              _dayNameAndTime(dayName: "ЧТ"),
              _dayNameAndTime(dayName: "ПТ", time: "19:00"),
              _dayNameAndTime(dayName: "СБ"),
              _dayNameAndTime(dayName: "ВС"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dayNameAndTime({
    required String dayName,
    String? time,
  }) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: time == null ? AppColors.white : AppColors.main,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.main),
            ),
            alignment: Alignment.center,
            child: Text(
              dayName,
              style: AppTextStyles.black16.copyWith(
                color: time == null ? AppColors.black : AppColors.white,
              ),
            ),
          ),
          Gap(6),
          Text(
            time ?? "",
            style: AppTextStyles.black16,
          ),
        ],
      ),
    );
  }
}
