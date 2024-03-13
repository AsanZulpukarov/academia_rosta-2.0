import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  final List<Color> _randomColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.deepPurple,
    Colors.deepOrangeAccent,
    Colors.yellowAccent,
    Colors.indigo,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [AppColors.main.withOpacity(0.1), AppColors.white],
              ),
            ),
            child: TableCalendar(
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: AppTextStyles.black14Medium,
              ),
              daysOfWeekHeight: 30,
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: AppColors.main.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: const BoxDecoration(
                  color: AppColors.main,
                  shape: BoxShape.circle,
                ),
              ),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              locale: 'ru',
              headerStyle: HeaderStyle(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.blackOpacity65,
                    ),
                  ),
                ),
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: AppTextStyles.black16Regular.copyWith(
                  color: AppColors.blackOpacity65,
                ),
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
              onDaySelected: (selectedDay, focusedDay) {
                setState(
                  () {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  },
                );
              },
            ),
          ),
          Gap(10),
          ListView.separated(
            padding: const EdgeInsets.all(20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.25),
                          blurRadius: 4,
                          offset: Offset(4, 4),
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "25",
                              style: AppTextStyles.black20Bold.copyWith(
                                color: AppColors.main,
                              ),
                            ),
                            Text(
                              "Март",
                              style: AppTextStyles.black16.copyWith(
                                color: AppColors.main,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        color: AppColors.main,
                        thickness: 3,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Expanded(
                          flex: 3,
                          child: ListTile(
                            title: Text("Ментальная арифметика"),
                            subtitle: Text("Описание"),
                          )),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Gap(20);
            },
          ),
        ],
      ),
    );
  }
}
