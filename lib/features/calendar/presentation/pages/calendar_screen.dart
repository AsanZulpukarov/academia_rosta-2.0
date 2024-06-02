import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/calendar/presentation/pages/list_point_screen.dart';
import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.all(16),
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20)),
            child: TableCalendar(
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: AppTextStyles.black14Medium.copyWith(
                  color: AppColors.mainColor,
                ),
                weekendStyle: AppTextStyles.black14Medium.copyWith(
                  color: AppColors.mainColor.withOpacity(0.5),
                ),
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
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: AppTextStyles.black16Regular.copyWith(
                  color: AppColors.mainColor,
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
          const Gap(20),
          ListPointScreen(
            selectDate: _selectedDay,
          ),
        ],
      ),
    );
  }
}
